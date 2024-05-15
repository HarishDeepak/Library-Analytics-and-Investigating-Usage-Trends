use user_event_email_db;
select *,
engagement-lag(engagement) over(partition by'week of the year') as 'weekly engagement growth'
from
(select week(occurred_at) as 'week of the year',
count(event_name) as 'engagement'
from events where event_type!='signup_flow'
group by week(occurred_at))a;

select *,
new_user_activated-lag(new_user_activated) over( order by year_,quarter_ ) as user_growth
from
(select 
year(created_at) as year_,
quarter(created_at) as quarter_,
count(user_id) as new_user_activated from users 
where activated_at is not null 
and 
state='active'
group by 1,2
)a ;

select
week_period,
first_value(cohort_retained) over (order by week_period) as cohort_size,
cohort_retained,
cohort_retained / first_value(cohort_retained) over (order by week_period) as pct_retained 
from
(
select
timestampdiff(week,a.activated_at,b.occurred_at) as week_period,
count(distinct a.user_id) as cohort_retained
from
(select user_id, activated_at from users where state='active'group by 1) a
inner join
(select user_id,occurred_at from events )b 
on a.user_id=b.user_id
group by 1) c;

select
device_name,
avg(num_users_using_device) as avg_weekly_users,
avg(times_device_use_current_week) as avg_times_used_weekly
from
(select week(occurred_at) as week,
device as device_name ,
count(distinct user_id) as num_users_using_device,
count(device) as times_device_use_current_week 
from events
where event_name='login'
group by 1,2
order by 1) a
group by 1
order by 2 desc,3 desc;

select
week,
num_users,
time_weekly_digest_sent,
time_weekly_digest_sent-lag(time_weekly_digest_sent) over(order by week) as time_weekly_digest_sent_growth,
time_email_open,
time_email_open-lag(time_email_open) over(order by week) as time_email_open_growth,
time_email_clickthrough,
time_email_clickthrough-lag(time_email_clickthrough) over(order by week) as time_email_clickthrough_growth
from
(select week(occurred_at)as week,
count(distinct user_id) as num_users, 
sum(if(action='sent_weekly_digest',1,0)) as time_weekly_digest_sent,
sum(if(action='email_open',1,0)) as time_email_open,
sum(if(action='email_clickthrough',1,0)) as time_email_clickthrough
 from email 
 group by 1
 order by 1) a;


