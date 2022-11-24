{{ config(materialized='table',
file_format = 'delta',
location_root = 's3://dna-dbt-delta-opensource/silver') }}

SELECT
  company_ticker, company_name, stock_exchange_name, date, data_source_name,
  {{ dbt_utils.pivot(
      column = 'indicator_name',
      values = dbt_utils.get_column_values(ref('base_stock_history'), 'indicator_name'),
      then_value = 'value'
  ) }}
FROM {{ ref('base_stock_history') }}
GROUP BY company_ticker, company_name, stock_exchange_name, date, data_source_name