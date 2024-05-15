
# Library Analytics and Investigating Usage Trends

This project explores techniques for analyzing library usage data using Advanced SQL. As a Data Analyst Lead, you'll leverage these techniques to answer critical questions from librarians and management, gaining insights into library operations and user behavior.

## What is Library Analytics?

Library Analytics involves analyzing a library's entire workflow, from resource acquisition to user interactions. This analysis helps identify areas for improvement, leading to:

- **Improved Resource Selection**: Align resource selection with user preferences.
- **Enhanced User Experience**: Streamline resource discovery and borrowing processes.
- **Effective Resource Management**: Optimize resource allocation and usage.
- **Data-Driven Decision Making**: Make informed decisions based on user behavior insights.

## Investigating Usage Spikes

A crucial aspect of Library Analytics is investigating unexpected spikes or dips in key metrics. This includes understanding questions like:

- Did eBook downloads plummet this month?
- Has the new self-checkout system impacted borrowing efficiency?
- How many library resources were borrowed per hour last quarter?

By analyzing data and identifying trends, you can provide valuable insights to librarians and management to optimize library services.

## Case Studies

This project includes two case studies that demonstrate how to analyze library usage data using SQL:

### Case Study 1: Library Transactions

This case study focuses on a dataset containing library transaction information (`transactions.csv`). You'll be tasked with:

- **Resource Popularity**: Calculate the number of times each resource is borrowed per month for a specific period (e.g., past year).
- **Throughput**: Analyze the throughput (transactions per hour) and calculate its daily or 7-day rolling average. Explore the advantages of each approach.
- **Language Preferences**: Determine the percentage share of resources borrowed in each language over the past 6 months.
- **Duplicate Transactions**: Identify and handle duplicate transactions within the data, ensuring data accuracy.

### Case Study 2: User Activity (Users and Events)

The second case study involves analyzing user activity data across two tables:

- `users.csv`: Stores user account information.
- `events.csv`: Captures user actions (login, search, borrow, etc.) with timestamps and device type.

Here, you'll calculate key user engagement metrics:

- **Weekly User Engagement**: Measure the percentage of active users each week.
- **User Growth**: Analyze the monthly growth rate of new users.
- **Weekly Retention**: Calculate the percentage of users retained weekly after signup, categorized by signup cohort.
- **Weekly Engagement per Device**: Analyze user engagement segmented by device type (desktop, mobile, etc.).
- **Email Engagement (Optional)**: If available, evaluate user interaction with library email services.

By calculating and analyzing these metrics, you can gain insights into user behavior and identify areas for improvement within the library's services and resource availability.

## Conclusion

This project provides a foundation for using SQL to extract valuable insights from library usage data. Feel free to explore further analyses and adapt the provided queries to fit your specific library's needs!

