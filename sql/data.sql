create table category
	 (
		id varchar(40) primary key,
		name varchar(100) not null unique,
		description varchar(255)
	 );
create table book
	   (
	  		id varchar(40) primary key,
	  		name varchar(100) not null unique,
	  		author varchar(100) not null,
	  		price double not null,
	 		  image varchar(100),
	  		description varchar(255),
	  		category_id varchar(40),
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

insert into book values ('38','Tell Me Three Thing',
'Julie Buxbaum',7.99,
'images/bookImages/51k3UylUevL._AC_US218_.jpg','','10');
insert into book values ('39','The Girl from Everywhere',
'Heidi Heilig',6.99,
'images/bookImages/41a5h-r3wYL._AC_US218_.jpg','','10');
insert into book values ('40','Boy21 (Top Ten Best Fiction for Young Adults)',
'Matthew Quick',8.99,
'images/bookImages/51gbQtO3SiL._AC_US218_.jpg','','10');


insert into book values ('35','Age of Myth: Book One of The Legends of the First Empire',
'Michael J. Sullivan',9.99,
'images/bookImages/51N8Yy2eTdL._AC_US218_.jpg','','9');
insert into book values ('36','Way Station',
'NClifford D. Simak',11.65,
'images/bookImages/51dsiEEmq8L._AC_US218_.jpg','','9');
insert into book values ('37','Enchantress (The Evermen Saga Book 1)',
'James Maxwell',9.19,
'images/bookImages/51jrSopcZ-L._AC_US218_.jpg','','9');


insert into book values ('32','The British Knight',
'Louise Bay',3.99,
'images/bookImages/51H4trYHt-L._AC_US218_.jpg','','8');
insert into book values ('33','Come Sundown',
'Nora Roberts',14.99,
'images/bookImages/51HgvArBBSL._AC_US218_.jpg','','8');
insert into book values ('34','Complicated',
'Kristen Ashley',23.99,
'images/bookImages/512Y8OjymeL._AC_US218_.jpg','','8');


insert into book values ('29','The Girl Who LivedII: A Thrilling Suspense Novel',
'Christopher Greyson',12.99,
'images/bookImages/51iGxZUbT2L._AC_US218_.jpg','','7');
insert into book values ('30','And Then She Was GONE: A riveting new suspense novel',
'Christopher Greyson',7.99,
'images/bookImages/51W1IWg0QWL._AC_US218_.jpg','','7');
insert into book values ('31','Origin: A Novel',
'Dan Brown',14.99,
'images/bookImages/51oICD9UWKL._AC_US218_.jpg','','7');


insert into book values ('26','End Game (Will Robie Series)',
'David Baldacci',14.99,
'images/bookImages/51WUUI74CjL._AC_US218_.jpg','','6');

insert into book values ('27','A Column of Fire (Kingsbridge)',
'Ken Follett',15.99,
'images/bookImages/61jrkNQRseL._AC_US218_.jpg','','6');

insert into book values ('28','Little Fires Everywhere',
'Celeste Ng',13.99,
'images/bookImages/51kgOTJWNXL._AC_US218_.jpg','','6');


insert into book values ('11','The Pout-Pout Fish',
'Deborah Diesen',5.79,
'images/bookImages/51wYUOlClbL._AC_US218_.jpg','','1');

insert into book values ('12','The Giving Tree',
'Shel Silverstein',11.39,
'images/bookImages/41sl4PH795L._AC_US218_.jpg','','1');

insert into book values ('13','If Animals Kissed Good Night',
'Ann Whitford Paul',7.19,
'images/bookImages/51LsPRlVbGL._AC_US218_.jpg','','1');


insert into book values ('14','Art That Changed the World',
'DK',36.69,
'images/bookImages/61Y1UqLcEYL._AC_US218_.jpg','','2');
insert into book values ('15','How to Draw Cool Stuff: A Drawing Guide for Teachers and Students',
'Catherine V Holmes',21.97,
'images/bookImages/51n+dPVBHUL._AC_US218_.jpg','','2');
insert into book values ('16','If It''s Not Funny It''s Art',
'Demetri Martin',10.99,
'images/bookImages/41kVFSCrTFL._AC_US218_.jpg','','2');


insert into book values ('17','Never Look at the Empty Seats: A Memoir',
'Charlie Daniels',14.03,
'images/bookImages/51ql64wf6AL._AC_US218_.jpg','','3');
insert into book values ('18','Gold Dust Woman: The Biography of Stevie Nicks',
'Stephen Davis',18.29,
'images/bookImages/516jj8i8TsL._AC_US218_.jpg','','3');
insert into book values ('19','A River in Darkness: One Man''s Escape from North Korea',
'Masaji Ishikawa',4.99,
'images/bookImages/51P4Q9TQDmL._AC_US218_.jpg','','3');


insert into book values ('20','Cravings: Recipes for All the Food You Want to Eat',
'Chrissy Teigen',17.99,
'images/bookImages/51Hc+9Z2S2L._AC_US218_.jpg','','4');
insert into book values ('21','The Food Lab: Better Home Cooking Through Science',
'J. Kenji López-Alt',29.97,
'images/bookImages/419aGgQt-5L._AC_US218_.jpg','','4');
insert into book values ('22','The Simple Kitchen: Quick and Easy Recipes Bursting With Flavor',
'Donna Elick and Chad Elick',12.38,
'images/bookImages/61yEePr2elL._AC_US218_.jpg','','4');


insert into book values ('23','A Short History of Nearly Everything',
'Bill Bryson',9.99,
'images/bookImages/41J4CZZNiGL._AC_US218_.jpg','','5');
insert into book values ('24','The General vs. the President: MacArthur and Truman at the Brink of Nuclear War',
'H. W. Brands',12.14,
'images/bookImages/51eaeOB1iUL._AC_US218_.jpg','','5');
insert into book values ('25','Grant',
'Ron Chernow',19.99,
'images/bookImages/518U9aDIW1L._AC_US218_.jpg','','5');


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

