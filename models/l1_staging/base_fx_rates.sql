{{ config(materialized='table',
file_format = 'delta',
location_root = 's3://dna-dbt-delta-opensource/bronze') }}

select Currency,
CurrencyName as CurrencyName,
CurrencyUnit as Currency_Unit,
CurrencyDescription as Currency_Description,
CurrencyPairId as Currency_PairId,
CurrencyExchange as Currency_Exchange,
CurrencyUnits as Currency_Units,
Indicator,
IndicatorName as Indicator_Name,
Units,
Scale,
Frequency,
Date,
Value,
'FX_Rates' as data_source_name
from {{source('poc_data','exrate')}} 