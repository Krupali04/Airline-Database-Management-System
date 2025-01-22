CREATE DATABASE AIRLINE;

USE AIRLINE;

-- 1. Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(5) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(10) UNIQUE NOT NULL,
    Nationality VARCHAR(50) NOT NULL,
    PassportNumber VARCHAR(20) UNIQUE NOT NULL
);

-- 2. Flights
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    RouteID INT NOT NULL,
    AircraftID INT NOT NULL,
    FlightStatus ENUM('Scheduled', 'Delayed', 'Canceled', 'Boarding') NOT NULL,
    GateNumber VARCHAR(10) NOT NULL,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    EstimatedDuration_Minutes INT CHECK (EstimatedDuration_Minutes > 0) NOT NULL,
    PilotID INT NOT NULL,  
    WeatherConditions VARCHAR(50)
);


-- 3. Airports
CREATE TABLE Airports (
    AirportID INT PRIMARY KEY,
    AirportName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    IATACode CHAR(3) UNIQUE NOT NULL,
    Timezone VARCHAR(50) NOT NULL,
    NumberOfRunways INT CHECK (NumberOfRunways > 0) NOT NULL,
    AirportType ENUM('International', 'Domestic', 'Regional') NOT NULL
);

-- 4. Reservations
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    BookingDate DATE NOT NULL,
    ReservationStatus ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL,
    PaymentID INT NOT NULL,
    TotalAmount DECIMAL(10, 2) CHECK (TotalAmount >= 0) NOT NULL,
    BookingAgencyID INT 
);


-- 5. Tickets
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    ReservationID INT NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL,
    Class ENUM('Economy', 'Business', 'First') NOT NULL,
    FlightID INT NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price >= 0) NOT NULL,
    BaggageAllowance_LBS INT CHECK (BaggageAllowance_LBS >= 0) NOT NULL,
    CheckInStatus ENUM('Checked-In', 'Not Checked-In') NOT NULL,
    BoardingPassGenerated ENUM('Yes', 'No') NOT NULL
);
-- FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID),
 --   FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
 
 -- 6. Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    ReservationID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'PayPal', 'Other') NOT NULL,
    Amount DECIMAL(10, 2) CHECK (Amount >= 0) NOT NULL,
    TransactionStatus ENUM('Success', 'Failed', 'Pending') NOT NULL,
    ReceiptNumber VARCHAR(50) UNIQUE NOT NULL
    
);


-- 7. Aircrafts
CREATE TABLE Aircrafts (
    AircraftID INT PRIMARY KEY,
    Model VARCHAR(50) NOT NULL,
    Capacity INT CHECK (Capacity > 0) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    YearOfManufacture YEAR NOT NULL,
    MaintenanceStatus ENUM('Good', 'Due', 'Under Maintenance') NOT NULL,
    LastMaintenanceDate DATE NOT NULL,
    FuelCapacity_Litres INT CHECK (FuelCapacity_Litres > 0) NOT NULL,
    StationedAtAirportID INT   
  
);


-- 8. CrewMembers
CREATE TABLE CrewMembers (
    CrewID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role ENUM('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer') NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    LicenseNumber VARCHAR(20) UNIQUE NOT NULL,
    ExperienceYears INT CHECK (ExperienceYears >= 0) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0) NOT NULL,
    AvailabilityStatus ENUM('Available', 'Unavailable') NOT NULL,
    WorkScheduleID INT NOT NULL
    
);


-- 9. WorkSchedules
CREATE TABLE WorkSchedules (
    WorkScheduleID INT PRIMARY KEY,
    CrewID INT NOT NULL,
    FlightID INT NOT NULL,
    ShiftStartDateTime DATETIME NOT NULL,
    ShiftEndDateTime DATETIME NOT NULL
);


-- 10. Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position ENUM('Check-In Agent', 'Customer Support', 'Other') NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    AirportID INT NOT NULL
);


-- 11. Routes
CREATE TABLE Routes (
    RouteID INT PRIMARY KEY,
    DepartureAirportID INT NOT NULL,
    ArrivalAirportID INT NOT NULL,
    Distance DECIMAL(10, 2) CHECK (Distance >= 0) NOT NULL,
    EstimatedDuration INT CHECK (EstimatedDuration > 0) NOT NULL
  
);

 
-- 12. TravelAgencies
CREATE TABLE TravelAgencies (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL
);

