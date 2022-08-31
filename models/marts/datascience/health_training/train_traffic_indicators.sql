--training dataset for traffic-related indicators
{% set traffic_codes = dbt_utils.get_column_values(ref('train_traffic_codes'), 'gho_code') %}


with health_features as 
(select * from {{ ref('feat_health_indicators') }} )


select 
country,
year,

    {% for traffic_code in traffic_codes %}

        {{traffic_code}} , 

    {% endfor %}

current_timestamp() as load_time

from health_features