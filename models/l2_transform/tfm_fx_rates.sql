{{ config(materialized='table',
file_format = 'delta',
location_root = 's3://dna-dbt-delta-opensource/silver') }}

SELECT 
Currency,
CurrencyName,
Currency_Unit,
Currency_Description,
Currency_PairId,
Currency_Exchange,
Currency_Units,
Indicator,
Indicator_Name,
Units,
Scale,
Frequency,
Date,
Value 
  FROM {{ref('base_fx_rates')}}
 WHERE Indicator_Name = 'Close' 
   AND Frequency      = 'D' 