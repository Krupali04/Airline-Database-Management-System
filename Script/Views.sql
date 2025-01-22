-- Views

-- View to display all active flights with their routes

CREATE VIEW ActiveFlights AS
SELECT f.FlightID, f.FlightStatus, r.DepartureAirportID, r.ArrivalAirportID, f.DepartureDateTime, f.ArrivalDateTime
FROM Flights f
JOIN Routes r ON f.RouteID = r.RouteID
WHERE f.FlightStatus = 'Scheduled';

SELECT * from ActiveFlights;

-- Crew Availability

CREATE VIEW CrewAvailability AS
SELECT 
    c.CrewID, 
    c.FirstName, 
    c.LastName, 
    c.Role, 
    c.Email, 
    c.Phone, 
    c.AvailabilityStatus
FROM 
    CrewMembers c
WHERE 
    c.AvailabilityStatus = 'Available';
    
SELECT * FROM CrewAvailability;
    
-- Flight Crew Assignments

CREATE VIEW FlightCrewAssignments AS
SELECT 
    f.FlightID, 
    f.DepartureDateTime, 
    c.FirstName, 
    c.LastName, 
    c.Role, 
    ws.ShiftStartDateTime, 
    ws.ShiftEndDateTime
FROM 
    WorkSchedules ws
JOIN 
    Flights f ON ws.FlightID = f.FlightID
JOIN 
    CrewMembers c ON ws.CrewID = c.CrewID;

SELECT * FROM FlightCrewAssignments;

-- Flights in a Specific Date Range

CREATE VIEW FlightsInDateRange AS
SELECT 
    f.FlightID, 
    f.DepartureDateTime, 
    f.ArrivalDateTime, 
    f.FlightStatus, 
    dep.AirportName AS DepartureAirport, 
    arr.AirportName AS ArrivalAirport
FROM 
    Flights f
JOIN 
    Routes r ON f.RouteID = r.RouteID
JOIN 
    Airports dep ON r.DepartureAirportID = dep.AirportID
JOIN 
    Airports arr ON r.ArrivalAirportID = arr.AirportID
WHERE 
    f.DepartureDateTime BETWEEN '2024-12-01' AND '2024-12-31';
    

SELECT * FROM FlightsInDateRange;
    
-- Flight Details with Airports

CREATE VIEW FlightDetailsWithAirports AS
SELECT 
    f.FlightID, 
    f.GateNumber, 
    f.DepartureDateTime, 
    f.ArrivalDateTime, 
    dep.AirportName AS DepartureAirport, 
    arr.AirportName AS ArrivalAirport
FROM 
    Flights f
JOIN 
    Routes r ON f.RouteID = r.RouteID
JOIN 
    Airports dep ON r.DepartureAirportID = dep.AirportID
JOIN 
    Airports arr ON r.ArrivalAirportID = arr.AirportID;
    
SELECT * FROM FlightDetailsWithAirports;
