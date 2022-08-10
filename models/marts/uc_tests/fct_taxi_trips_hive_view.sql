
select * from {{ source('taxi_hive_view', 'trips') }}