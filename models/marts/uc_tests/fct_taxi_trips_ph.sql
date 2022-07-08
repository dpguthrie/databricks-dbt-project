{{
    config(
        materialized='table',
        file_format='delta',
        pre_hook="use catalog samples",
        enabled = false
    )
}}

select * from {{ source('taxi_ph', 'trips') }}