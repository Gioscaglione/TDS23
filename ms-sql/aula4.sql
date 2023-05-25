use AdventureWorks2012

-- Produtos vermelhos com preço maior que 500 e menor que 1000
select count(*) as resultadoProdutos from Production.Product 
where Color = 'Red'
and ListPrice between 500 and 1000 

-- Produtos que possuem "ROAD" no nome
select * from Production.Product
where Name like '%Road%'

--
select top 10 * from sales.SalesOrderDetail order by LineTotal desc

select top 10 avg(LineTotal)
as totalVendas
from sales.SalesOrderDetail

select FirstName, count(FirstName) as qtde from Person.Person
group by FirstName order by qtde desc

select SpecialOfferID, sum(UnitPrice) from sales.SalesOrderDetail
group by SpecialOfferID
order by sum(UnitPrice) desc


--Quantidade de produtos vendidos
select * from Sales.SalesOrderDetail
select ProductID, count(ProductID) as Vendas from Sales.SalesOrderDetail
group by ProductID

-- media preço produtos prata
select color, avg(ListPrice) 
from Production.Product
where Color = 'Silver'
group by Color

select MiddleName, count(MiddleName) as	QTDE FROM person.Person
group by MiddleName
order by MiddleName

-- media de que cada produto é vendido (salesorderdatail)
select ProductID, avg(orderqty) as 'Media produtos' from Sales.SalesOrderDetail
group by ProductID

-- quais os dez produtos que no total tiveram os maiores valores de venda agrupados por produto do maior para o menor (salesorderdatail)
select top 10 productID, sum(Linetotal) from Sales.SalesOrderDetail
group by ProductID
order by sum(LineTotal) desc

-- quantos produtos e qual a qtd media de produtos temos cadastrados nas ordens de serviço (Workorder) 
-- agrupar pelo id do produto (production.workorder)
select * from Production.WorkOrder

select ProductID, COUNT(ProductID) as QTDE, avg(OrderQty) as Media from Production.WorkOrder
group by ProductID

SELECT firstName, COUNT(firstName) as qtde
FROM Person.Person
WHERE FirstName like 'A%'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

-- agrupar os produtos (productid) por vendas totais (tomar linetotal) entre 162 mil e 500 mil
select ProductID, sum(LineTotal) as 'total vendas produtos'
from Sales.SalesOrderDetail
group by ProductID
having sum(linetotal) between 162000 and 500000

--quais produtos não estão trazendo em media vendas de um milhao no total
select ProductID, avg(LineTotal) 
from Sales.SalesOrderDetail
group by ProductID
having avg(LineTotal) < 1000