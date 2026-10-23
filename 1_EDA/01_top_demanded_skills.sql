/*
What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT 
    sd.skills,
    Count(jpf.*)  demand_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON  sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short ILIKE '%data engineer%'
    AND jpf.job_work_from_home = TRUE
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
SQL and Python are the most in-demand data engineering skills,
with over 38,000 job postings each. AWS and Azure follow,
highlighting the importance of cloud computing, while Spark, Airflow, Snowflake, and Databricks 
demonstrate the growing demand for data processing and pipeline management.

Key takeaways:
- SQL and Python: Essential foundational skills.
- Cloud platforms: AWS and Azure are highly valued.
- Data tools: Spark, Airflow, Snowflake, and Databricks support data processing and pipeline development.
- Other skills: Java and Kafka add value for programming and real-time data streaming.
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        38368 │
│ python     │        38117 │
│ aws        │        24514 │
│ azure      │        18707 │
│ spark      │        17591 │
│ airflow    │        13395 │
│ snowflake  │        11781 │
│ databricks │        10962 │
│ java       │         9993 │
│ kafka      │         9315 │
└────────────┴──────────────┘
*/