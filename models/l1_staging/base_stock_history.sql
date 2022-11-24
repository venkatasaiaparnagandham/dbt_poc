{{ config(materialized='table',
file_format = 'delta',
location_root = 's3://dna-dbt-delta-opensource/bronze') }}

SELECT "Company"                    Company
     , "CompanyName"               Company_Name
     , "CompanyTicker"             Company_Ticker
     , "StockExchange"             Stock_Exchange
     , "StockExchangeName"        Stock_Exchange_Name
     , "Indicator"                  Indicator
     , "IndicatorName"             Indicator_Name
     , "Units"                      Units
     , "Scale"                      Scale
     , "Frequency"                  Frequency
     , "Date"                       Date
     , "Value"                      Value
     , 'Stock_History' data_source_name
  FROM {{source('poc_data','stockhistory')}} 