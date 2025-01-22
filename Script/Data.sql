- Inserting values  
INSERT INTO Passengers (PassengerID, FirstName, LastName, DateOfBirth, Gender, Street, City, State, ZipCode, Email, Phone, Nationality, PassportNumber)
VALUES
(1, 'John', 'Doe', '1985-03-12', 'M', '123 Elm St', 'New York', 'NY', '10001', 'john.doe@example.com', '5551234567', 'American', 'A123456789'),
(2, 'Jane', 'Smith', '1990-07-22', 'F', '456 Oak St', 'Los Angeles', 'CA', '90001', 'jane.smith@example.com', '5552345678', 'American', 'B987654321'),
(3, 'Samuel', 'Green', '1982-11-05', 'M', '789 Pine St', 'Chicago', 'IL', '60601', 'samuel.green@example.com', '5553456789', 'American', 'C234567890'),
(4, 'Emily', 'Brown', '1995-02-17', 'F', '101 Maple Ave', 'San Francisco', 'CA', '94101', 'emily.brown@example.com', '5554567890', 'American', 'D345678901'),
(5, 'Michael', 'White', '1987-06-30', 'M', '202 Birch Blvd', 'Miami', 'FL', '33101', 'michael.white@example.com', '5555678901', 'American', 'E456789012');

INSERT INTO Flights (FlightID, RouteID, AircraftID, FlightStatus, GateNumber, DepartureDateTime, ArrivalDateTime, EstimatedDuration_Minutes, PilotID, WeatherConditions)
VALUES
(1, 1, 101, 'Scheduled', 'A1', '2024-12-20 08:00:00', '2024-12-20 10:30:00', 150, 1, 'Clear'),
(2, 2, 102, 'Delayed', 'B2', '2024-12-21 09:30:00', '2024-12-21 12:00:00', 180, 2, 'Rainy'),
(3, 3, 103, 'Canceled', 'C3', '2024-12-22 07:00:00', '2024-12-22 09:30:00', 120, 3, 'Stormy'),
(4, 4, 104, 'Boarding', 'D4', '2024-12-23 10:00:00', '2024-12-23 12:30:00', 160, 4, 'Windy'),
(5, 5, 105, 'Scheduled', 'E5', '2024-12-24 11:00:00', '2024-12-24 13:30:00', 180, 5, 'Cloudy');

INSERT INTO Airports (AirportID, AirportName, City, State, Country, IATACode, Timezone, NumberOfRunways, AirportType)
VALUES
(1, 'John F. Kennedy International Airport', 'New York', 'NY', 'USA', 'JFK', 'EST', 4, 'International'),
(2, 'Los Angeles International Airport', 'Los Angeles', 'CA', 'USA', 'LAX', 'PST', 5, 'International'),
(3, 'O Hare International Airport', 'Chicago', 'IL', 'USA', 'ORD', 'CST', 6, 'International'),
(4, 'San Francisco International Airport', 'San Francisco', 'CA', 'USA', 'SFO', 'PST', 3, 'International'),
(5, 'Miami International Airport', 'Miami', 'FL', 'USA', 'MIA', 'EST', 4, 'International');

INSERT INTO Reservations (ReservationID, PassengerID, FlightID, BookingDate, ReservationStatus, PaymentID, TotalAmount, BookingAgencyID)
VALUES
(1, 1, 1, '2024-12-01', 'Confirmed', 1, 500.00, 1),
(2, 2, 2, '2024-12-02', 'Cancelled', 2, 300.00, 2),
(3, 3, 3, '2024-12-03', 'Pending', 3, 400.00, 3),
(4, 4, 4, '2024-12-04', 'Confirmed', 4, 600.00, 4),
(5, 5, 5, '2024-12-05', 'Pending', 5, 450.00, 5);

INSERT INTO Tickets (TicketID, ReservationID, SeatNumber, Class, FlightID, Price, BaggageAllowance_LBS, CheckInStatus, BoardingPassGenerated)
VALUES
(1, 1, '1A', 'First', 1, 500.00, 50, 'Checked-In', 'Yes'),
(2, 2, '2B', 'Business', 2, 300.00, 40, 'Not Checked-In', 'No'),
(3, 3, '3C', 'Economy', 3, 200.00, 30, 'Checked-In', 'Yes'),
(4, 4, '4D', 'First', 4, 600.00, 60, 'Not Checked-In', 'No'),
(5, 5, '5E', 'Business', 5, 450.00, 40, 'Checked-In', 'Yes');

INSERT INTO Payments (PaymentID, ReservationID, PaymentDate, PaymentMethod, Amount, TransactionStatus, ReceiptNumber)
VALUES
(1, 1, '2024-12-01', 'Credit Card', 500.00, 'Success', 'R001'),
(2, 2, '2024-12-02', 'Debit Card', 300.00, 'Failed', 'R002'),
(3, 3, '2024-12-03', 'PayPal', 400.00, 'Pending', 'R003'),
(4, 4, '2024-12-04', 'Credit Card', 600.00, 'Success', 'R004'),
(5, 5, '2024-12-05', 'Credit Card', 450.00, 'Success', 'R005');

