# E-Commerce-Funnel-Analysis-SQL-Google-BigQuery-

##  Project Summary

This project analyzes an e-commerce sales funnel using **Google BigQuery SQL** to evaluate user conversion behavior, marketing channel efficiency, and revenue optimization opportunities.

The analysis identifies where users drop off in the funnel and provides data-driven recommendations to improve marketing ROI and profitability.

---

##  Objectives

* Measure conversion rates across funnel stages
* Evaluate marketing channel performance
* Identify inefficient ad spend
* Recommend strategies to improve revenue

---

##  Tech Stack

* **SQL (Standard SQL)**
* **Google BigQuery**
* **Dataset:** User behavior data

---

##  Project Structure

```
├── user_events.csv              # Raw dataset
├── SalesFunnel_Analysis.sql     # BigQuery SQL queries
└── README.md
```

---

##  Dataset Overview

**Table:** `user_events`

### Columns

| Column         | Description                                                                  |
| -------------- | ---------------------------------------------------------------------------- |
| user_id        | Unique visitor ID                                                            |
| event_type     | Funnel step (page_view, add_to_cart, checkout_start, payment_info, purchase) |
| event_date     | Event timestamp                                                              |
| traffic_source | Acquisition channel                                                          |
| order_value    | Purchase amount                                                              |

---

## Conversion Rates Through the Funnel 
## How many unique users reach each stage of the sales funnel?

Calculated distinct users at each stage:

* Page View 
* Add to Cart
* Checkout Start
* Payment Info
* Purchase

This analysis identifies where users drop off in the funnel and highlights stages that may require UX or marketing improvements.

  
Conversion rate through funnels
<img width="2488" height="202" alt="image" src="https://github.com/user-attachments/assets/93e25309-018c-4da0-a657-ceaf8f7fb09b" />

---
## Funnel Performance by Traffic Source  
## Which marketing channels bring high-quality traffic that converts?

Measured:

* Traffic share by source
* Conversion rate by channel


This helps identify which channels drive revenue versus low-intent traffic, enabling smarter marketing budget allocation.


Funnel by source
<img width="2028" height="360" alt="image" src="https://github.com/user-attachments/assets/15c34664-9f73-4115-8b0d-8390bafcd1a6" />

## Customer Journey & Time to Conversion 
##  How long does it take users to move from viewing a product to completing a purchase?

Time taken to move from stage to stage in Min
<img width="1130" height="126" alt="image" src="https://github.com/user-attachments/assets/df1d6a39-a17a-4001-aee0-cd062fb55492" />

---
## Revenue Funnel Analysis  
### How much revenue does the funnel generate and what is the average order value?

Calculated:

  * Total visitors
  *  Total buyers
  *  Total revenue
  *  Total orders
  *  Average revenue per visitor
  *   Average order value (AOV) 

  
revenue_analysis
<img width="1636" height="218" alt="image" src="https://github.com/user-attachments/assets/559a3201-f7cc-4d60-b3cf-9399eed74def" />

---

##  Key Findings

### Checkout Flow is Strong

* Checkout → Purchase conversion: **~80%+**
* Indicates a frictionless payment experience

**Implication:**
Do not redesign checkout — risk outweighs benefit.

---

##  Channel Performance Insights

###  Social Media: High Traffic, Lowest Conversion
- Drives **1,472 visits** (second-highest traffic source)
- Conversion rate: **6.93% (lowest among all channels)**

**Implication:**  
Social media attracts a large volume of low-intent users. Current campaigns may be optimized for traffic rather than conversions, leading to inefficient ad spend.

**Recommendation:**  
Shift focus from traffic campaigns to:
- Retargeting campaigns  
- Lead generation (email capture)  
- Conversion-optimized creatives  

---

###  Email Marketing: Highest Conversion Channel
- Traffic: **522 visits**
- Purchases: **177**
- Conversion rate: **33.91% (highest across all channels)**

**Implication:**  
Email traffic consists of high-intent users who are significantly more likely to purchase.

**Recommendation:**  
- Expand email capture strategies  
- Invest in lifecycle email campaigns  
- Use email for retargeting and promotions  

---

### Paid Ads: Balanced Performance
- Conversion rate: **21.07%**
- Strong performance compared to organic and social

**Implication:**  
Paid ads are effective but may benefit from optimization to match email performance.

---

### Organic Traffic: High Volume, Moderate Conversion
- Highest traffic source: **2,038 visits**
- Conversion rate: **16.83%**

**Implication:**  
Organic traffic drives awareness but includes mixed user intent. SEO content may attract early-stage users.

---

---

### Financial Insights

- **Total Revenue:** $71,134.98  
- **Total Buyers:** 681  
- **Average Revenue per Visitor:** $17.20  
- **Average Order Value (AOV):** **$104.46**

**Implications:**

- Each visitor generates an average of **$17.20**, indicating strong monetization efficiency.
- With an AOV of **$104.46**, the business can afford higher acquisition costs for high-intent channels.
- Marketing spend should be aligned with expected revenue per visitor to maintain profitability.

---

##  Recommendations

### 1. UX Optimization

* Maintain current checkout design
* Monitor but avoid unnecessary redesign

---

### 2. Marketing Strategy

**Reduce Social Traffic Campaigns**

* Shift focus to retargeting & lead generation

**Invest in Email Marketing**

* Add email capture pop-ups
* Build lifecycle campaigns

---

### 3. Budget Optimization

* Audit CAC by channel
* Pause campaigns exceeding CAC threshold
* Reallocate budget to high-conversion channels

---
##  Business Impact

Implementing these insights can:

* Improve marketing ROI
* Reduce wasted ad spend
* Increase conversion rates
* Maintain strong checkout performance
* Drive sustainable revenue growth

---

## Future Enhancements

* Channel-level CAC calculation
* Cohort analysis by acquisition source
* Customer Lifetime Value (CLV) modeling
* A/B testing funnel improvements

---

## Author

**Ranjith HS**
SQL | Marketing Analytics | Funnel Analysis | BigQuery

