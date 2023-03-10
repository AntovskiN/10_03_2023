SELECT * FROM "User";

UPDATE "Item"
SET "Price" = '85.70', "Description" = '4/5 condition'
WHERE "ItemName" = 'Yamaha DTX6K-X'

DELETE FROM "Country" WHERE Name = 'Hungary';

SELECT * FROM Item i
LEFT JOIN "ItemType" it on it."Id" = i."Id";

SELECT * FROM Item i
FULL OUTER JOIN "ItemType" it on it."Id" = i."Id";