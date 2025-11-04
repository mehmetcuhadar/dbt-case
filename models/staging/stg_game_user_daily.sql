{{ config(materialized='view') }}

SELECT
  CAST(user_id AS STRING) AS user_id,
  CAST(event_date AS DATE) AS event_date,
  CAST(install_date AS DATE) AS install_date,
  UPPER(TRIM(platform)) AS platform,
  COALESCE(UPPER(TRIM(country)), 'UNKNOWN') AS country,
  COALESCE(CAST(total_session_count AS INT64), 0) AS total_session_count,
  COALESCE(CAST(total_session_duration AS INT64), 0) AS total_session_duration,
  COALESCE(CAST(match_start_count AS INT64), 0) AS match_start_count,
  COALESCE(CAST(match_end_count AS INT64), 0) AS match_end_count,
  COALESCE(CAST(victory_count AS INT64), 0) AS victory_count,
  COALESCE(CAST(defeat_count AS INT64), 0) AS defeat_count,
  COALESCE(CAST(server_connection_error AS INT64), 0) AS server_connection_error,
  COALESCE(CAST(iap_revenue AS NUMERIC), 0) AS iap_revenue,
  COALESCE(CAST(ad_revenue AS NUMERIC), 0) AS ad_revenue
FROM {{ source('game_raw_data', 'user_daily_data') }}
