{% macro generate_schema_name(custom_schema_name, node) -%}

    {{ log(node ~ '\n custom schema name is ' ~ custom_schema_name , info=True) }}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}