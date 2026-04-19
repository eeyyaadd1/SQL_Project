/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Engineer jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

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

/*
- Here's the breakdown of the most demanded skills for data engineers in 2023, based on job postings:
- Python is leading with a bold count of 7.
- Spark follows closely with a bold count of 5.
- Other skills like Hadoop, Kafka, Scala, Pandas, PySpark, NumPy, SQL, Kubernetes show varying degrees of demand.

[
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "company_name": "Durlston Partners",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "company_name": "Durlston Partners",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "salary_year_avg": "251000.0",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "salary_year_avg": "251000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "salary_year_avg": "251000.0",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "salary_year_avg": "251000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "salary_year_avg": "251000.0",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "salary_year_avg": "251000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "salary_year_avg": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "salary_year_avg": "250000.0",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "salary_year_avg": "250000.0",
    "skills": "azure"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "salary_year_avg": "245000.0",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "salary_year_avg": "245000.0",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "salary_year_avg": "245000.0",
    "skills": "gcp"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "company_name": "Handshake",
    "salary_year_avg": "245000.0",
    "skills": "go"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "salary_year_avg": "242000.0",
    "skills": "sql"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "salary_year_avg": "242000.0",
    "skills": "python"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "salary_year_avg": "242000.0",
    "skills": "java"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "salary_year_avg": "242000.0",
    "skills": "perl"
  }
]
*/