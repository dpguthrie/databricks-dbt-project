

{{ dbt_utils.deduplicate(
    relation=source('produce', 'dupeset'),
    partition_by='id, event_time, squid_name, suffix, loaded_at',
    order_by='loaded_at desc',
   )
}}