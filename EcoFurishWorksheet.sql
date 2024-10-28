select c.firstName,c. lastName,s.quantitysold from dimcustomer as c left join factsales as s on c.customerid = s.customerid;
select c.email,s.saleid,s.saledate from factsales as s right join dimcustomer as c on c.customerid = s.customerid;
select s.productid, c.firstname from factsales as s inner join dimcustomer as c on s.customerid = c.customerid;
select productname,cast(price as text) as "Text Price" from dimproduct;
select c.firstName,c. lastName,
	COALESCE(cast(s.saleamount as text),'No Amount' )
from dimcustomer as c left join factsales as s 
on c.customerid = s.customerid;
select c.productname, COALESCE(s.quantitysold,0) from dimproduct as c left join factsales as s on c.productid = s.productid;
select saleamount::numeric(10,3) from factsales;
select cast(saleamount as decimal(10,3)) from factsales;
select p.productname,p.category,s.saleid,s.saledate,s.saleyear,
	case
		when p.stockquantity<10 then 'Low Stock'
		when p.stockquantity<=50 then 'Medium Stock'
		when p.stockquantity>50 then 'High Stock'
		else 'Out of Stock'
		end as "Stock Level" 

from dimproduct as p inner join factsales as s on p.productid = s.productid;
select saleid,saledate,
	case 
		when extract( month from saledate) = 1 then 'Q1'
		when extract( month from saledate) = 2 then 'Q1'
		when extract( month from saledate) = 3 then 'Q1'
		when extract( month from saledate) = 4 then 'Q2'
		when extract( month from saledate) = 5 then 'Q2'
		when extract( month from saledate) = 6 then 'Q2'
		when extract( month from saledate) = 7 then 'Q3'
		when extract( month from saledate) = 8 then 'Q3'
		when extract( month from saledate) = 9 then 'Q3'
		when extract( month from saledate) = 10 then 'Q4'
		when extract( month from saledate) = 11 then 'Q4'
		when extract( month from saledate) = 12 then 'Q4'
		else 'Date Error'
	END as "Quarter"
FROM factsales;

