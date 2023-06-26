{{
    config(
        materialized='table'
    )
}}

with raw_indicators as (
    select * from {{ ref('stg_health_indicators') }}
)
,
cleaned_indicators as (
    select *
    from raw_indicators
    where
        --removing codes related to life expectancy since that is what we want to predict
        gho_code != "WHOSIS_000015"
        and publishstatecode = "PUBLISHED"
        and startyear > 2000
),

final as (
    select
        gho_code as gho,
        startyear as year,
        country_code as country,
        coalesce(numeric, display_value) as value
    from cleaned_indicators
    where display_value > 0
)

select
    gho,
    year,
    country,
    avg(value) as value
from final
group by gho, year, country
order by year desc
