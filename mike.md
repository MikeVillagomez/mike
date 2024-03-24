# Database Logical Model

## Tables and Constraints

### Buyer
Buyer(BuyerID, Company, FirstName, LastName, Address, City, State, PostalCode)
### Automobile
Automobile(VinNumber, BuyerID, Name, Make, Model)
	FOREIGN KEY BuyerID REFERENCES Buyer
### Maker
Maker(Mk_Id, Name, Street, City, Phone, Email)
### Feature
Feature(F_Id, Name, Mk_Id, InStock, Price, Type)
	FOREIGN KEY Mk_Id REFERENCES Maker
### FeatureList
FeatureList(VinNumber, F_Id, LineNumber, NumOrdered, ExtPrice)
	FOREIGN KEY VinNumber REFERENCES Automobile
	FOREIGN KEY F_Id REFERENCES Feature
### Transmission
### Seat
Seat(F_Id, Heated, Fabric, Power)
	FOREIGN KEY F_Id REFERENCES Feature
### Comfort
Comfort(F_Id, PowerWindow, AirConditioning)
	FOREIGN KEY F_Id REFERENCES Feature
### Integrity Constraints
- `BuyerID` in `Automobile` must match a `BuyerID` in `Buyer`.
- `Mk_Id` in `Feature` must match an `Mk_Id` in `Maker`.
- `VinNumber` in `FeatureList` must match a `VinNumber` in `Automobile`.
- `F_Id` in `FeatureList` must match an `F_Id` in `Feature`.
- `F_Id` in `Transmission` must match an `F_Id` in `Feature`.
- `F_Id` in `Seat` must match an `F_Id` in `Feature`.
- `F_Id` in `Comfort` must match an `F_Id` in `Feature`.
