Exasol utils 'dbt shim' package that offers exasol specifics

Currently supported
- dbt-utils - partially
- dbt-audit-helper - partially

Using the following dispatch rule in dbt_project.yml helped:
'''
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['exasol_utils', 'dbt_utils']
'''
