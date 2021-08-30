{% macro exasol__surrogate_key(field_list) %}

    {%- set fields = [] -%}

    {%- for field in field_list -%}

        {%- set _ = fields.append(
            "coalesce(to_char(" ~ field ~ "), '')"
        ) -%}

        {%- if not loop.last %}
            {%- set _ = fields.append("'-'") -%}
        {%- endif -%}

    {%- endfor -%}

    hash_md5({{ dbt_utils.concat(fields) }})

{% endmacro %}