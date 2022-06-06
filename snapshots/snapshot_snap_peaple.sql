{% snapshot snap_pea_snapshot_timestamp_spark %}

    {{
        config(
          target_schema='raw_produce',
          strategy='timestamp',
          unique_key='id',
          updated_at='updated_at'
        )
    }}


select s.* 
from {{ source('produce', 'snap_peaple') }} s
inner join 
    (select 
    id,
    max(updated_at) as max_date
    from {{ source('produce', 'snap_peaple') }}
    group by id) l
on s.id = l.id
and s.updated_at = l.max_date


{% endsnapshot %}