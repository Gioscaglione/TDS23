create database AulaJoin

use AulaJoin

CREATE TABLE TabelaA (
    ID int,
    Nome varchar(10),
);

CREATE TABLE TabelaB (
    ID int,
    Nome varchar(10),
);

select * from TabelaA

INSERT INTO TabelaA(ID, Nome)
VALUES (1, 'Robo');

INSERT INTO TabelaA(ID, Nome)
VALUES (2, 'Macaco');

INSERT INTO TabelaA(ID, Nome)
VALUES (3, 'Samurai');

INSERT INTO TabelaA(ID, Nome)
VALUES (4, 'Monitor');

select * from TabelaB
select * from TabelaA

INSERT INTO TabelaB(ID, Nome)
VALUES (1, 'Espada');

INSERT INTO TabelaB(ID, Nome)
VALUES (2, 'Robo');

INSERT INTO TabelaB(ID, Nome)
VALUES (3, 'Mario');

INSERT INTO TabelaB(ID, Nome)
VALUES (4, 'Samurai');

-- inner join
select * from TabelaA A
inner join TabelaB B
on A.Nome = B.Nome

-- outer join
select * from TabelaA A
full outer join TabelaB B
on A.Nome = B.Nome

-- Left join com is null
SELECT * FROM TabelaA A
left join TabelaB B
on A.Nome = B.Nome
where B.Nome is null

-- Union
use AdventureWorks2012
select ProductID, Name, ProductNumber from Production.Product
where Name like '%CHAI%'
UNION
select ProductID, Name, ProductNumber from Production.Product
where Name like '%DECAL%'
ORDER BY Name desc

-- Person.Person/ EmailAddress - Id, FirstName, LastName, Email
select P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress, RH.JobTitle 
from Person.Person P
inner join Person.EmailAddress PE
on P.BusinessEntityID = PE.BusinessEntityID
inner join HumanResources.Employee RH
on P.BusinessEntityID = RH.BusinessEntityID
where RH.JobTitle LIKE '%DESI%'

select * from HumanResources.Employee

--Nome dos produtos (production.) e as informacoes de subcategoria - listprice, name, nome subcategoria
select * from Production.Product
select * from Production.ProductSubcategory

select PP.ListPrice, PP.Name, PS.Name AS SUB from Production.Product PP
inner join Production.ProductSubcategory PS
on PP.ProductSubcategoryID = PS.ProductSubcategoryID

-- TRAZER CLIENTE ID, TIPO DE TELEFONE, ID DO TELEFONE, NUMERO DO TELEFONE
select * from Person.PersonPhone
select * from Person.PhoneNumberType
select * from Person.Person

select N.FirstName AS Nome, PP.BusinessEntityID AS IdCliente, NT.Name AS Tipo, PP.PhoneNumberTypeID AS IdTipo, PP.PhoneNumber AS Número
from Person.PersonPhone PP
inner join Person.PhoneNumberType NT
on PP.PhoneNumberTypeID = NT.PhoneNumberTypeID
inner join Person.Person N
on PP.BusinessEntityID = N.BusinessEntityID
order by FirstName asc

--pessoas que tem cartao de credito registrado e quem nao tem (person.person/sales.creditcard/person.emailaddress
select * from Person.Person
select * from Sales.PersonCreditCard
select * from Person.EmailAddress

--quem tem cartao
select PP.BusinessEntityID, PP.FirstName
from Person.Person PP
inner join Sales.PersonCreditCard CC
on PP.BusinessEntityID = CC.BusinessEntityID

-- quem nao tem cartao
select PP.BusinessEntityID, PP.FirstName, CC.CreditCardID, PE.EmailAddress
from Person.Person PP
left join Sales.PersonCreditCard CC
on PP.BusinessEntityID = CC.BusinessEntityID
left JOIN Person.EmailAddress PE
on PP.BusinessEntityID = PE.BusinessEntityID
where CC.CreditCardID is null
and pe.EmailAddress is not null

select * from Production.Product order by ListPrice desc

select avg(ListPrice) from Production.Product

--438,6662

select ProductID, ListPrice from Production.Product
where ListPrice > 438.6662

select ProductID, ListPrice from Production.Product
where ListPrice > (select avg(ListPrice) from Production.Product)

--Nome dos funcionarios que são design engenieer
select * from Person.Person

select * from HumanResources.Employee
where JobTitle = 'Design Engineer'

select FirstName from Person.Person
where BusinessEntityID in (5, 6, 15)

select FirstName
from Person.Person
where BusinessEntityID in (select BusinessEntityID from HumanResources.Employee
where JobTitle = 'Design Engineer')
