
{{
    config(
        materialized='table',
        file_format='delta',
        pre_hook="use catalog samples",
        schema = 'samples.default',
        enabled = false
    )
}}


select * from {{ source('taxi_ph', 'trips') }}