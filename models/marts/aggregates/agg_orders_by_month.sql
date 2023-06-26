select
    sum(gross_item_sales_amount) as gross_sales,
    trunc(order_date, 'month') as order_month
-- , region
from {{ ref('dim_customers') }} as c
inner join {{ ref('fct_orders') }} as o
    on o.customer_key = c.customer_key
group by order_month -- , region
order by order_month desc
