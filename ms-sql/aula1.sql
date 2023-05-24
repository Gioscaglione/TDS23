use AdventureWorks2012

select * from sys.tables 
select * from Person.Person

select FirstName from Person.Person

select	FirstName AS PrimeiroNome, 
		LastName AS UltimoNome 
from Person.Person