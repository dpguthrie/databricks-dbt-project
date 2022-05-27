{% snapshot snap_pea_snapshot_timestamp %}

    {{
        config(
          target_schema='raw_produce',
          strategy='timestamp',
          unique_key='id',
          updated_at='updated_at',
        )
    }}

    select * from {{ source('produce', 'snap_peaple') }}

{% endsnapshot %}