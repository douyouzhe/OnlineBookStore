create table book
	   (
	  		id varchar(40) primary key,
	  		name varchar(100) not null unique,
	  		author varchar(100) not null,
	  		price double not null,
	 		image varchar(100),
	  		description varchar(255),
	  		category_id varchar(40)
	  		-- constraint category_id_FK foreign key(category_id) references category(id)
	   );
create table user
	   (
	  		id varchar(40) primary key,
	  		username varchar(100) not null unique,
	  		password varchar(100) not null,
	  		tel varchar(100) ,
	 		email varchar(255),
	  		address varchar(255)
	   );