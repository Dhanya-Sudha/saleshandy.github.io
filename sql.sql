CREATE TABLE Passenger (
    P_ID int NOT NULL PRIMARY KEY,
    P_name varchar(255),
    lastName varchar(255),
    Fromloc varchar(255),
    Toloc varchar(255)
);

CREATE TABLE Driver (
    D_ID int NOT NULL PRIMARY KEY,
    D_name varchar(255),
    D_lastName varchar(255),
    Vehical_model varchar(255),
	vehical_number int
);

CREATE TABLE Payment_method (
    pm_ID int NOT NULL PRIMARY KEY,
    pm_name varchar(255),
);

CREATE TABLE Transaction_table (
    T_ID int NOT NULL PRIMARY KEY,
	P_ID int NOT NULL,
	D_ID int NOT NULL,
	pm_ID int NOT NULL,
    FOREIGN KEY (P_ID) REFERENCES Passenger(P_ID),
	FOREIGN KEY (D_ID) REFERENCES Driver(D_ID),
	FOREIGN KEY (pm_ID) REFERENCES Payment_method(pm_ID),
	Date_of_rental Date NOT NULL,
	Fare float,
	Total_Fare AS (Fare+(0.18*Fare)) PERSISTED,
	company_income AS (0.15*Fare) PERSISTED,
	Revenue_with_tax AS (0.15*(Fare+(0.18*Fare))) PERSISTED,
	driver_fare AS (0.85*Fare) PERSISTED
);
