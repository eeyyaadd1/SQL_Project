/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Engineer roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data Engineering.
*/

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

/*
Here’s a breakdown of the most optimal skills for Data Engineers in 2023:
High-End Infrastructure: Mastery of Kubernetes ($158k) and Terraform ($146k) carries the highest salary premium, reflecting the massive value placed on cloud automation and container orchestration.
Data Streaming & Workflow: Tools like Spark, Kafka, and Airflow are the most "optimal"—they combine high demand (up to 237 mentions) with strong salaries ($138k–$150k), making them core requirements for modern pipelines.
Specialized Python & ML: Deep expertise in libraries like NumPy ($157k) and PyTorch ($142k) pays significantly better than general programming, rewarding engineers who can bridge the gap between data engineering and machine learning.
NoSQL & Scalable Storage: Expertise in distributed systems like Cassandra ($151k) and MongoDB ($138k) remains critical as companies continue to scale beyond traditional relational databases.

[
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "56",
    "avg_salary": "158190"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "14",
    "avg_salary": "157592"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "19",
    "avg_salary": "151282"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "134",
    "avg_salary": "150549"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "11",
    "avg_salary": "147818"
  },
  {
    "skill_id": 212,
    "skills": "terraform",
    "demand_count": "44",
    "avg_salary": "146057"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "38",
    "avg_salary": "144656"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demand_count": "21",
    "avg_salary": "144102"
  },
  {
    "skill_id": 144,
    "skills": "ruby",
    "demand_count": "14",
    "avg_salary": "144000"
  },
  {
    "skill_id": 30,
    "skills": "ruby",
    "demand_count": "14",
    "avg_salary": "144000"
  },
  {
    "skill_id": 83,
    "skills": "aurora",
    "demand_count": "14",
    "avg_salary": "142887"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "11",
    "avg_salary": "142254"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "113",
    "avg_salary": "141777"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "237",
    "avg_salary": "139838"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "64",
    "avg_salary": "139428"
  },
  {
    "skill_id": 64,
    "skills": "dynamodb",
    "demand_count": "27",
    "avg_salary": "138883"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "32",
    "avg_salary": "138569"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "32",
    "avg_salary": "138569"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "151",
    "avg_salary": "138518"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "139",
    "avg_salary": "138087"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "98",
    "avg_salary": "137707"
  },
  {
    "skill_id": 17,
    "skills": "typescript",
    "demand_count": "19",
    "avg_salary": "137207"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "93",
    "avg_salary": "136430"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "34",
    "avg_salary": "135499"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "30",
    "avg_salary": "134614"
  }
]
*/
