with source as (

    select * from {{ source('health', 'health_indicators') }}

),

renamed as (

    select
        {{ dbt_utils.surrogate_key(['GHO__CODE_', 'STARTYEAR', 'COUNTRY__CODE_']) }} as hash_key,
        GHO__CODE_ as GHO_CODE,
        GHO__DISPLAY_ as GHO_DISPLAY,
        GHO__URL_ as GHO_URL,
        GBDCHILDCAUSES__CODE_ as GBDCHILDCAUSES_CODE,
        GBDCHILDCAUSES__DISPLAY_ as GBDCHILDCAUSES_DISPLAY,
        GBDCHILDCAUSES__URL_ as GBDCHILDCAUSES_URL,
        PUBLISHSTATE__CODE_ as PUBLISHSTATECODE,
        PUBLISHSTATE__DISPLAY_ as PUBLISHSTATEDISPLAY,
        PUBLISHSTATE__URL_ as PUBLISHSTATEURL,
        YEAR__CODE_ as YEAR_CODE,
        YEAR__DISPLAY_ as YEAR_DISPLAY,
        YEAR__URL_ as YEAR_URL,
        REGION__CODE_ as REGION_CODE,
        STARTYEAR as STARTYEAR,
        ENDYEAR as ENDYEAR,
        REGION__DISPLAY_ as REGION_DISPLAY,
        REGION__URL_ as REGION_URL,
        WORLDBANKINCOMEGROUP__CODE_ as WORLDBANKINCOMEGROUP_CODE,
        WORLDBANKINCOMEGROUP__DISPLAY_ as WORLDBANKINCOMEGROUP_DISPLAY,
        WORLDBANKINCOMEGROUP__URL_ as WORLDBANKINCOMEGROUP_URL,
        COUNTRY__CODE_ as COUNTRY_CODE,
        COUNTRY__DISPLAY_ as COUNTRY_DISPLAY,
        COUNTRY__URL_ as COUNTRY_URL,
        AGEGROUP__CODE_ as AGEGROUP_CODE,
        AGEGROUP__DISPLAY_ as AGEGROUP_DISPLAY,
        AGEGROUP__URL_ as AGEGROUP_URL,
        SEX__CODE_ as SEX_CODE,
        SEX__DISPLAY_ as SEX_DISPLAY,
        SEX__URL_ as SEX_URL,
        GHECAUSES__CODE_ as GHECAUSES_CODE,
        GHECAUSES__DISPLAY_ as GHECAUSES_DISPLAY,
        GHECAUSES__URL_ as GHECAUSES_URL,
        CHILDCAUSE__CODE_ as CHILDCAUSE_CODE,
        CHILDCAUSE__DISPLAY_ as CHILDCAUSE_DISPLAY,
        CHILDCAUSE__URL_ as CHILDCAUSE_URL,
        Display_Value as Display_Value,
        Numeric as Numeric,
        Low as Low,
        High as High,
        StdErr as StdErr,
        StdDev as StdDev,
        Comments as Comments,
        loaded_at
    from source
    where GHO__CODE_ not like '#%'

)

 select * from renamed
