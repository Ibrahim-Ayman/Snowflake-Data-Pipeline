{% macro safe_integer_cast(expression) %}
    try_to_number({{ expression }})
{% endmacro %}