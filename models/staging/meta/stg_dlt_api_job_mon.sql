{{
    config(
        materialized='table',
        enabled=false
    )
}}

select * from {{source('dlt_meta','dlt_gyros_job_status_raw')}}