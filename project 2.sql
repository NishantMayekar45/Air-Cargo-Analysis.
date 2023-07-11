create database Airline_dataset;
use Airline_dataset;
describe routes;
create table route_details(
route_id int unique ,
flight_num int primary key,
origin_airport varchar(50),
destination_airport varchar(50),
aircraft_id int,
distance_miles int);

select * from passengers_on_flights;
select flight_num,route_id from passengers_on_flights where route_id between 1 and 25;

select * from ticket_details;
select count(no_of_tickets),class_id,sum(price_per_ticket)as total_revenue from ticket_details  where class_id = 'Bussiness'group by class_id;

select * from customer;
select concat(first_name,' ',last_name)as full_name from customer;

Select customer.*from customer inner join ticket_details on customer.customer_id = ticket_details.customer_id;

select customer.first_name,customer.last_name 
from ticket_details inner join customer on customer.customer_id = ticket_details.customer_id where ticket_details.brand = 'Emirates';

select count(class_id) from passengers_on_flights group by class_id having class_id = 'Economy Plus';

select if( sum(price_per_ticket) > 10000 ,'revenue crossed','revenue doesnot cross')as revenue from ticket_details;

select max(price_per_ticket) as' max_price',class_id from ticket_details group by  class_id ;
select customer_id,class_id ,max(price_per_ticket)  over (partition by class_id)as max_price from ticket_details;

create index idx_route_id on passengers_on_flights(route_id) ;
select * from passengers_on_flights where route_id = 4;

create view route_detail as
select customer_id,route_id,depart,travel_date,flight_num from passengers_on_flights where route_id = 4;
select * from route_detail;

EXPLAIN SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

drop view route_detail;
select customer_id,aircraft_id,sum(price_per_ticket)as total from ticket_details
group by aircraft_id,customer_id  with rollup having customer_id is not null; 

create view details as
select class_id,customer_id,brand
from ticket_details
where class_id = 'Bussiness' and brand = 'Emirates';
 
select * from details;
select * from routes;















set sql_safe_updates= 0







