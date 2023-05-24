select * from person.Person
where BusinessEntityID = 5
or BusinessEntityID = 111
or BusinessEntityID = 23

select Weight from Production.Product
where Weight > 500
and Weight <= 700

select * from HumanResources.Employee
where MaritalStatus = 'M'
and SalariedFlag = 1
and BirthDate <= '1982/01/01'

select * from Person.Person
where FirstName = 'Peter'
and LastName = 'Krebs'

select * from person.EmailAddress
where BusinessEntityID = '26'

select Person.Person.FirstName, Person.Person.LastName, Person.EmailAddress.EmailAddress
from person.person, person.EmailAddress
where person.BusinessEntityID = EmailAddress.BusinessEntityID
and person.BusinessEntityID = 26

select COUNT(*) as 'Qtde de produtos'
from Production.Product

select * from Production.Product

select distinct name from Production.Product

select distinct title from person.Person



/*
AND - E
OR - OU
NOT - ACOMPANHADO

=
<
>
<>
>=
<=
*/