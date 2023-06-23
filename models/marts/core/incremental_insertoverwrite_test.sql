{{ config(
    materialized='incremental',
    partition_by=['order_date'],
    file_format='delta',
    incremental_strategy='replace_where'
) }}


select * from {{ref('fct_orders')}}
{% if is_incremental() %}
where order_date >= '1998-07-01'
{% else %}
where order_date < '1998-07-01'
{% endif %}