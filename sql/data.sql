CREATE SCHEMA db_bookstore;
USE db_bookstore;
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
	  		language varchar(40),
	  		storage varchar(40),
	  		sales VARCHAR (40),
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


create table review
(
id varchar(225) primary key,
book_id varchar(40),
score varchar(40),
feedback varchar(225),
constraint book_id_FK2 foreign key(book_id) references book(id)
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

insert into book values ('38','Tell Me Three Things',
'1',7.99,
'images/bookImages/51k3UylUevL._AC_US218_.jpg','Here are three things about this book: (1) It’s . . .  funny and romantic; (2) the mystery at the heart of the story will keep you turning the pages; (3) I have a feeling you’ll be very happy you read it','English','50','0','10');
insert into book values ('39','The Girl from Everywhere',
'Heidi Heilig',6.99,
'images/bookImages/41a5h-r3wYL._AC_US218_.jpg','The Girl from Everywhere, the first of two books, blends fantasy, history, and a modern sensibility. Its sparkling wit, breathless adventure, multicultural cast, and enchanting romance will dazzle readers of Sabaa Tahir and Leigh Bardugo','English','50','0','10');
insert into book values ('40','Boy21 (Top Ten Best Fiction for Young Adults)',
'Matthew Quick',8.99,
'images/bookImages/51gbQtO3SiL._AC_US218_.jpg','You can lose yourself in repetition--quiet your thoughts; I learned the value of this at a very young age.','English','50','0','10');


insert into book values ('35','Age of Myth: Book One of The Legends of the First Empire',
'Michael J. Sullivan',9.99,
'images/bookImages/51N8Yy2eTdL._AC_US218_.jpg','Since time immemorial, humans have worshipped the gods they call Fhrey, truly a race apart: invincible in battle, masters of magic, and seemingly immortal. But when a god falls to a human blade, the balance of power changes forever.','English','50','0','9');
insert into book values ('36','Way Station',
'NClifford D. Simak',11.65,
'images/bookImages/51dsiEEmq8L._AC_US218_.jpg','An ageless hermit runs a secret way station for alien visitors in the Wisconsin woods in this Hugo Award-winning science fiction classic Enoch Wallace is not like other humans.','English','50','0','9');
insert into book values ('37','Enchantress (The Evermen Saga Book 1)',
'James Maxwell',9.19,
'images/bookImages/51jrSopcZ-L._AC_US218_.jpg','After losing their parents in the last doomed uprising, two siblings will find themselves at the center of an epic struggle for power.','English','50','0','9');


insert into book values ('32','The British Knight',
'Louise Bay',3.99,
'images/bookImages/51H4trYHt-L._AC_US218_.jpg','When I’m offered the chance to leave New York to live in London for three months, I can’t pack my suitcase fast enough.','English','50','0','8');
insert into book values ('33','Come Sundown',
'Nora Roberts',14.99,
'images/bookImages/51HgvArBBSL._AC_US218_.jpg','Come Sundown named as one of Whoopi Goldberg''s "Favorite Summer Reads" on ABC''s The View and one of NY Post''s biggest blockbuster "Whizbang Books" of the summer.','English','50','0','8');
insert into book values ('34','Complicated',
'Kristen Ashley',23.99,
'images/bookImages/512Y8OjymeL._AC_US218_.jpg','When small town Nebraska sheriff Hixon Drake meets Greta Dare, the connection couldn’t be stronger, but the timing couldn’t be worse.
','English','50','0','8');


insert into book values ('29','The Girl Who LivedII: A Thrilling Suspense Novel',
'Christopher Greyson',12.99,
'images/bookImages/51iGxZUbT2L._AC_US218_.jpg','No one believes her story. The police think she’s crazy. Her therapist thinks she’s suicidal. Everyone else thinks she’s a dangerous drunk. They’re all right—but did she see the killer?','English','50','0','7');
insert into book values ('30','And Then She Was GONE: A riveting new suspense novel',
'Christopher Greyson',7.99,
'images/bookImages/51W1IWg0QWL._AC_US218_.jpg','Stacy Shaw has her whole life ahead of her. New job, new house and now a baby on the way—everything she''s ever hoped for is finally coming true. But on a warm summer night on the way home from work, she vanishes.','English','50','0','7');
insert into book values ('31','Origin: A Novel',
'Dan Brown',14.99,
'images/bookImages/51oICD9UWKL._AC_US218_.jpg','Origin is stunningly inventive—Dan Brown''s most brilliant and entertaining novel to date.','English','50','0','7');


insert into book values ('26','End Game (Will Robie Series)',
'David Baldacci',14.99,
'images/bookImages/51WUUI74CjL._AC_US218_.jpg','Will Robie and Jessica Reel are two of the most lethal people alive. They''re the ones the government calls in when the utmost secrecy is required to take out those who plot violence and mass destruction against the United States.','English','50','0','6');

insert into book values ('27','A Column of Fire (Kingsbridge)',
'Ken Follett',15.99,
'images/bookImages/61jrkNQRseL._AC_US218_.jpg','As Europe erupts, can one young spy protect his queen? International bestselling author Ken Follett takes us deep into the treacherous world of powerful monarchs, intrigue, murder, and treason with his magnificent new epic, A Column of Fire.','English','50','0','6');

insert into book values ('28','Little Fires Everywhere',
'Celeste Ng',13.99,
'images/bookImages/51kgOTJWNXL._AC_US218_.jpg','From the bestselling author of Everything I Never Told You, a riveting novel that traces the intertwined fates of the picture-perfect Richardson family and the enigmatic mother and daughter who upend their lives.','English','50','0','6');


insert into book values ('11','The Pout-Pout Fish',
'Deborah Diesen',5.79,
'images/bookImages/51wYUOlClbL._AC_US218_.jpg','Deep in the water, Mr. Fish swims about. With his fish face stuck. In a permanent pout.','English','50','0','1');

insert into book values ('12','The Giving Tree',
'Shel Silverstein',11.39,
'images/bookImages/41sl4PH795L._AC_US218_.jpg','The Giving Tree, a story of unforgettable perception, beautifully written and illustrated by the gifted and versatile Shel Silverstein, has been a classic favorite for generations.','English','50','0','1');

insert into book values ('13','If Animals Kissed Good Night',
'Ann Whitford Paul',7.19,
'images/bookImages/51LsPRlVbGL._AC_US218_.jpg','If animals kissed. like we kiss good night, Giraffe and his calf would stretch their necks high','English','50','0','1');


insert into book values ('14','Art That Changed the World',
'DK',36.69,
'images/bookImages/61Y1UqLcEYL._AC_US218_.jpg','Art That Changed the World tells the story of every major art style, movement by movement, giving art lovers a visual timeline showing key paintings that sparked each transition and explaining major events that shaped their evolution.','English','50','0','2');
insert into book values ('15','How to Draw Cool Stuff: A Drawing Guide for Teachers and Students',
'Catherine V Holmes',21.97,
'images/bookImages/51n+dPVBHUL._AC_US218_.jpg','How to Draw Cool Stuff shows simple step-by-step illustrations that make it easy for anyone to draw cool stuff with precision and confidence. ','English','50','0','2');
insert into book values ('16','If It''s Not Funny It''s Art',
'Demetri Martin',10.99,
'images/bookImages/41kVFSCrTFL._AC_US218_.jpg','Packed with hundreds of new illustrations and one-liners, IF IT''S NOT FUNNY IT''S ART is a peek into the ingenious mind of author/comedian/filmmaker Demetri Martin.','English','50','0','2');


insert into book values ('17','Never Look at the Empty Seats: A Memoir',
'Charlie Daniels',14.03,
'images/bookImages/51ql64wf6AL._AC_US218_.jpg','A tale of hard work, musical discovery, and faith, Charlie Daniels’s journey has been one of a kind.','English','50','0','3');
insert into book values ('18','Gold Dust Woman: The Biography of Stevie Nicks',
'Stephen Davis',18.29,
'images/bookImages/516jj8i8TsL._AC_US218_.jpg','Stevie Nicks is a legend of rock, but her energy and magnetism sparked new interest in this icon. At sixty-nine, she''s one of the most glamorous creatures rock has known, and the rare woman who''s a real rock ‘n'' roller.','English','50','0','3');
insert into book values ('19','A River in Darkness: One Man''s Escape from North Korea',
'Masaji Ishikawa',4.99,
'images/bookImages/51P4Q9TQDmL._AC_US218_.jpg','The harrowing true story of one man’s life in—and subsequent escape from—North Korea, one of the world’s most brutal totalitarian regimes.','English','50','0','3');


insert into book values ('20','Cravings: Recipes for All the Food You Want to Eat',
'Chrissy Teigen',17.99,
'images/bookImages/51Hc+9Z2S2L._AC_US218_.jpg','Maybe she’s on a photo shoot in Zanzibar. Maybe she’s making people laugh on TV. But all Chrissy Teigen really wants to do is talk about dinner. Or breakfast. Lunch gets some love, too.
','English','50','0','4');
insert into book values ('21','The Food Lab: Better Home Cooking Through Science',
'J. Kenji López-Alt',29.97,
'images/bookImages/419aGgQt-5L._AC_US218_.jpg','Winner of the James Beard Award for General Cooking and the IACP Cookbook of the Year Award','English','50','0','4');
insert into book values ('22','The Simple Kitchen: Quick and Easy Recipes Bursting With Flavor',
'Donna Elick and Chad Elick',12.38,
'images/bookImages/61yEePr2elL._AC_US218_.jpg','The Simple Kitchen provides a definitive answer to the question, “what’s for dinner?” with exceptional recipes for everyday meals.','English','50','0','4');


insert into book values ('23','A Short History of Nearly Everything',
'Bill Bryson',9.99,
'images/bookImages/41J4CZZNiGL._AC_US218_.jpg','One of the world’s most beloved writers and bestselling author of One Summer takes his ultimate journey—into the most intriguing and intractable questions that science seeks to answer.','English','50','0','5');
insert into book values ('24','The General vs. the President: MacArthur and Truman at the Brink of Nuclear War',
'H. W. Brands',12.14,
'images/bookImages/51eaeOB1iUL._AC_US218_.jpg','A vivid accounting of an event that was, on the surface, a personality conflict between two strong-minded figures and, at the bottom, a courageous act that solidified civilian authority over the military in wartime.','English','50','0','5');
insert into book values ('25','Grant',
'Ron Chernow',19.99,
'images/bookImages/518U9aDIW1L._AC_US218_.jpg','“Marvelous…. Chernow’s biography gives us a deep look into this complicated but straightforward man, and into a troubled time in our history that still echoes today.','English','50','0','5');


insert into book values ('1','The Universe in Your Hand: A Journey Through Space, Time, and Beyond',
'Christophe Galfard',9.98,
'images/bookImages/the-universe-in-your-hand.jpg','a wild tour through the reaches of time and space, from the interior of a proton to the Big Bang to the rough suburbs of a black hole. It''s friendly, excitable, erudite, and cosmic.','English','50','0','6');

insert into book values ('2','Life of Pi',
'Yann Martel',8.81,
'images/bookImages/life-of-pi.jpg','The beloved and bestselling novel and winner of the Booker Prize, Life of Pi.','English','50','0','9');

insert into book values ('3','Gordon Ramsay''s Home Cooking: Everything You Need to Know to Make Fabulous Food',
'Gordon Ramsay',20.22,
'images/bookImages/ramsy-cook-book.jpg','GORDON RAMSAY''S HOME COOKING will give experienced as well as novice cooks the desire, confidence, and inspiration to get cooking and will offer simple, accessible recipes.','English','50','0','4');

insert into book values ('4','The Going-To-Bed Book',
'Sandra Boynton',3.25,
'images/bookImages/going-to-bed.jpg','An ark-full of energetic animals get ready for sleep. It’s the perfect end-of-the-day book for young children. With over five million copies in print, THE GOING TO BED BOOK is listed among Publishers Weekly’s Bestselling Children Books of All Time.','English','50','0','1');

insert into book values ('5','Advanced High Dynamic Range Imaging: Theory and Practice',
'Francesco Banterle and Alessandro Artusi',67.4,
'images/bookImages/Advanced High DynamicRange ImagingTheory andPractice.jpg','Imaging techniques seek to simulate the array of light that reaches our eyes to provide the illusion of sensing scenes directly. ','English','50','0','2');

insert into book values ('6','A Natural Woman: A Memoir',
'Carole King',11.54,
'images/bookImages/A-Natural-Woman-A-Memoir.jpg','Carole King takes us from her early beginnings in Brooklyn, to her remarkable success as one of the world''s most acclaimed songwriting and performing talents of all time.','English','50','0','3');

insert into book values ('7','A People''s History of the United States',
'Howard Zinn',10.97,
'images/bookImages/A-Peoples-History-of-the-United States.jpg',' A People''s History of the United States is the only volume to tell America''s story from the point of view of -- and in the words of -- America''s women, factory workers, African Americans, Native Americans, working poor, and immigrant laborers.','English','50','0','5');

insert into book values ('8','The Girl Who Lived: A Thrilling Suspense Novel',
'Christopher Greyson',11.69,
'images/bookImages/The Girl Who Lived- A Thrilling Suspense Novel.jpg','No one believes her story. The police think she’s crazy. Her therapist thinks she’s suicidal. Everyone else thinks she’s a dangerous drunk. They’re all right—but did she see the killer?','English','50','0','7');

insert into book values ('9','See Me',
' Nicholas Sparks',5.98,
'images/bookImages/See Me.jpg','With a history of violence and bad decisions behind him and the threat of prison dogging his every step, he''s determined to walk a straight line. ','English','50','0','8');

insert into book values ('10','The Final Four',
'CPaul Volponi',6.57,
'images/bookImages/The Final Four.jpg','A triple-overtime game keeps readers on the edge of their seats, but nerve-wracking as the action on the floor may be, the baggage that the players bring to the game is equally fraught.','English','50','0','10');

