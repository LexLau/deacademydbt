{% macro concat_macro(value1, value2) %}

CONCAT('{{value1}}', '|', '{{value2}}')

{% endmacro %}