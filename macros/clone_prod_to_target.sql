{% macro clone_prod_to_target() %}
  {% set query_result -%}
    select table_name
    from external_storage.information_schema.tables
    where table_schema = 'dbt_ars_prod' 
  {%- endset %}

  {% set tables = run_query(query_result).columns['table_name'].values() %}

  {% for table_name in tables %}
    --  SQL logic to process the table
    {% set sql -%}
    create table if not exists {{ target.database }}.{{ target.schema }}.{{table_name}} shallow clone from external_storage.dbt_ars_prod.{{table_name}} ;
    {%- endset %}

    {{ dbt_utils.log_info("Cloning table " ~ table_name ~ " into target schema.") }}

    {% do run_query(sql) %}

    {{ dbt_utils.log_info("Cloned table " ~ table_name ~ " into target schema.") }}

  {% endfor %}


{% endmacro %}
