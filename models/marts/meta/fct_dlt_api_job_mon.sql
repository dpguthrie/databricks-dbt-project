{{
    config(
        materialized='table'
    )
}}

select 
*
 from {{ ref('stg_dlt_api_job_mon') }}
where rnk = 1