-- 13. AgencyReservations
CREATE TABLE AgencyReservations (
    AgencyReservationID INT PRIMARY KEY,
    AgencyID INT NOT NULL,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    BookingDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) CHECK (TotalAmount >= 0) NOT NULL
    
);

-- Add foreign key for RouteID referencing Routes table
ALTER TABLE Flights
ADD CONSTRAINT FK_Flights_RouteID
FOREIGN KEY (RouteID) REFERENCES Routes(RouteID);

-- Add foreign key for AircraftID referencing Aircrafts table
ALTER TABLE Flights
ADD CONSTRAINT FK_Flights_AircraftID
FOREIGN KEY (AircraftID) REFERENCES Aircrafts(AircraftID);

-- Add foreign key for PilotID referencing CrewMembers table
ALTER TABLE Flights
ADD CONSTRAINT FK_Flights_PilotID
FOREIGN KEY (PilotID) REFERENCES CrewMembers(CrewID);

-- Add foreign key for PassengerID referencing Passengers table
ALTER TABLE Reservations
ADD CONSTRAINT FK_Reservations_PassengerID
FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID);

-- Add foreign key for FlightID referencing Flights table
ALTER TABLE Reservations
ADD CONSTRAINT FK_Reservations_FlightID
FOREIGN KEY (FlightID) REFERENCES Flights(FlightID);

-- Add foreign key for BookingAgencyID referencing TravelAgencies table
ALTER TABLE Reservations
ADD CONSTRAINT FK_Reservations_BookingAgencyID
FOREIGN KEY (BookingAgencyID) REFERENCES TravelAgencies(AgencyID);

-- Add foreign key for PaymentID referencing Payments table
ALTER TABLE Reservations
ADD CONSTRAINT FK_Payments_PaymentID
FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID);

-- Add foreign key for ReservationID referencing Reservations table
ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_ReservationID
FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID);

-- Add foreign key for StationedAtAirportID referencing Airports table
ALTER TABLE Aircrafts
ADD CONSTRAINT FK_CrewMembers_StationedAtAirportID
FOREIGN KEY (StationedAtAirportID) REFERENCES Airports(AirportID);

-- Add foreign key for WorkScheduleID referencing WorkSchedules table
ALTER TABLE CrewMembers
ADD CONSTRAINT FK_CrewMembers_WorkScheduleID
FOREIGN KEY (WorkScheduleID) REFERENCES WorkSchedules(WorkScheduleID);

-- Add foreign key for FlightID referencing Flights table
ALTER TABLE WorkSchedules
ADD CONSTRAINT FK_CrewMembers_FlightID
FOREIGN KEY (FlightID) REFERENCES Flights(FlightID);

-- Add foreign key for CrewID referencing CrewMembers table
ALTER TABLE WorkSchedules
ADD CONSTRAINT FK_CrewAssignments_CrewID
FOREIGN KEY (CrewID) REFERENCES CrewMembers(CrewID);

-- Add foreign key for AirportID referencing Airports table for departure and arrival
ALTER TABLE Routes
ADD CONSTRAINT FK_Flights_DepartureAirportID
FOREIGN KEY (DepartureAirportID) REFERENCES Airports(AirportID);

ALTER TABLE Routes
ADD CONSTRAINT FK_Flights_ArrivalAirportID
FOREIGN KEY (ArrivalAirportID) REFERENCES Airports(AirportID);

-- Add foreign key for AgencyID referencing TravelAgencies table
ALTER TABLE AgencyReservations
ADD CONSTRAINT FK_Reservations_AgencyID
FOREIGN KEY (AgencyID) REFERENCES TravelAgencies(AgencyID);

ALTER TABLE AgencyReservations
ADD CONSTRAINT FK_AgencyReservations_PassengerID
FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID);

ALTER TABLE AgencyReservations
ADD CONSTRAINT FK_AgencyReservations_FlightID
FOREIGN KEY (FlightID) REFERENCES Flights(FlightID);

ALTER TABLE Tickets
ADD CONSTRAINT FK_Tickets_ReservationID
FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID);

ALTER TABLE Tickets
ADD CONSTRAINT FK_Tickets_FlightsID
FOREIGN KEY (FlightID) REFERENCES Flights(FlightID);

ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_AirportID
FOREIGN KEY (AirportID) REFERENCES Airports(AirportID);
