# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data Engineering.

🔍 SQL queries? Check them out here: [Project Folder](/Project)

# Background

Driven by a quest to navigate the data Engineers job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data Engineers jobs?

2. What skills are required for these top-paying jobs?

3. What skills are most in demand for data Engineers?

4. Which skills are associated with higher Engineers?

5. What are the most optimal skills to learn?

# tools I Used

For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- SQL: The backbone of my analysis, allowing me to query the database and unearth critical insights.

- PostgreSQL: The chosen database management system, ideal for handling the job posting data.

- Visual Studio Code: My go-to for database management and executing SQL queries.

- Git & GitHub: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data Engineers job market. Here’s how I approached each question:

### 1. Top Paying Data Engineers Jobs
To identify the highest-paying roles, I filtered data Engineers positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
	job_title,
    name AS company_name,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date
FROM job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Engineer' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data engineer jobs in 2023:
- Wide Salary Range: Top 10 paying data engineer roles span from $242,000 to $325,000, indicating significant salary potential in the field.

- Diverse Employers: Companies like Engtal, Durlston Partners, and Twitch are among those offering high salaries, showing a broad interest across different industries.

![Top Paying Jobs](Top%20paying%20jobs.png)
#### Bar graph visualizing the salary for the top 10 salaries for data engineers; Gemeni generated this graph from my SQL query results


### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM job_postings_fact

    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

    WHERE
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL

    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*, skills
FROM top_paying_jobs

LEFT JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY salary_year_avg DESC;
```
- Here's the breakdown of the most demanded skills for data engineers in 2023, based on job postings:
- Python is leading with a bold count of 7.
- Spark follows closely with a bold count of 5.
- Other skills like Hadoop, Kafka, Scala, Pandas, PySpark, NumPy, SQL, Kubernetes show varying degrees of demand.

![Top Paying Skills](Top%20paying%20skills.png)
#### Bar graph visualizing the count of skills for the top 10 paying jobs for data engineers; Gemeni generated this graph from my SQL query results


### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Engineer' 
    AND job_work_from_home = True 

GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Here's the breakdown of the most demanded skills for data engineers in 2023

- SQL and Python remain dominant, highlighting the absolute necessity of mastering core query languages and versatile programming for building robust data pipelines.

- Cloud and Big Data Technologies like AWS, Azure, and Spark are essential, reflecting the industry's shift toward scalable infrastructure and high-volume distributed processing.

|Skills  |Demand Count|
|--------|------------|
|sql     |14213       |
|python  |13893       |
|aws     |8570        |
|azure   |6997        |
|spark   |6612        |

#### Table of the demand for the top 5 skills in data engineers job postings


### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Engineer' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True

GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
Here's a breakdown of the results for top paying skills for Data Analysts:

- Niche & High-Performance Languages: Top salaries are driven by specialized languages (Assembly, Rust, Clojure), reflecting a premium on systems optimization and hardware-level engineering expertise.

- Modern Database & API Mastery: Proficiency in NoSQL, Graph databases, and GraphQL (Mongo, Neo4j, Cassandra) indicates high valuation for engineers capable of architecting complex, non-relational data systems.

- Infrastructure & Stream Processing: High earnings in tools like Kubernetes, Kafka, and Redis underscore the demand for scaling distributed systems and managing high-velocity, real-time data pipelines.

|Skills   |Average Salary($)|
|---------|-----------------|
|assembly |19250            |
|mongo    |182223           |
|ggplot2  |176250           |
|rust     |172819           |
|clojure  |170867           |
|perl     |169000           |
|neo4j    |166559           |
|solidity |166250           |
|graphql  |162547           |
|julia    |160500           |

#### Table of the average salary for the top 10 paying skills for data engineers


### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 

GROUP BY
    skills_dim.skill_id

HAVING
    COUNT(skills_job_dim.job_id) > 10

ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
|Skill Id |Skills        |Demand Count |Average Salary($)|
|---------|--------------|-------------|-----------------|
|213      |kubernetes    |56           |158190           |
|94       |numpy         |14           |157592           |
|63       |cassandra     |19           |150549           |
|27       |golang        |11           |147818           |
|212      |terraform     |44           |146057           |
|93       |pandas        |38           |144656           |
|59       |elasticsearch |21           |144102           |
|144      |ruby          |14           |144000           |
|83       |aurora        |11           |142887           |

#### Table of the most optimal skills for data engineers sorted by salary

Here’s a breakdown of the most optimal skills for Data Engineers in 2023:

- High-End Infrastructure: Mastery of Kubernetes ($158k) and Terraform ($146k) carries the highest salary premium, reflecting the massive value placed on cloud automation and container orchestration.

- Data Streaming & Workflow: Tools like Spark, Kafka, and Airflow are the most "optimal"—they combine high demand (up to 237 mentions) with strong salaries ($138k–$150k), making them core requirements for modern pipelines.

- Specialized Python & ML: Deep expertise in libraries like NumPy ($157k) and PyTorch ($142k) pays significantly better than general programming, rewarding engineers who can bridge the gap between data engineering and machine learning.

- NoSQL & Scalable Storage: Expertise in distributed systems like Cassandra ($151k) and MongoDB ($138k) remains critical as companies continue to scale beyond traditional relational databases.

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- 🧩 Complex Query Crafting: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.

- 📊 Data Aggregation: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.

- 💡 Analytical Wizardry: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions
## Insights
From the analysis, several general insights emerged

1. Top-Paying Data Engineers Jobs: The highest-paying jobs for data Engineers that allow remote work offer a wide range of salaries, the highest at $325,000!

2. Skills for Top-Paying Jobs: High-paying data engineer jobs require advanced proficiency in Python & Spark, suggesting it’s a critical skill for earning a top salary.

3. Most In-Demand Skills: SQL & Python is also the most demanded skill in the data engineer job market, thus making it essential for job seekers.

4. Skills with Higher Salaries: Specialized skills, such as assembly and mongo, are associated with the highest average salaries, indicating a premium on niche expertise.

5. Optimal Skills for Job Market Value: kubernetes & numpy lead in demand and offers for a high average salary, positioning it as one of the most optimal skills for data engineers to learn to maximize their market value.

## Closing Thoughts
#### This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.

