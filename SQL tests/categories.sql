SELECT * FROM my_first_db.categories;
create table categories(
id int not null Auto_increment,
name varchar(30) not null,
country varchar(30) not null,
primary key(id));

insert into categories( name,country)
values ('Clothing','Ukraine'),('Clothing','Poland'),('Laptops','USA'),('Laptops','Germany'),('Toys','Ukraine'),('Toys','Poland');

alter table categories
drop column  country;
alter table categories
drop column  name;

alter table categories
add column name varchar(30) ;

insert into categories(name)
values ('Clothing'),('Laptops'),('Toys');

select * from categories;
