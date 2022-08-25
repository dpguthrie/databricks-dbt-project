select 
distinct GHO_CODE, 
GHO_DISPLAY

from {{ ref('stg_health_indicators') }}
