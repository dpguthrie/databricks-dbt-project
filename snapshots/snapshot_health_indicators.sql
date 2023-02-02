{% snapshot snapshot_health_indicators %}

    {{
        config(
          target_schema='health',
          strategy='timestamp',
          unique_key='hash_key',
          updated_at='loaded_at',
          file_format='delta',
          enabled = false
        )
    }}



with raw_indicators as (
    select * from {{ ref('stg_health_indicators') }}
    union 
    select * from {{ ref('stg_health_indicators_india') }}
)

select * from raw_indicators


{% endsnapshot %}