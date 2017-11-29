create table book
	   (
	  		id varchar(40) primary key,
	  		name varchar(100) not null unique,
	  		author varchar(100) not null,
	  		price double not null,
	 		image varchar(100),
	  		description varchar(255),
	  		category_id varchar(40)
	  		constraint category_id_FK foreign key(category_id) references category(id)
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
create table orders
	(
		id varchar(40) primary key,
		ordertime datetime not null,
		price double not null,
		state boolean,
		user_id varchar(40),
		constraint user_id_FK foreign key(user_id) references user(id)
	);
	
create table orderitem
	(
		id varchar(40) primary key,
		quantity int,
		price double,
		order_id varchar(40),
		book_id varchar(40),
		constraint order_id_FK foreign key(order_id) references orders(id),
		constraint book_id_FK foreign key(book_id) references book(id)
	);
create table category
	 (
		id varchar(40) primary key,
		name varchar(100) not null unique,
		description varchar(255)
	 );
insert into category values ('1','Children Book','');
insert into category values ('2','Arts&Phototgraphy','');
insert into category values ('3','Biographies&Memoirs','');
insert into category values ('4','cookbooks,Food&Wine','');
insert into category values ('5','History','');
insert into category values ('6','Literature&Fiction','');
insert into category values ('7','Mystery&Suspense','');
insert into category values ('8','Romance','');
insert into category values ('9','Sci-Fi&Fantasy','');
insert into category values ('10','Teens&Young Adult','');