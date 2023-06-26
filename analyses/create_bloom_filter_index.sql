CREATE BLOOMFILTER INDEX
ON {{ ref('fct_order_items') }} 
FOR COLUMNS(supplier_key)