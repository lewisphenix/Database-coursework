drop table if exists client;
create table client(
	ClientidClient integer primary key,
	name char(50),
	Solicitor_idSolicitor integer,
	foreign key(Solicitor_idSolicitor) references solicitor(idSolicitor));

drop table if exists property;
create table property(
	idProperty integer primary key,
	nameProperty char(50),
	propertyType char(8),
	saleStatus char(8),
	Seller_ID integer,
	Buyer_ID integer,
	foreign key(Seller_ID) references client(ClientidClient),
	foreign key(Buyer_ID) references client(CLientidClient));

drop table if exists solicitor;
create table solicitor(
	idSolicitor integer primary key,
	nameSolicitor char(50));

drop table if exists clientproperty;
create table clientproperty(
	Client_idClient integer,
	Property_idProperty integer,
	dateOfLastVisit date,
	primary key(Client_idClient,Property_idProperty),
	foreign key(Client_idClient) references client(ClientidClent),
	foreign key(Property_idProperty) references client(ClientidClient));
	
insert into clientproperty
	SELECT 9,2,'10/10/2003'
	UNION SELECT 10,1,'01/01/2004';
	
insert into client
	SELECT 1,'Sydney Carlton', 1
	UNION SELECT 2'Henrietta Boffin',1
	UNION SELECT 3'Canon Crisparkle',1
	UNION SELECT 4'Jack Dawkins',2
	UNION SELECT 5'Fanny Dombey',2
	UNION SELECT 6'Edwin Drood',3
	UNION SELECT 7'Tom Gradgrind',3
	UNION SELECT 8'Estella Havisham',1
	UNION SELECT 9'Jacob Marley',3
	UNION SELECT 10'Daniel Peggotty',3
	UNION SELECT 11'Samuel Slumkey',1
	UNION SELECT 12'Waskford Squeers',2;
	
insert into property
	SELECT 1,'Bleak House','house','for sale',4,NULL
	UNION SELECT 2,'Satis House','house','for sale',8,NULL
	UNION SELECT 3,'Sea View','bungalow','for sale',5,NULL
	UNION SELECT 4,'Badgers Cottage','bungalow','on offer',3,8
	UNION SELECT 5,'Riverside House','house','for sale',7,NULL;
	
insert into solicitor
	SELECT 1,'Jaggers'
	UNION SELECT 2,'Sampson Brass'
	UNION SELECT 3,'Dodson and Fogg';
	
select name, dateOfLastVisit from 