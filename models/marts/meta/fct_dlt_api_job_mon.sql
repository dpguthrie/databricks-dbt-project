{{
    config(
        materialized='table'
    )
}}

select 
    uniqueId,
    runid,
    runElapsedTime,
    executionTime,
    status,
    executeStartedAt,
    executeCompletedAt
from  {{ ref('stg_dlt_api_job_mon') }}
group by 
    uniqueId,
    runid,
    runElapsedTime,
    executionTime,
    status,
    executeStartedAt,
    executeCompletedAt