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

-- insert into table category
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

-- insert into table book
insert into book values ('1','The Universe in Your Hand: A Journey Through Space, Time, and Beyond',
'Christophe Galfard',9.98,
'images/bookImages/the-universe-in-your-hand.jpg','','6');

insert into book values ('2','Life of Pi',
'Yann Martel',8.81,
'images/bookImages/life-of-pi.jpg','','9');

insert into book values ('3','Gordon Ramsay''s Home Cooking: Everything You Need to Know to Make Fabulous Food',
'Gordon Ramsay',20.22,
'images/bookImages/ramsy-cook-book.jpg','','4');

insert into book values ('4','The Going-To-Bed Book',
'Sandra Boynton',3.25,
'images/bookImages/going-to-bed.jpg','','1');

insert into book values ('5','Advanced High Dynamic Range Imaging: Theory and Practice',
'Francesco Banterle and Alessandro Artusi',67.4,
'images/bookImages/Advanced High DynamicRange ImagingTheory andPractice.jpg','','2');

insert into book values ('6','A Natural Woman: A Memoir',
'Carole King',11.54,
'images/bookImages/A-Natural-Woman-A-Memoir.jpg','','3');

insert into book values ('7','A People''s History of the United States',
'Howard Zinn',10.97,
'images/bookImages/A-Peoples-History-of-the-United States.jpg','','5');

insert into book values ('8','The Girl Who Lived: A Thrilling Suspense Novel',
'Christopher Greyson',11.69,
'images/bookImages/The Girl Who Lived- A Thrilling Suspense Novel.jpg','','7');

insert into book values ('9','See Me',
' Nicholas Sparks',5.98,
'images/bookImages/See Me.jpg','','8');

insert into book values ('10','The Final Four',
'CPaul Volponi',6.57,
'images/bookImages/The Final Four.jpg','','10');

