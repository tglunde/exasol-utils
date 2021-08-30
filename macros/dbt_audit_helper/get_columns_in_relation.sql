{% macro exasol__get_columns_in_relation_sql(relation) %}
select
  column_ordinal_position as ordinal_position,
  column_name,
  column_type as data_type,
  column_maxsize as character_maximum_length,
  column_num_prec as numeric_precision,
  column_num_scale as numeric_scale

from exa_all_columns
where
  lower(column_schema) = lower('{{ relation.schema }}')
  and lower(column_table) = lower('{{ relation.identifier }}')
  
{% endmacro %}