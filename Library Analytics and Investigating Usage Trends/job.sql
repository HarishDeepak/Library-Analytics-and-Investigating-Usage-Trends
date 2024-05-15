-- create database jobs;
-- CREATE TABLE job_data
-- (
--     ds DATE,
--     job_id INT NOT NULL,
--     actor_id INT NOT NULL,
--     event VARCHAR(15) NOT NULL,
--     language VARCHAR(15) NOT NULL,
--     time_spent INT NOT NULL,
--     org CHAR(2)
-- );
-- use job

-- INSERT INTO job_data (ds, job_id, actor_id, event, language, time_spent, org)
-- VALUES ('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
--     ('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
--     ('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
--     ('2020-11-28', 23, 1005,'transfer', 'Persian', 22, 'D'),
--     ('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
--     ('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
--     ('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
--     ('2020-11-25', 20, 1003, 'transfer', 'Italian', 45, 'C');
-- drop table job_data;
use job;

select * from job_data;
select avg(t) as 'avg jobs reviewed per day per hour',
avg(p) as 'avg jobs reviewed per day per second'
from
(select 
ds,
((count(job_id)*3600)/sum(time_spent)) as t,
((count(job_id))/sum(time_spent)) as p
from 
job_data
where 
month(ds)=11
group by ds) a;

select
ds,
c/t as throuput_per_day,
c7/s7 as throuput_7_day_rolling
from
(select 
ds,
count(job_id) as c,
sum(time_spent) as t,
count(job_id) over(order by ds rows between  6 preceding  and current row) as c7,
sum(time_spent) over(order by ds rows between 6 preceding  and current row) as s7
from 
job_data
-- where  
-- ds in (select max(ds) from job_data) 
group by ds) a;

with a as 
(select max(ds)  as m from job_data)
select distinct
language,
(count(event) over(partition by language rows between unbounded preceding and unbounded following) /count(*) over(order by ds rows between unbounded preceding and unbounded following) ) * 100 as precentage
  from
(select 
*
from
job_data cross join a
where
datediff(m,date(ds)) between 0 and 30
)a1;

select *
from
(select 
*,
row_number() over(partition by ds,actor_id,job_id) as row_num
from 
job_data) a
where row_num>1;




