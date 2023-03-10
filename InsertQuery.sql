INSERT INTO ItemType VALUES
(newid(), 'Electric Guitar'),
(newid(), 'Acoustic Guitar'),
(newid(), 'Bass Guitar'),
(newid(), 'Drums'),
(newid(), 'Violin'),
(newid(), 'Ukulele'),
(newid(), 'Piano');

INSERT INTO Country VALUES
(newid(), 'Croatia'),
(newid(), 'Czech republic'),
(newid(), 'North Macedonia'),
(newid(), 'Hungary'),
(newid(), 'Slovakia');

INSERT INTO "Location" VALUES
(newid(), 'Osijek', 'Osjecka 12', (SELECT "Id" FROM "Country" WHERE "Name"='Croatia')),
(newid(), 'Zagreb', 'Zagrebacka 8', (SELECT "Id" FROM "Country" WHERE "Name"='Croatia')),
(newid(), 'Vukovar', 'Vukovarska 23', (SELECT "Id" FROM "Country" WHERE "Name"='Croatia')),
(newid(), 'Brno', 'Brnenska 15', (SELECT "Id" FROM "Country" WHERE "Name"='Czech republic')),
(newid(), 'Praha', 'Prazska 7', (SELECT "Id" FROM "Country" WHERE "Name"='Czech republic'));

INSERT INTO Item (Id, ItemName, ItemTypeId, LocationId, ItemLocation, "Description", Price, Available) VALUES
(newid(), 'Ibanez RG421EX', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Electric Guitar'), 
(SELECT "Id" FROM "Location" WHERE "Name" = 'Osijek'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Osijek'), 
'4/5 condition', '50.20', '0'),
(newid(), 'Schecter Demon 8', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Electric Guitar'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Brno'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Brno'), 
'5/5 condition', '80.50', '1'),
(newid(), 'Ibanez JEM7VP', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Electric Guitar'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Praha'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Praha'), 
'3/5 condition', '70.10', '1'),
(newid(), 'Jackson JS32', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Electric Guitar'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Brno'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Brno'), 
'4/5 condition', '40.20', '0'),
(newid(), 'Tanglewood TW10 E', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Acoustic Guitar'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Zagreb'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Zagreb'), 
'5/5 condition', '30.70', '0'),
(newid(), 'Furch Blue G-SW 12', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Acoustic Guitar'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Zagreb'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Zagreb'), 
'3/5 condition', '20.80', '1'),
(newid(), 'Yamaha DTX6K-X', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Drums'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Brno'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Brno'), 
'5/5 condition', '100.00', '1'),
(newid(), 'Roland VAD307', (SELECT "Id" FROM "ItemType" WHERE "TypeName" = 'Drums'),
(SELECT "Id" FROM "Location" WHERE "Name" = 'Osijek'), (SELECT "Description" FROM "Location" WHERE "Name" = 'Osijek'), 
'4/5 condition', '250.50', '0');

INSERT INTO "User" VALUES
(newid(), 'Nikola', 'Antovski'),
(newid(), 'Iva', 'Turalija'),
(newid(), 'John', 'Wick'),
(newid(), 'Sylvanas', 'Windrunner'),
(newid(), 'Leeroy', 'Jenkins'),
(newid(), 'Jane', 'Doe');

INSERT INTO UserAccount VALUES
(newid(), 'nantovski', 'na123', (SELECT "Id" FROM "Location" WHERE "Name" = 'Brno'),
'+420777777777', 'nantovski@mail.com', (SELECT "Id" FROM "User" WHERE "FirstName" = 'Nikola' AND "LastName" = 'Antovski')),
(newid(), 'ituralija', 'it123', (SELECT "Id" FROM "Location" WHERE "Name" = 'Osijek'),
'+38563486954', 'ituralija@mail.com', (SELECT "Id" FROM "User" WHERE "FirstName" = 'Iva' AND "LastName" = 'Turalija')),
(newid(), 'jwick', 'jw123', (SELECT "Id" FROM "Location" WHERE "Name" = 'Praha'),
'+420123456789', 'jwick@mail.com', (SELECT "Id" FROM "User" WHERE "FirstName" = 'John' AND "LastName" = 'Wick')),
(newid(), 'swindrunner', 'sw123', (SELECT "Id" FROM "Location" WHERE "Name" = 'Vukovar'),
'+666987654321', 'swindrunner@mail.com', (SELECT "Id" FROM "User" WHERE "FirstName" = 'Sylvanas' AND "LastName" = 'Windrunner'));

INSERT INTO ItemRented VALUES
(newid(), (SELECT "Id" FROM "Item" WHERE "ItemName" = 'Schecter Demon 8'),
(SELECT "Id" FROM "UserAccount" WHERE "Username" = 'nantovski'), '2023-03-10', '2023-04-10', 
(SELECT "Price" FROM "Item" WHERE "ItemName" = 'Schecter Demon 8'));