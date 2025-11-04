{{ config(materialized='table') }}

WITH base AS (
  SELECT
    event_date, country, platform, user_id,
    iap_revenue, ad_revenue,
    match_start_count, match_end_count,
    victory_count, defeat_count, server_connection_error
  FROM {{ ref('stg_game_user_daily') }}
)

SELECT
  event_date,
  country,
  platform,
  COUNT(DISTINCT user_id) AS dau,
  SUM(iap_revenue)        AS total_iap_revenue,
  SUM(ad_revenue)         AS total_ad_revenue,
  SUM(match_start_count)  AS matches_started,
  SAFE_DIVIDE(SUM(iap_revenue) + SUM(ad_revenue), COUNT(DISTINCT user_id)) AS arpdau,
  SAFE_DIVIDE(SUM(match_start_count), COUNT(DISTINCT user_id))             AS match_per_dau,
  SAFE_DIVIDE(SUM(victory_count), NULLIF(SUM(match_end_count), 0))         AS win_ratio,
  SAFE_DIVIDE(SUM(defeat_count),  NULLIF(SUM(match_end_count), 0))         AS defeat_ratio,
  SAFE_DIVIDE(SUM(server_connection_error), NULLIF(COUNT(DISTINCT user_id),0)) AS server_error_per_dau
FROM base
GROUP BY 1,2,3
