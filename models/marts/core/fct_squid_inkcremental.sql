{{
config(
materialized='incremental',
unique_key='id'
)
}}

select
    ID,
    EVENT_TIME,
    SQUID_NAME,
    SUFFIX,
    INK_COLOR,
    INK_PRODUCED_OZ,
    NOTES
from {{ source('produce','squid_inc') }}

{% if is_incremental() %}
    where EVENT_TIME > (select max(EVENT_TIME) from {{ this }})
{% endif %}
