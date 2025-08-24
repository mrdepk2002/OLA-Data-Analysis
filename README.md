# 🚖 OLA Data Analysis Project  

![Cover](Olacover.png)

## 📌 Project Overview  
This project analyses **OLA ride booking data** for Bengaluru city. The dataset (1 month, 100k+ rows) was created for learning and demonstrates **end-to-end data analysis** using SQL, Power BI, and Excel.  

The aim was to:  
- Understand booking trends, cancellations, and customer behaviour  
- Derive insights about vehicle types, ratings, and revenue  
- Build an interactive **Power BI dashboard** to visualize findings  
- Provide **recommendations** to improve business performance  

---

## 🛠️ Tools & Technologies  
- **SQL (PostgreSQL / PgAdmin4)** → Data Cleaning & Querying  
- **Power BI** → Dashboard & Visualization  
- **Excel (CSV)** → Raw data management  

---

## 🔍 Analysis Methodology  
1. **Data Cleaning & Modeling**  
   - Structured schema for bookings (date, time, booking_id, vehicle type, ratings, etc.)  
   - Ensured cancellation ratios:  
     - Customer cancellations ≤ 7%  
     - Driver cancellations ≤ 18%  
     - Incomplete rides < 6%  

2. **SQL Queries for Business Questions**  
   - Successful bookings, average ride distance, top customers, cancellation reasons, etc.  

3. **Power BI Dashboard**  
   - Interactive dashboards segmented into:  
     - **Overall Performance**  
     - **Vehicle Type Insights**  
     - **Revenue Analysis**  
     - **Cancellations**  
     - **Ratings (Driver vs Customer)**  

---

## ❓ Business Questions & SQL Answers  

| Question | SQL Query | Key Insights |
|----------|-----------|--------------|
| Retrieve all successful bookings | `SELECT * FROM bookings WHERE Booking_Status = 'Success';` | 62% of rides were successful |
| Avg. ride distance per vehicle type | `SELECT Vehicle_Type, AVG(Ride_Distance) FROM bookings GROUP BY Vehicle_Type;` | SUVs & Sedans had longest rides |
| Total cancelled rides by customers | `SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'Cancelled by Customer';` | ~6% of rides |
| Top 5 customers by rides | Aggregated by `COUNT(Booking_ID)` | Heavy users identified |
| Cancelled rides due to driver personal issues | `WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';` | ~15% driver-side cancellations |
| Max & Min ratings for Prime Sedan | MAX/MIN query | Range: 2.1 ⭐ – 5 ⭐ |
| UPI payments for successful rides | `WHERE Payment_Method = 'UPI' AND Booking_Status='Success'` | UPI dominated digital payments |
| Avg. customer rating per vehicle | Aggregated by vehicle type | Sedans scored highest |
| Total successful booking value | SUM over successful rides | Highest revenue from weekends |
| Incomplete rides with reasons | `WHERE Incomplete_Rides='Yes'` | Mostly breakdowns or customer demand |



Queries
1. Retrieve all successful bookings:
SELECT * FROM bookings WHERE Booking_Status = 'Success';
2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings GROUP BY
Vehicle_Type;
3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'cancelled by Customer';
4. List the top 5 customers who booked the highest number of rides:
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;
5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM bookings WHERE cancelled_Rides_by_Driver = 'Personal & Car
related issue';
6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';
7. Retrieve all rides where payment was made using UPI:
SELECT * FROM bookings WHERE Payment_Method = 'UPI';
8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;
9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_value FROM bookings WHERE
Booking_Status = 'Success';
10. List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides =
'Yes'

---

## 📊 Power BI Dashboard Highlights  
- **Ride Volume Over Time** → Spikes on weekends & match days  
- **Booking Status Breakdown** → Success vs. cancellation ratios  
- **Revenue by Payment Method** → UPI > Cash > Cards  
- **Top Customers & Vehicle Types** → SUVs & Sedans most profitable  
- **Cancellations** → Drivers cancelling > customers  
- **Customer vs. Driver Ratings** → Generally well-aligned, with outliers

- Queries:
1. Ride Volume Over Time: A time-series chart showing the number of rides per day/week.
2. Booking Status Breakdown: A pie or doughnut chart displaying the proportion of different
booking statuses (success, cancelled by the customer, cancelled by the driver, etc.).
3. Top 5 Vehicle Types by Ride Distance: A bar chart ranking vehicle types based on the total
distance covered.
4. Average Customer Ratings by Vehicle Type: A column chart showing the average
customer ratings for different vehicle types.
5. cancelled Rides Reasons: A bar chart that highlights the common reasons for ride
cancellations by customers and drivers.
6. Revenue by Payment Method: A stacked bar chart displaying total revenue based on
payment methods (Cash, UPI, Credit Card, etc.).
7. Top 5 Customers by Total Booking Value: A leaderboard visual listing customers who have
spent the most on bookings.
8. Ride Distance Distribution Per Day: A histogram or scatter plot showing the distribution of
ride distances for different Dates.
9. Driver Rating Distribution: A box plot visualizing the spread of driver ratings for different
vehicle types.
10. Customer vs. Driver Ratings: A scatter plot comparing customer and driver ratings for
each completed ride, analyzing correlations.
OLA Data Analyst P

---

## ✅ Results & Outputs  
- Achieved **62% successful booking rate**  
- **Revenue** highest during weekends & cricket match days  
- **Top 5% customers** contributed nearly **20% of revenue**  
- **Prime Sedan & SUV rides** → Higher distance + higher revenue  
- **Cash** is the most preferred payment method  
- **Driver cancellations (15-18%)** are significantly higher than customer cancellations (~6%)  

---

## 💡 Suggestions & Takeaways  
1. **Reduce driver-side cancellations** by incentivizing drivers or improving assignment algorithms.  
2. **Target top customers** with loyalty programs (cashback/discounts).  
3. **Promote SUVs & Sedans** as premium high-revenue categories.  
4. **Leverage UPI dominance** by offering seamless integrations & discounts.  
5. **Focus on weekends/events** with surge pricing to maximize revenue.  

---

## 📂 Repository Structure  
```
📁 OLA-Data-Analysis
 ┣ 📊 Ola Dashboard.pbix          # Power BI Dashboard
 ┣ 📑 OLA-Data-Analyst-Project.pdf # Project Documentation
 ┣ 📑 Ola-Slidesuhub.pptx          # Presentation Slides
 ┣ 📜 sql.sql                      # SQL Queries
 ┣ 📂 data
 ┃ ┗ bookings_july.csv             # Sample Dataset
 ┣ 🖼 cover.png                     # Cover Image
 ┗ 📄 README.md                    # This File
```

---

## 🚀 How to Use  
1. Import `sql.sql` into PostgreSQL/pgAdmin4.  
2. Open `Ola Dashboard.pbix` in Power BI for visualizations.  
3. Explore queries & insights in the repo.  

---

## 👤 Author  
**Deepak Kumar**  
- 💼 Data Analyst | Marketing Executive | Freelancer  
