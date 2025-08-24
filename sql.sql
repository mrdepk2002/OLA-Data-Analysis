DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
Date BIGINT,
Time BIGINT,
Booking_ID VARCHAR(255),
Booking_Status VARCHAR(255),
Customer_ID VARCHAR(255),
Vehicle_Type VARCHAR(255),
Pickup_Location VARCHAR(255),
Drop_Location VARCHAR(255),
V_TAT BIGINT,
C_TAT BIGINT,
Canceled_Rides_by_Customer VARCHAR(255),
Canceled_Rides_by_Driver VARCHAR(255),
Incomplete_Rides VARCHAR(255),
Incomplete_Rides_Reason VARCHAR(255),
Booking_Value BIGINT,
Payment_Method VARCHAR(255),
Ride_Distance VARCHAR(255),
Driver_Ratings FLOAT,
Customer_Rating FLOAT
);



DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    Date TIMESTAMP,
    Time TIME,
    Booking_ID VARCHAR(20) PRIMARY KEY,
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(20),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT INT,
    C_TAT INT,
    Canceled_Rides_by_Customer TEXT,
    Canceled_Rides_by_Driver TEXT,
    Incomplete_Rides VARCHAR(10),
    Incomplete_Rides_Reason TEXT,
    Booking_Value INT,
    Payment_Method VARCHAR(50),
    Ride_Distance INT,
    Driver_Ratings FLOAT,
    Customer_Rating FLOAT
);

--------------------------------------------------------
--Data Analysis--
--------------------------------------------------------

SQL Questions:
--1. Retrieve all successful bookings:
Create View Successfull_Bookings as
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';

--2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_ride_distance
FROM bookings
GROUP BY Vehicle_Type;

--3. Get the total number of cancelled rides by customers:
CREATE VIEW canceled_rides_by_customers as
SELECT Count(Canceled_Rides_by_Customer)
FROM bookings;

--4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customer as
SELECT Customer_ID, Count(Booking_ID) as total_rides
FROM bookings
GROUP BY 1
ORDER BY 2 Desc
LIMIT 5;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Top_5_Customer as
SELECT * 
FROM bookings
WHERE Canceled_Rides_by_Driver ='Personal & Car related issue';

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating as
SELECT MAX(Driver_Ratings ) as highest_sedan_rating, MIN(Driver_Ratings ) as lowest_sedan_rating
FROM bookings
where Vehicle_Type = 'Prime Sedan'

--7. Retrieve all rides where payment was made using UPI and were successfull:
CREATE VIEW  upi_ride_payments as
SELECT Booking_ID
FROM bookings
where Booking_Status = 'Success' and Payment_Method = 'UPI'

--8. Find the average customer rating per vehicle type:
CREATE VIEW  avg_customer_rating_per_vehicle as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
Group by 1
Order By 2 desc

--9. Calculate the total booking value of rides completed successfully:
CREATE VIEW  total_booking_value as
SELECT sum(Booking_Value) as total_booking_value
FROM bookings
WHERE Booking_Status = 'Success'

--10. List all incomplete rides along with the reason:

CREATE VIEW  incomplete_rides_and_reasons as
SELECT Booking_ID as incomplete_bookings, Incomplete_Rides_Reason 
FROM bookings
WHERE Incomplete_Rides = 'Yes'








