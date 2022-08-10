
{{
    config(
        materialized='table',
        file_format='delta',
        schema = 'external_storage.aws',
        enabled = false
    )
}}


select * from {{ source('taxi', 'trips') }}