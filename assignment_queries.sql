-- Show some details about Flight
SELECT fTotalSeatsFirst AS "Total First Class Seats",
    fStatus As "Flight Status"
FROM Flight;
-- Update Booking to First Class
SELECT *
FROM Booking;
UPDATE Booking
SET bClass = "First"
WHERE pk_bookingID = 3;
SELECT *
FROM Booking;
-- Delete a Payment
SELECT *
FROM Payment;
DELETE FROM Payment
WHERE pk_paymentID = 2;
SELECT *
FROM Payment;
-- Remove a Flight
SELECT *
FROM Flight;
DELETE FROM Flight
WHERE pk_flightID = 2;
SELECT *
FROM Flight;
-- Select  all bookings for a particular flight with Booking Office
SELECT boCity AS "Booking Office",
    bDate AS "Booking Date",
    btime AS "Booking Time"
FROM Booking
    JOIN Booking_Office ON fk_bookingOfficeID = pk_bookingOfficeID
    JOIN Booking_Flight ON fk_bookingID = pk_bookingID
    JOIN Flight ON Booking_Flight.fk_flightID = Flight.pk_flightID
WHERE Flight.pk_flightID = 1;
-- List all bookings for a customer
SELECT *
FROM Booking
    JOIN Customer ON fk_customerID = pk_customerID
WHERE fk_customerID = 1;
-- Query of choice with filter
SELECT *
FROM Airport
WHERE aCountry = 'Canada';