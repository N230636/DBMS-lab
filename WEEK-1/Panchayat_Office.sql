use gram_panchayat_db;
create table Panchayat_Office(
office_id int primary key,
office_name varchar(100) not null,
village_name varchar(50) not null,
pincode varchar(6) not null,
contact_number varchar(15) unique,
office_email varchar(100) unique,
opening_time time not null,
is_operational boolean not null
);
insert into Panchayat_Office(office_id,office_name,village_name,pincode,contact_number,office_email,opening_time,is_operational)values
(1,"Ramapuram Gram Panchayat","Ramapuram","520110",'8907652341',"ramapuram@gmail.com","09:00:00",TRUE),
(2,"Seethampeta Gram Panchayat","Seethampeta","521102","9807895674","seethampeta@gmail.com","09:30:00",TRUE),
(3,"Lakshmipuram Gram Panchayat","Lakshmipuram","521103","8768905671","lakshmipuram@gmail.com","09:00:00",TRUE),
(4,"Krishnapuram Gram Panchayat","Krishnapuram","521104","7867864532","krishnapuram@gmail.com","10:00:00",TRUE),
(5,"Venkatapuram Gram Panchayat","Venkatapuram","521105","8798976781","venkatapuram@gmail.com","09:30:00",TRUE),
(6,"Gopalapuram Gram Panchayat","Gopalapuram","521106","7867864573","gopalapuram@gmail.com","09:00:00",TRUE);
Truncate table Panchayat_Office;
select * from Panchayat_Office;

alter table Panchayat_Office add closing_time time;