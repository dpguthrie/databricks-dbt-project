{{ config(
    materialized='table',
    partition_by=['minimum_nights'],
    file_format='delta'
) }}

with source as (

    select * from {{ ref('stg_airbnb_calendar') }}

)

select * from source
