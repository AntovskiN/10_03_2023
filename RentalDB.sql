CREATE DATABASE InstrumentRental;

CREATE TABLE Country (
    Id uniqueidentifier  NOT NULL,
    "Name" varchar(64)  NOT NULL,
    CONSTRAINT CountryAk1 UNIQUE (Name),
    CONSTRAINT CountryPk PRIMARY KEY  (Id)
);

CREATE TABLE Item (
    Id uniqueidentifier  NOT NULL,
    ItemName varchar(255)  NOT NULL,
    ItemTypeId uniqueidentifier  NOT NULL,
    LocationId uniqueidentifier  NOT NULL,
    ItemLocation text  NOT NULL,
    "Description" text  NOT NULL,
    Price decimal(8,2)  NOT NULL,
    Available bit  NOT NULL,
    CONSTRAINT ItemPk PRIMARY KEY  (Id)
);

CREATE TABLE ItemRented (
    Id uniqueidentifier  NOT NULL,
    ItemId uniqueidentifier  NOT NULL,
    RenterId uniqueidentifier  NOT NULL,
    TimeFrom date  NOT NULL,
    TimeTo date  NOT NULL,
    PriceTotal decimal(8,2)  NOT NULL,
    CONSTRAINT ItemRentedPk PRIMARY KEY  (Id)
);

CREATE TABLE ItemType (
    Id uniqueidentifier  NOT NULL,
    TypeName varchar(64)  NOT NULL,
    CONSTRAINT ItemTypeAk1 UNIQUE (TypeName),
    CONSTRAINT ItemTypePk PRIMARY KEY  (Id)
);

CREATE TABLE "Location" (
    Id uniqueidentifier  NOT NULL,
    "Name" varchar(255)  NOT NULL,
    "Description" text  NOT NULL,
    CountryId uniqueidentifier  NOT NULL,
    CONSTRAINT LocationPk PRIMARY KEY  (Id)
);

CREATE TABLE "User" (
    Id uniqueidentifier  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    CONSTRAINT UserPk PRIMARY KEY  (Id)
);

CREATE TABLE UserAccount (
    Id uniqueidentifier  NOT NULL,
    Username varchar(64)  NOT NULL,
    "Password" varchar(64)  NOT NULL,
    LocationId uniqueidentifier  NOT NULL,
    Phone varchar(255)  NULL,
    Email varchar(255)  NOT NULL,
    UserId uniqueidentifier  NOT NULL,
    CONSTRAINT UserAccountAk1 UNIQUE (Username),
    CONSTRAINT UserAccountAk2 UNIQUE (Email),
    CONSTRAINT UserAccountPk PRIMARY KEY  (Id)
);

ALTER TABLE Item ADD CONSTRAINT Item_Location
    FOREIGN KEY (LocationId)
    REFERENCES Location (Id);

ALTER TABLE UserAccount ADD CONSTRAINT UserAccount_User
    FOREIGN KEY (UserId)
    REFERENCES "User" (Id);

ALTER TABLE Item ADD CONSTRAINT Item_ItemType
    FOREIGN KEY (ItemTypeId)
    REFERENCES ItemType (Id);

ALTER TABLE ItemRented ADD CONSTRAINT ItemRented_Item
    FOREIGN KEY (ItemId)
    REFERENCES Item (Id);

ALTER TABLE ItemRented ADD CONSTRAINT ItemRented_UserAccount
    FOREIGN KEY (RenterId)
    REFERENCES UserAccount (Id);

ALTER TABLE "Location" ADD CONSTRAINT Location_Country
    FOREIGN KEY (CountryId)
    REFERENCES Country (Id);

ALTER TABLE UserAccount ADD CONSTRAINT UserAccount_Location
    FOREIGN KEY (LocationId)
    REFERENCES Location (Id);

