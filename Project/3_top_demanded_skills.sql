/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data engineer.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

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

/*
Here's the breakdown of the most demanded skills for data engineers in 2023
SQL and Python remain dominant, highlighting the absolute necessity of mastering core query languages and versatile programming for building robust data pipelines.
Cloud and Big Data Technologies like AWS, Azure, and Spark are essential, reflecting the industry's shift toward scalable infrastructure and high-volume distributed processing.

[
  {
    "skills": "sql",
    "demand_count": "14213"
  },
  {
    "skills": "python",
    "demand_count": "13893"
  },
  {
    "skills": "aws",
    "demand_count": "8570"
  },
  {
    "skills": "azure",
    "demand_count": "6997"
  },
  {
    "skills": "spark",
    "demand_count": "6612"
  }
]
*/

