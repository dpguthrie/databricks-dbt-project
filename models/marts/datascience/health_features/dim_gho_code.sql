{{ config(
    post_hook="ALTER TABLE {{this}} SET TBLPROPERTIES (delta.enableChangeDataFeed = true)",

    
) }}

select 
distinct GHO_CODE, 
GHO_DISPLAY

from {{ ref('stg_health_indicators') }}
