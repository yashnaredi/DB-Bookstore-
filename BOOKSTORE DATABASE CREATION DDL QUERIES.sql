create database BOOKSTORE;

create table Customer (
cust_id int not null primary key,
cust_name varchar(100) not null,
username varchar(30),
pwd varchar(30),
address varchar(150),
email_id varchar(50),
phone_no int,
trans_id int );

create table order_details (
ord_id int not null primary key,
cust_id int not null,
total_price float,
item_id int not null,
trans_id int not null,
order_date datetime,
staff_id int not null );

create table item (
item_id int not null primary key,
item_desc varchar(100),
item_img blob,
price float,
genre varchar(40),
item_type varchar(20),
owner_id int not null,
publisher_id int not null,
stock int );

create table owner_details (
owner_id int not null primary key,
owner_name varchar(100),
owner_type varchar(50) );

create table transaction_details (
trans_id int not null primary key,
payment_type varchar(20),
amount float,
trans_status varchar(50) );

create table publisher (
pbl_id int not null primary key,
pbl_name varchar(100),
address varchar(200),
contact_number long,
item_id int not null );

create table staff (
staff_id int not null primary key,
staff_name varchar(100),
ssn long not null,
phone_no long,
emergency_contact long,
shifthours float,
status varchar(20),
pay_per_hour float,
designation varchar(30) );

alter table customer
add constraint FK_CUST_TRANS 
foreign key(trans_id)
references transaction_details (trans_id);

alter table order_details
add constraint FK_ORD_CUST1
foreign key(cust_id)
references customer (cust_id)
on update cascade on delete restrict;

alter table order_details
add constraint FK_ORD_ITEM
foreign key(item_id)
references item (item_id)
on update set null on delete set null;

alter table order_details
add constraint FK_ORD_TRANS 
foreign key(trans_id)
references transaction_details (trans_id);

alter table order_details
add constraint FK_ORD_STAFF
foreign key(staff_id)
references staff (staff_id);

alter table item
add constraint FK_ITM_OWNR
foreign key(owner_id)
references owner_details (owner_id);

alter table item
add constraint FK_ITM_PBL
foreign key(publisher_id)
references publisher (pbl_id)
on delete set null 
on update cascade;

alter table order_details drop foreign key FK_ORD_CUST;






