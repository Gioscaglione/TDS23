use pubs

select * from sys.tables

select * from dbo.authors

--SELECT au_lname, Count(*) FROM dbo.authors
--GROUP BY au_lname
--HAVING Count(*) > 1

select	au_fname,
		phone
from dbo.authors order by au_fname desc

select * from dbo.sales

select top 5 * 
	from dbo.sales 
	order by qty
desc

select * from dbo.authors
where state = 'CA' 
and contract = 0
order by city 

SELECT SUM(qty) as vendasTotais
FROM dbo.sales

SELECT au_id, au_lname, au_fname, phone, address, city, state, zip, contract 
FROM authors 
WHERE au_fname like 'L%'

update authors set au_lname = 'Oliveira' where au_id= '899-46-2035'

update authors set au_fname = 'Julio', au_lname = 'Henrique' where au_id = '672-71-3249'

update authors set city = 'Miami', state = 'FL' where au_id = '672-71-3249'

select * from authors
select * from titleauthor

select authors.*, titleauthor.* 
from authors, titleauthor
where authors.au_id = titleauthor.au_id

select distinct au_id from titleauthor

SELECT au_id, Count(*) FROM dbo.titleauthor
GROUP BY au_id
HAVING Count(*) > 1

delete from authors where au_id = '724-08-9931'

SELECT a.au_id,a.au_lname ,a.au_fname ,a.phone,a.address,a.city,a.state,
a.zip,a.contract,t.au_id,t.title_id,t.au_ord,t.royaltyper
FROM authors a INNER JOIN titleauthor t ON a.au_id = t.au_id

select a.au_id as 'Id do Autor', a.au_lname as 'Sobrenome autor', a.state, t.au_id as 'Id Autor na tabela title', t.title_id as 'Id do titulo',
t.au_ord, t.royaltyper as 'Tipo de Royalt'
from authors a inner join titleauthor t 
on a.au_id = t.au_id