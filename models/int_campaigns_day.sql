WITH int_campaign_day AS (
  SELECT
    DATE_TRUNC(date, DAY) AS day, 
    campaign_name,
    SUM(ads_cost) AS total_ads_cost
  FROM {{ ref('int_campaigns') }} 
  GROUP BY 1, date_date
)

SELECT
  day AS int_campaign_days,
  campaign_name,
  total_ads_cost
FROM int_campaign_day