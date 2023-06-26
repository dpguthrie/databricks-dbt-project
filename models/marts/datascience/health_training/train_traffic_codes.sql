select * from {{ ref('dim_gho_code') }}
where (
    lower(gho_display) like '%seat%'
    or lower(gho_display) like '%traffic%'
    or lower(gho_display) like '%auto%'
    or lower(gho_display) like '%vehicle%'
)
and gho_code not in ('SA_0000001788', 'RS_194', 'R_afford_tax_auto_adjust')
