use gram_panchayat_db;
create table Certificate_Type(
certificate_type_id int primary key,
certificate_name varchar(100) unique,
description varchar(200) not null,
processing_days int not null,
application_fee decimal(8,2) not null,
is_available boolean not null
);
insert  into Certificate_Type(certificate_type_id,certificate_name,description,processing_days,application_fee,is_available)values
(1,"Residence Certificate","Certifies the declared place of residence",7,30.00,TRUE),
(2,"Birth REcord Request","Request for a locally maintained birth record",5,20.00,TRUE),
(3,"Death Record Request","Request for a locally maintained death record",5,20.00,TRUE),
(4,"Family Member Certificate","Records declared family-member information",10,40.00,TRUE),
(5,"Property Certificate","Certificates related to locally maintained properly records",15,50.00,TRUE),
(6,"No-Dues Certificate","Indicates applicable local dues status",7,25.00,FALSE);
select * from Certificate_Type;

insert  into Certificate_Type(certificate_type_id,certificate_name,description,processing_days,application_fee,is_available)values
(7,"Income Certificate","Certifies the realted to annual income",8,50.00,TRUE);

update Certificate_Type set processing_days=12 where certificate_name="Property Certificate";

update Certificate_Type set is_available=TRUE where certificate_name="No-Dues Certificate";

insert  into Certificate_Type(certificate_type_id,certificate_name,description,processing_days,application_fee,is_available)values
(8,"Certifies the declared place of residence",7,30.00,TRUE);