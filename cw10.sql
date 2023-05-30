--1. Napisz zapytanie, kt�re wykorzystuje transakcj� (zaczyna j�), a nast�pnie
--aktualizuje cen� produktu o ProductID r�wnym 680 w tabeli Production.Product
--o 10% i nast�pnie zatwierdza transakcj�.
SELECT ProductID, ListPrice FROM Production.Product where ProductID = 707

BEGIN TRANSACTION
UPDATE Production.Product SET ListPrice = ListPrice*1.1
WHERE ProductID = 680;
COMMIT

--2. Napisz zapytanie, kt�re zaczyna transakcj�, usuwa produkt o ProductID r�wnym
--707 z tabeli Production.Product, ale nast�pnie wycofuje transakcj�.
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
BEGIN TRANSACTION;
DELETE FROM Production.Product 
WHERE ProductID = 707;
PRINT 'Produkt o ProductID 707 zosta� usuni�ty.';
SELECT * FROM Production.Product;
ROLLBACK TRANSACTION;

--3. Napisz zapytanie, kt�re zaczyna transakcj�, dodaje nowy produkt do tabeli
--Production.Product, a nast�pnie zatwierdza transakcj�.
BEGIN TRANSACTION;

INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
VALUES ('newprodukt','np-1234',0,0, 'kolorowa',7000,770, 17.70, 17.70,0,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');

COMMIT TRANSACTION;
SELECT*FROM Production.Product
--4. Napisz zapytanie, kt�re zaczyna transakcj� i aktualizuje StandardCost wszystkich
--produkt�w w tabeli Production.Product o 10%, je�eli suma wszystkich
--StandardCost po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie
--powinno wycofa� transakcj�.
BEGIN TRANSACTION;

IF (SELECT SUM(StandardCost) FROM Production.Product) + (SELECT SUM(StandardCost) * 0.10 FROM Production.Product) <= 50000
BEGIN
    UPDATE Production.Product
    SET StandardCost = StandardCost * 1.10;
    
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta�a zatwierdzona.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcja zosta�a wycofana ze wzgl�du na przekroczenie limitu sumy StandardCost.';
END

--5. Napisz zapytanie SQL, kt�re zaczyna transakcj� i pr�buje doda� nowy produkt do
--tabeli Production.Product. Je�li ProductNumber ju� istnieje w tabeli, zapytanie
--powinno wycofa� transakcj�.
BEGIN TRANSACTION;
IF EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = 'ab1234')
BEGIN
    ROLLBACK TRANSACTION;
	PRINT 'WYCOFANIE'
END
ELSE
BEGIN --trzeba zmieni� i name i product number (oba pk)
    INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
	VALUES ('newprodukt3','np-1236',0,0, 'kolorowa',7000,770, 17.70, 17.70,0,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
	COMMIT TRANSACTION;
	PRINT 'DODANIE'
END;

--6. Napisz zapytanie SQL, kt�re zaczyna transakcj� i aktualizuje warto�� OrderQty
--dla ka�dego zam�wienia w tabeli Sales.SalesOrderDetail. Je�eli kt�rykolwiek z
--zam�wie� ma OrderQty r�wn� 0, zapytanie powinno wycofa� transakcj�.
BEGIN TRANSACTION;

IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcja zosta�a wycofana ze wzgl�du na zam�wienie o OrderQty r�wnym 0.';
END
ELSE
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty * 2;
    
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta�a zatwierdzona.';
END


--7. Napisz zapytanie SQL, kt�re zaczyna transakcj� i usuwa wszystkie produkty,
--kt�rych StandardCost jest wy�szy ni� �redni koszt wszystkich produkt�w w tabeli
--Production.Product. Je�eli liczba produkt�w do usuni�cia przekracza 10,
--zapytanie powinno wycofa� transakcj�


BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);

IF @@ROWCOUNT > 10
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcja zosta�a wycofana, poniewa� liczba produkt�w do usuni�cia przekracza 10.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transakcja zosta�a zatwierdzona.';
END
