select *
from {{ ref('agg_orders_by_month') }}
where gross_sales < 0
