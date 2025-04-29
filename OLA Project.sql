CREATE DATABASE ola;
USE ola;

-- 1. Retrieve all successful bookings:
CREATE View successful_bookings AS
SELECT * FROM bookings where Booking_Status ="Success";

-- 2. Find the average ride distance for each vehicle type:
CREATE View average_ride_distance_for_each_vehicle_type AS
SELECT Vehicle_Type ,avg(Ride_Distance) as Average_Distance FROM bookings 
GROUP BY Vehicle_Type;


-- 3. Get the total number of cancelled rides by customers:
CREATE View number_of_cancelled_rides_by_customer AS
SELECT count(*) FROM bookings WHERE Booking_Status="Canceled by Customer";


-- 4. List the top 5 customers who booked the highest number of rides:
CREATE View top_5_customers_who_booked_the_highest_number_of_ride AS
SELECT Customer_ID ,count(Booking_Status) as total_rides FROM bookings 
GROUP BY Customer_ID ORDER BY total_rides desc limit 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE View number_of_rides_cancelled_by_drivers AS
SELECT count(Canceled_Rides_by_Driver) FROM bookings WHERE Canceled_Rides_by_Driver="Personal & Car related issue";
	

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE View  maximum_and_minimum_driver_ratings AS
SELECT max(Driver_Ratings),min(Driver_Ratings) FROM bookings WHERE Vehicle_Type="Prime Sedan";


-- 7. Retrieve all rides where payment was made using UPI:
CREATE View all_payment_by_UPI AS
SELECT * FROM bookings WHERE Payment_Method="UPI";


-- 8. Find the average customer rating per vehicle type:
CREATE View average_customer_rating_per_vehicle_type AS
SELECT Vehicle_Type ,avg(Customer_Rating) as Average_Customer_Rating FROM bookings GROUP BY Vehicle_Type;


-- 9. Calculate the total booking value of rides completed successfully:
CREATE View total_booking_value AS
SELECT sum(Booking_Value) FROM bookings WHERE Booking_Status="Success";


-- 10. List all incomplete rides along with the reason:
CREATE View incomplete_ride AS
SELECT Booking_ID , Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides ="Yes";


