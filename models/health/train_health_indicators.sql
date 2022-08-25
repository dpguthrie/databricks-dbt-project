with health_features as 
(select * from {{ ref('feat_health_indicators') }} )

select * 
from health_features