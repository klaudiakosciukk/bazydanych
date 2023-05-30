--1. Napisz zapytanie, które wykorzystuje transakcjê (zaczyna j¹), a nastêpnie
--aktualizuje cenê produktu o ProductID równym 680 w tabeli Production.Product
--o 10% i nastêpnie zatwierdza transakcjê.
SELECT ProductID, ListPrice FROM Production.Product where ProductID = 707

BEGIN TRANSACTION
UPDATE Production.Product SET ListPrice = ListPrice*1.1
WHERE ProductID = 680;
COMMIT

--2. Napisz zapytanie, które zaczyna transakcjê, usuwa produkt o ProductID równym
--707 z tabeli Production.Product, ale nastêpnie wycofuje transakcjê.
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
BEGIN TRANSACTION;
DELETE FROM Production.Product 
WHERE ProductID = 707;
PRINT 'Produkt o ProductID 707 zosta³ usuniêty.';
SELECT * FROM Production.Product;
ROLLBACK TRANSACTION;

--3. Napisz zapytanie, które zaczyna transakcjê, dodaje nowy produkt do tabeli
--Production.Product, a nastêpnie zatwierdza transakcjê.
BEGIN TRANSACTION;

INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
VALUES ('newprodukt','np-1234',0,0, 'kolorowa',7000,770, 17.70, 17.70,0,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');

COMMIT TRANSACTION;
SELECT*FROM Production.Product
--4. Napisz zapytanie, które zaczyna transakcjê i aktualizuje StandardCost wszystkich
--produktów w tabeli Production.Product o 10%, je¿eli suma wszystkich
--StandardCost po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie
--powinno wycofaæ transakcjê.
BEGIN TRANSACTION;

IF (SELECT SUM(StandardCost) FROM Production.Product) + (SELECT SUM(StandardCost) * 0.10 FROM Production.Product) <= 50000
BEGIN
    UPDATE Production.Product
    SET StandardCost = StandardCost * 1.10;
    
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta³a zatwierdzona.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcja zosta³a wycofana ze wzglêdu na przekroczenie limitu sumy StandardCost.';
END

--5. Napisz zapytanie SQL, które zaczyna transakcjê i próbuje dodaæ nowy produkt do
--tabeli Production.Product. Jeœli ProductNumber ju¿ istnieje w tabeli, zapytanie
--powinno wycofaæ transakcjê.
BEGIN TRANSACTION;
IF EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = 'ab1234')
BEGIN
    ROLLBACK TRANSACTION;
	PRINT 'WYCOFANIE'
END
ELSE
BEGIN --trzeba zmieniæ i name i product number (oba pk)
    INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
	VALUES ('newprodukt3','np-1236',0,0, 'kolorowa',7000,770, 17.70, 17.70,0,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
	COMMIT TRANSACTION;
	PRINT 'DODANIE'
END;

--6. Napisz zapytanie SQL, które zaczyna transakcjê i aktualizuje wartoœæ OrderQty
--dla ka¿dego zamówienia w tabeli Sales.SalesOrderDetail. Je¿eli którykolwiek z
--zamówieñ ma OrderQty równ¹ 0, zapytanie powinno wycofaæ transakcjê.
BEGIN TRANSACTION;

IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcja zosta³a wycofana ze wzglêdu na zamówienie o OrderQty równym 0.';
END
ELSE
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty * 2;
    
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta³a zatwierdzona.';
END


--7. Napisz zapytanie SQL, które zaczyna transakcjê i usuwa wszystkie produkty,
--których StandardCost jest wy¿szy ni¿ œredni koszt wszystkich produktów w tabeli
--Production.Product. Je¿eli liczba produktów do usuniêcia przekracza 10,
--zapytanie powinno wycofaæ transakcjê


BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);

IF @@ROWCOUNT > 10
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcja zosta³a wycofana, poniewa¿ liczba produktów do usuniêcia przekracza 10.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta³a zatwierdzona.';
END
