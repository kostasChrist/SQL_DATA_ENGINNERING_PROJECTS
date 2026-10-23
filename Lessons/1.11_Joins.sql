--left join example
SELECT 
    job_id,
    job_title_short,
    cd.company_id,
    name AS company_name,
    job_location
FROM 
    job_postings_fact AS jpf
LEFT JOIN 
    company_dim AS cd
    ON jpf.company_id = cd.company_id
LIMIT 10;

---inner join example
SELECT 
    job_id,
    job_title_short,
    cd.company_id,
    name AS company_name,
    job_location
FROM 
    job_postings_fact AS jpf
INNER JOIN 
    company_dim AS cd   
ON jpf.company_id = cd.company_id
LIMIT 10;

--full outer join example
SELECT 
    job_id,
    job_title_short,
    cd.company_id,
    name AS company_name,
    job_location
FROM 
    job_postings_fact AS jpf
FULL OUTER JOIN 
    company_dim AS cd
ON jpf.company_id = cd.company_id
LIMIT 10;

