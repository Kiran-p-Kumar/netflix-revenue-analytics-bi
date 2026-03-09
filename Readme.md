# 🎬 Netflix Platform Analytics & Revenue Dashboard

An interactive Power BI dashboard providing deep-dive insights into Netflix's content library, subscription distribution, and estimated revenue generation.

![Dashboard Screenshot](![alt text](<Screenshot 2026-01-02 154139.png>)) 

---

## 🌟 Project Strategy

### **Situation**
With the streaming landscape becoming increasingly saturated, understanding the balance between content production costs (Genres) and incoming cash flow (Subscription Tiers) is critical for platform sustainability.

### **Task**
The objective was to transform raw, disconnected CSV files into a cohesive business intelligence tool that answers:
1. Which content genres dominate the platform?
2. What is the estimated monthly revenue based on current user tiers?
3. How is the user base distributed across different price points?

### **Action**
* **Data Engineering:** Utilized **Python (Pandas)** to perform ETL, merging user subscription data with content master files.
* **Business Logic:** Developed **DAX measures** to calculate revenue based on a logic-switch ($9.99 for Basic, $12.99 for Standard, and $15.99 for Premium).
* **Visualization:** Built a "Dark Mode" UI in Power BI to mimic the Netflix brand identity, using **Top-N Filters** for genres and **Donut Charts** for plan mix.

### **Result**
The dashboard reveals that while **Drama** is the highest volume genre (over 4k titles), the **Premium** tier is the most popular subscription choice (40% of the user base), leading to a healthy estimated revenue of **$472.65** for this dataset sample.

---

## ⚙️ Technical Workflow

### **1. ETL Process (Python)**
We used Python to clean the data and combine disparate files into a single source of truth (`subscriptions_final.csv`).

```python
import pandas as pd

# Load content and user data
df_content = pd.read_csv('netflix_titles.csv')
df_users = pd.read_csv('user_data.csv')

# ETL: Handle missing values and merge
df_content['genres'] = df_content['listed_in'].apply(lambda x: x.split(',')[0])
master_df = pd.merge(df_content, df_users, on='show_id', how='inner')

# Export for Power BI
master_df.to_csv('subscriptions_final.csv', index=False)
2. SQL Business Insights
The following SQL queries were used to validate the data before visualization:

Genre Concentration: SELECT genres, COUNT(*) as Total FROM subscriptions_final GROUP BY genres ORDER BY Total DESC;

Revenue Validation: SELECT plan_type, SUM(calculated_price) FROM subscriptions_final GROUP BY plan_type;

🔮 Data-Driven Predictions

Based on the current dashboard trends, we can forecast the following:

Revenue Growth: Since 40% of the users are already on Premium, the platform has reached high maturity. The next growth phase should focus on converting the 22.86% Basic users to Standard through "No-Ads" incentives.

Content Investment: Drama and Comedy make up the vast majority of the library. To reduce churn, Netflix should consider diversifying into Documentaries or Reality TV, which currently show lower volume but high engagement potential.

Engagement Forecast: The "Watch History Velocity" shows a concentrated spike in 2024. If content release frequency doesn't increase in 2025, a minor "Subscription Churn" is predicted.

🛠️ Tools Used
Power BI: Data Visualization & DAX

Python (Pandas): Data Cleaning & ETL

SQL: Data Validation

VS Code: Documentation & Scripting


***

