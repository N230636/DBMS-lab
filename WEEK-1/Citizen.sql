create database gram_panchayat_db;
use gram_panchayat_db;
create table Citizen(
citizen_id int primary key,
full_name varchar(100) not null,
date_of_birth date not null,
gender varchar(10) not null,
mobile_number varchar(15) unique,
occupation varchar(50),
village_name varchar(50) not null,
is_active boolean not null
);
insert into Citizen(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active) values
(101,"Ravi",'1995-09-23',"Male",7594573089,"Farmer","Ramapuram",TRUE),
(102,"Laxmi",'1997-08-30',"Female",8456782356,"Tailor","Ramapuram",TRUE),
(103,"Suresh",'1998-07-06',"Male",9876543219,"Shopkeeper","Seethampets",TRUE),
(104,"Anjali",'1999-05-04',"Female",8907653452,"Student","Ramapuram",TRUE),
(105,"Kiran",'2000-09-06',"Male",8905672341,"Electrician","Seethampeta",TRUE),
(106,"Meena",'1998-01-10',"Female",6789054231,"Teacher","Laxmipuram",FALSE); 
select * from Citizen;

insert into Citizen(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active) values
(107,"Radha",'1996-09-23',"Female",75678573089,"Farmer","Ramapuram",TRUE);

update Citizen set occupation="Electrical Technician" where citizen_id=105;

delete from Citizen where citizen_id=107;

alter table Citizen add address varchar(100);

insert into Citizen(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active) values
(101,"Radha","1996-09-23","Female",75678573089,"Farmer","Ramapuram",TRUE);

insert into Citizen(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active) values
(108,"Radha","1996-09-23","Female",9876543219,"Farmer","Ramapuram",TRUE);