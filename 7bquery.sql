--1. Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako 
--argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta� 
--zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.--LT PRZE�ACZcreate function dbo.fibonacci(@n int)returns @wynik table(wynikowe int)asbegin	declare	@n1 int = 0,	@n2 int = 0,	@n3 int = 1,	@i int = 2		while(@i <=@n+1)		begin		set @n1=@n2+@n3		set @n3=@n2		set @n2=@n1		set @i=@i+1		insert into @wynik values(@n2)		end	returnend;create or alter procedure fibo(@x int)asbeginselect *from dbo.fibonacci(@x)end;exec fibo 30;--2. Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko 
--tak, aby by�o napisane du�ymi literami. GOCREATE TRIGGER trigger1
	ON Person.Person
	AFTER INSERT
	AS
		BEGIN
			UPDATE Person.Person
			SET LastName = UPPER(LastName)
			WHERE Person.BusinessEntityID IN (SELECT BusinessEntityID FROM inserted);
		END
GO
SELECT *FROM Person.BusinessEntity
INSERT INTO Person.BusinessEntity (rowguid) VALUES (NEWID());
INSERT INTO Person.Person(BusinessEntityID, FirstName, MiddleName, LastName, PersonType) VALUES (20778, 'ewka', 'beatka', 'tirurara', 'IN')
SELECT *FROM Person.Person

--3.  Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi 
--zmiana warto�ci w polu �TaxRate� o wi�cej ni� 30%.
GO
CREATE TRIGGER taxratemonitoringg
ON Sales.SalesTaxRate 
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT i.TaxRate, d.TaxRate FROM deleted AS d INNER JOIN Inserted AS i
	ON d.TaxRate * 0.7 > i.TaxRate OR d.TaxRate * 1.3 < i.TaxRate) 
	BEGIN
	PRINT 'Blad';
	END
END
GO
UPDATE Sales.SalesTaxRate SET taxRate = 0.4*TaxRate;
SELECT*FROM Sales.SalesTaxRate;



