{{
    config
    (
        materialized = 'table'
    )
}}
WITH session_src AS (
    SELECT 
        SESSION_ID,
        USER_ID,
        BROWSER,
        DEVICE_TYPE,
        B.COUNTRY_NAME AS COUNTRY_NAME,
        B.CONTINENT AS CONTINENT,
        B.CURRENCY AS CURRENCY,
        START_TIME,
        END_TIME,
        PAGES_VISITED,
        CURRENT_TIMESTAMP AS INSERT_DTS
    FROM
        {{source('session', 'SESSION_SRC')}} AS A
    LEFT JOIN
        {{ref('country_code')}} AS B
    ON A.COUNTRY_CODE = B.COUNTRY_CODE
)
SELECT * FROM session_src