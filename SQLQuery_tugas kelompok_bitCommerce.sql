create database bitCommerce
use bitCommerce;

drop table if exists customers

create table customers(
	customer_id varchar(20) primary key,
	first_name varchar(50) not null,
	last_name varchar(50),
	gender char not null,
	birth_date date not null,
	region varchar(50) not null,
	email varchar(100) not null
);

/*DECLARE @InsertedIDs TABLE (customer_id VARCHAR(20));

insert into customers(
	customer_id
)
values(
	concat('CS', convert(varchar(max),IDENTITY(1,1))
);*/

drop table if exists products
create table products(
	product_id varchar(20) primary key,
	product_name varchar(100) not null,
	product_category varchar(100) not null,
	product_price float not null check(product_price>0)
);

drop table if exists transactions
create table transactions(
	trans_id varchar(20) primary key,
	order_date datetime not null,
	quantity int not null check(quantity>0),
	amount float not null check(amount>0),
	status varchar(10),
	product_id varchar(20) not null,
	customer_id varchar(20) not null,
	constraint fk_product_id foreign key (product_id) references products(product_id),
	constraint fk_customer_id foreign key (customer_id) references customers(customer_id)
);

drop table if exists review
create table review(
	review_id varchar(20) primary key,
	comment text,
	rate int not null check(rate>=1 and rate<=5),
	customer_id varchar(20) not null
	constraint fk2_customer_id foreign key (customer_id) references customers(customer_id)
);

drop table if exists traffic_source
create table traffic_source(
	traffic_id varchar(20) primary key,
	traffic_name varchar(100) not null
);

drop table if exists events
create table events(
	event_id varchar(20) primary key,
	event_name varchar(50) not null,
	event_date datetime not null,
	customer_id varchar(20) not null,
	traffic_id varchar(20) not null,
	constraint fk3_customer_id foreign key (customer_id) references customers(customer_id),
	constraint fk_traffic_id foreign key (traffic_id) references traffic_source(traffic_id)
);