with source as (

    select *
    from
        {{ source('health', 'substance_use_and_mental_health_indicators_usa_csv') }}

),

renamed as (

    select
        gho__code_ as gho_code,
        gho__display_ as gho_display,
        gho__url_ as gho_url,
        publishstate__code_ as publishstatecode,
        publishstate__display_ as publishstatedisplay,
        publishstate__url_ as publishstateurl,
        year__code_ as year_code,
        year__display_ as year_display,
        year__url_ as year_url,
        region__code_ as region_code,
        startyear as startyear,
        endyear as endyear,
        region__display_ as region_display,
        region__url_ as region_url,
        worldbankincomegroup__code_ as worldbankincomegroup_code,
        worldbankincomegroup__display_ as worldbankincomegroup_display,
        worldbankincomegroup__url_ as worldbankincomegroup_url,
        country__code_ as country_code,
        country__display_ as country_display,
        country__url_ as country_url,
        sex__code_ as sex_code,
        sex__display_ as sex_display,
        sex__url_ as sex_url,
        display_value as display_value,
        numeric as numeric,
        low as low,
        high as high,
        stderr as stderr,
        stddev as stddev,
        comments as comments

    from source
    where gho__code_ not like '#%'

)

select * from renamed
