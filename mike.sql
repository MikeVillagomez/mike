-- Database Logical Model

-- Buyer Table
CREATE TABLE Buyer (
	BuyerID INT PRIMARY KEY,
	Company VARCHAR(255),
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255),
	State VARCHAR(255),
	PostalCode VARCHAR(255)
);

-- Automobile Table
CREATE TABLE Automobile (
	VinNumber VARCHAR(255) PRIMARY KEY,
	BuyerID INT,
	Name VARCHAR(255),
	Make VARCHAR(255),
	Model VARCHAR(255),
	FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID)
);

-- Maker Table
CREATE TABLE Maker (
	Mk_Id INT PRIMARY KEY,
	Name VARCHAR(255),
	Street VARCHAR(255),
	City VARCHAR(255),
	Phone VARCHAR(255),
	Email VARCHAR(255)
);

-- Feature Table
CREATE TABLE Feature (
	F_Id INT PRIMARY KEY,
	Name VARCHAR(255),
	Mk_Id INT,
	InStock BOOLEAN,
	Price DECIMAL(10, 2),
	Type VARCHAR(255),
	FOREIGN KEY (Mk_Id) REFERENCES Maker(Mk_Id)
);

-- FeatureList Table
CREATE TABLE FeatureList (
	VinNumber VARCHAR(255),
	F_Id INT,
	LineNumber INT,
	NumOrdered INT,
	ExtPrice DECIMAL(10, 2),
	PRIMARY KEY (VinNumber, F_Id),
	FOREIGN KEY (VinNumber) REFERENCES Automobile(VinNumber),
	FOREIGN KEY (F_Id) REFERENCES Feature(F_Id)
);

-- Transmission Table
CREATE TABLE Transmission (
	F_Id INT PRIMARY KEY,
	Manual BOOLEAN,
	Automatic BOOLEAN,
	FOREIGN KEY (F_Id) REFERENCES Feature(F_Id)
);

-- Seat Table
CREATE TABLE Seat (
	F_Id INT PRIMARY KEY,
	Heated BOOLEAN,
	Fabric BOOLEAN,
	Power BOOLEAN,
	FOREIGN KEY (F_Id) REFERENCES Feature(F_Id)
);

-- Comfort Table
CREATE TABLE Comfort (
	F_Id INT PRIMARY KEY,
	PowerWindow BOOLEAN,
	AirConditioning BOOLEAN,
	FOREIGN KEY (F_Id) REFERENCES Feature(F_Id)
);
