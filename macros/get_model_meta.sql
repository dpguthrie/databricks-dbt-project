{% macro get_model_meta(node_resource_type="model") %}
    {% if execute %}
  {% for node in graph.nodes.values()
     | selectattr("resource_type", "equalto", "model")

  %}
  
            {% do log(node.unique_id ~ ", materialized: " ~ node.config.materialized, info
            {% do log(node.unique_id ~ ", tags: " ~ node.config.tags, info
            {% do log(node.unique_id ~ ", tags: " ~ node.tags, info=tr
        {% endfor %}
    {% endif %}
{% endmacro %}
