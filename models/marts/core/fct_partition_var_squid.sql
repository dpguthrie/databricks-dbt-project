{{
config(
materialized='incremental',
unique_key='id',
incremental_strategy='merge',
location_root = '/dbfs/delta/external_tables',
partition_by = 'ID',
enabled=false
)
}}


select *  from {{ source('produce', 'dupeset') }}

where ID like '{{ var("partition_squid_id") }}' 

{% if is_incremental() %}
and event_time > (select max(event_time) from {{ this }})
{% endif %}
