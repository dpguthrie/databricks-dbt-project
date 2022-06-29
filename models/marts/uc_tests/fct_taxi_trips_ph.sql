{{
    config(
        materialized='table',
        file_format='delta',
        pre_hook="use catalog samples"
    )
}}

select * from {{ source('taxi_ph', 'trips') }}