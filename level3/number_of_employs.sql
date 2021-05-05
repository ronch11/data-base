SELECT JOB, count(JOB) as number_of_employs
FROM employees
Group by job
