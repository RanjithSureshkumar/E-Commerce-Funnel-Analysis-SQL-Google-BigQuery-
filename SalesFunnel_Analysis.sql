SELECT * FROM `ageless-slate-446621-j7.Sales_Funnel.User_Info` LIMIT 1000

--- Defining Sales funnel and different Stages of Funnel 

WITH Funnel_Stages AS
 (
   SELECT 
   COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) as stage_1_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) as stage_2_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) as stage_3_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) as stage_4_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) as stage_5_views 
   from  ageless-slate-446621-j7.Sales_Funnel.User_Info
   WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 50 DAY)) 
   )
 SELECT * FROM Funnel_stages;


 --- Conversion rate through the funnel

WITH Funnel_Stages AS
 (
   SELECT 
   COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) as stage_1_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) as stage_2_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) as stage_3_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) as stage_4_views, 
   COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) as stage_5_views 
   from  ageless-slate-446621-j7.Sales_Funnel.User_Info
   WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 50 DAY)) 
   )
 SELECT 
 stage_1_views,

 stage_2_views,
 round((stage_2_views * 100 / stage_1_views),2) as View_to_cart,
 stage_3_views,
 round((stage_3_views * 100 / stage_2_views),2) as Cart_to_checkout,
 stage_4_views,
 round((stage_4_views * 100 / stage_3_views),2) as Checkout_to_payment,
 stage_5_views,
 round((stage_5_views * 100 / stage_4_views),2) as Payment_to_purchase,
 round((stage_5_views * 100 / stage_1_views),2) as overall_conversion

 FROM Funnel_stages;


---Funnel by source

WITH source_funnel AS (
SELECT 
traffic_source,
   COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) as views, 
   COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) as cart, 
   COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) as purchase 
   from  ageless-slate-446621-j7.Sales_Funnel.User_Info
group by traffic_source

)

select
traffic_source,

views,

cart,
round((cart * 100 / views),2) as views_to_cart,

purchase,

round((purchase * 100 / cart),2) as cart_to_purchase,

round((purchase * 100 / views),2) as views_to_purchase

from source_funnel



---time to conversion analysis

WITH user_journy AS (
SELECT 
user_id,
   min(CASE WHEN event_type = 'page_view' THEN event_date END) as view_time, 
   min(CASE WHEN event_type = 'add_to_cart' THEN event_date END) as cart_time, 
   min(CASE WHEN event_type = 'purchase' THEN event_date END) as purchase_time 
   from  ageless-slate-446621-j7.Sales_Funnel.User_Info

WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 50 DAY)) 
GROUP BY user_id
HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)

SELECT
count (*) as converted_users,
round(avg(timestamp_diff(cart_time, view_time, MINUTE)),2) as avg_view_to_cart,
round(avg(timestamp_diff(purchase_time, cart_time, MINUTE)),2) as avg_cart_to_purchase,
round(avg(timestamp_diff(purchase_time, view_time, MINUTE)),2) as avg_journy_time
FROM user_journy


---Revenue funnel analysis


WITH revenue_funnel AS (
SELECT 
count(distinct case when event_type = 'page_view' then user_id end) as total_visitors,
count(distinct case when event_type = 'purchase' then user_id end) as total_buyers,
sum(distinct case when event_type = 'purchase' then amount end) as total_revenue,
count (case when event_type = 'purchase' then 1 end) as total_orders
 from  ageless-slate-446621-j7.Sales_Funnel.User_Info
WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 50 DAY)) 

HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)

select 
total_visitors,
total_buyers,
total_revenue,
total_orders,
round(total_revenue/total_visitors,2) as avg_revenue_per_visitor,
round(total_revenue/total_orders,2) as avg_order_value
from revenue_funnel