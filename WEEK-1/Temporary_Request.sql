create table Temporary_Request(
request_id int primary key,
request_name varchar(100) not null,
request_date date not null);

insert into Temporary_Request(request_id,request_name,request_date)values
(201,"Income","2026-09-05"),
(202,"Caste","2026-08-07"),
(203,"Residence","2026-07-08");

select * from Temporary_Request;

Truncate table Temporary_Request;

drop table Temporary_Request;