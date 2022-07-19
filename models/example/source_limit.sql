SELECT *
FROM {{ source('tpch', 'orders') }}
where o_custkey BETWEEN 749998 and 749999