{{
    config
    (
        materialized = 'table'
    )
}}

with employee as 
(
    SELECT 
        EMPID AS emp_id,
        split_part(NAME, ' ' , 1) AS emp_firstname,
        split_part(NAME, ' ', 2) AS emp_lastname,
        SALARY AS emp_salary,
        HIREDATE AS emp_hiredate,
        split_part(ADDRESS, ',',1) AS emp_street,
        split_part(ADDRESS, ',',2) AS emp_city,
        split_part(ADDRESS, ',',3) AS emp_country,
        split_part(ADDRESS, ',',4) AS emp_zip
    FROM {{source('employee', 'EMPLOYEE_RAW')}} --DBT_DB.PUBLIC.EMPLOYEE_RAW
)
SELECT * FROM employee