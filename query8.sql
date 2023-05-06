--1. Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki pracownika oraz jego danych, a nast�pnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwi�� w oparciu o AdventureWorks
WITH exp1 (FirstName, LastName, Rate)
AS
(
	SELECT FirstName, LastName, Rate FROM AdventureWorks2019.Person.Person AS person
	INNER JOIN AdventureWorks2019.HumanResources.EmployeePayHistory AS pay
	ON person.BusinessEntityID = pay.BusinessEntityID
)
SELECT * FROM exp1;

--2. Uzyskaj informacje na temat przychod�w ze sprzeda�y wed�ug firmy i kontaktu (za pomoc� CTE i bazy AdventureWorksL).
SELECT *FROM SalesLT.SalesOrderHeader;

WITH exp2 (CompanyContact, Revenue)
AS
(
	SELECT concat(CompanyName, ' (', FirstName, ' ', LastName, ')') AS CompanyContact, TotalDue AS Revenue 
	FROM AdventureWorksLT2019.SalesLT.Customer AS customer
	INNER JOIN AdventureWorksLT2019.SalesLT.SalesOrderHeader AS header
	ON customer.CustomerID = header.CustomerID
)
SELECT * FROM exp2
ORDER BY CompanyContact;

--3. Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w. Wykorzystaj CTE i baz� AdventureWorksLT.
WITH exp3 (Category, SalesValue)
AS
(
SELECT kat.Name AS Category, ROUND(LineTotal, 2) AS SalesValue FROM AdventureWorksLT2019.SalesLT.Product AS produkt
INNER JOIN AdventureWorksLT2019.SalesLT.ProductCategory AS kat
ON produkt.ProductCategoryID = kat.ProductCategoryID
INNER JOIN AdventureWorksLT2019.SalesLT.SalesOrderDetail AS detail
ON produkt.ProductID = detail.ProductID
)
SELECT Category, CAST(ROUND(SUM(SalesValue),2) AS DECIMAL (10,2)) AS SalesValue FROM exp3
GROUP BY Category
ORDER BY Category;