INSERT INTO Aircrafts (AircraftID, Model, Capacity, Manufacturer, YearOfManufacture, MaintenanceStatus, LastMaintenanceDate, FuelCapacity_Litres, StationedAtAirportID)
VALUES
(1, 'Boeing 737', 180, 'Boeing', 2015, 'Good', '2024-05-10', 15000, 1),
(2, 'Airbus A320', 200, 'Airbus', 2017, 'Due', '2024-06-15', 16000, 2),
(3, 'Boeing 787', 250, 'Boeing', 2018, 'Under Maintenance', '2024-07-20', 18000, 3),
(4, 'Airbus A350', 300, 'Airbus', 2016, 'Good', '2024-08-25', 20000, 4),
(5, 'Boeing 777', 350, 'Boeing', 2019, 'Good', '2024-09-10', 22000, 5);

INSERT INTO CrewMembers (CrewID, FirstName, LastName, Role, Email, Phone, LicenseNumber, ExperienceYears, Salary, AvailabilityStatus, WorkScheduleID)
VALUES
(1, 'Alice', 'Johnson', 'Pilot', 'alice.johnson@example.com', '5556789012', 'L12345', 10, 80000.00, 'Available', 1),
(2, 'Bob', 'Williams', 'Co-Pilot', 'bob.williams@example.com', '5557890123', 'L12346', 7, 75000.00, 'Unavailable', 2),
(3, 'Charlie', 'Davis', 'Flight Attendant', 'charlie.davis@example.com', '5558901234', 'L12347', 5, 50000.00, 'Available', 3),
(4, 'David', 'Miller', 'Engineer', 'david.miller@example.com', '5559012345', 'L12348', 12, 95000.00, 'Unavailable', 4),
(5, 'Eve', 'Martinez', 'Pilot', 'eve.martinez@example.com', '5550123456', 'L12349', 8, 85000.00, 'Available', 5);

INSERT INTO WorkSchedules (WorkScheduleID, CrewID, FlightID, ShiftStartDateTime, ShiftEndDateTime)
VALUES
(1, 1, 1, '2024-12-20 07:00:00', '2024-12-20 15:00:00'),
(2, 2, 2, '2024-12-21 08:00:00', '2024-12-21 16:00:00'),
(3, 3, 3, '2024-12-22 06:00:00', '2024-12-22 14:00:00'),
(4, 4, 4, '2024-12-23 09:00:00', '2024-12-23 17:00:00'),
(5, 5, 5, '2024-12-24 10:00:00', '2024-12-24 18:00:00');

INSERT INTO Staff (StaffID, FirstName, LastName, Position, ContactNumber, AirportID)
VALUES
(1, 'Tom', 'Harris', 'Check-In Agent', '5551234567', 1),
(2, 'Linda', 'Clark', 'Customer Support', '5552345678', 2),
(3, 'James', 'Walker', 'Check-In Agent', '5553456789', 3),
(4, 'Sarah', 'Lewis', 'Other', '5554567890', 4),
(5, 'William', 'Young', 'Customer Support', '5555678901', 5);

INSERT INTO Routes (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedDuration)
VALUES
(1, 1, 2, 2500, 300),
(2, 2, 3, 3000, 360),
(3, 3, 4, 1500, 180),
(4, 4, 5, 2000, 240),
(5, 5, 1, 3500, 420);

INSERT INTO TravelAgencies (AgencyID, AgencyName, ContactNumber, Email, Street, City, State, ZipCode)
VALUES
(1, 'Sky Travels', '5556789012', 'contact@skytravels.com', '123 Travel St', 'New York', 'NY', '10001'),
(2, 'GlobeTrotters', '5557890123', 'contact@globetrotters.com', '456 Adventure Ave', 'Los Angeles', 'CA', '90001'),
(3, 'JetSetters', '5558901234', 'contact@jetsetters.com', '789 Fly Rd', 'Chicago', 'IL', '60601'),
(4, 'Wanderlust', '5559012345', 'contact@wanderlust.com', '101 Explore Blvd', 'San Francisco', 'CA', '94101'),
(5, 'TravelPro', '5550123456', 'contact@travelpro.com', '202 Discover Pkwy', 'Miami', 'FL', '33101');

INSERT INTO AgencyReservations (AgencyReservationID, AgencyID, PassengerID, FlightID, BookingDate, TotalAmount)
VALUES
(1, 1, 1, 1, '2024-12-01', 500.00),
(2, 2, 2, 2, '2024-12-02', 300.00),
(3, 3, 3, 3, '2024-12-03', 400.00),
(4, 4, 4, 4, '2024-12-04', 600.00),
(5, 5, 5, 5, '2024-12-05', 450.00);
