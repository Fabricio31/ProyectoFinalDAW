#Modificando Base de datos 
CREATE DATABASE gamers_final_v1;
USE gamers_final_v1;

CREATE TABLE tb_user(
id_user INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
second_name VARCHAR(30) NOT NULL,
last_name_pat VARCHAR(30) NOT NULL,
last_name_mat VARCHAR(30) NOT NULL,
age INT NOT NULL,
email VARCHAR(90) NOT NULL,
num_phone CHAR(9) NOT NULL
);

insert into tb_user values (null,'Fabricio','Alexander','Becerra','Azana',20,'fabricio@gmail.com',999888777);
insert into tb_user values (null,'Raul','Daniel','Lopez','Carrasco',18,'raul@gmail.com',999888777);
insert into tb_user values (null,'Pedro','Manuel','Gonzales','Rios',27,'pedro@gmail.com',999888777);
insert into tb_user values (null,'Juan','Romeo','Vergara','Rodriguez',20,'juan@gmail.com',999888777);
insert into tb_user values (null,'Luis','Adrian','Tardillo','Sanchez',20,'luis@gmail.com',999888777);

select * from tb_user;

#Elimine la relacion producto con usuario
CREATE TABLE tb_product(
id_product INT AUTO_INCREMENT PRIMARY KEY,
stock INT NOT NULL,
price DOUBLE NOT NULL
);
	#ID 1000 PARA CONSOLAS
insert into tb_product values (1001,10,600.99);
insert into tb_product values (1002,10,600.99);
insert into tb_product values (1003,10,600.99);
	#ID 2000 PARA JUEGOS
insert into tb_product values (2001,10,600.99);
	#ID 3000 PARA ACCESORIOS
insert into tb_product values (3001,10,600.99);

select * from tb_product;

CREATE TABLE tb_console(
id_console INT PRIMARY KEY,
name_console VARCHAR(50) NOT NULL,
description VARCHAR(80) NOT NULL,
FOREIGN KEY(id_console) REFERENCES tb_product(id_product)
);

insert into tb_console values (1001,'Xbox Series X','Consola marca xbox 2023');
insert into tb_console values (1002,'Play Station 5','Consola marca play station 2023');
insert into tb_console values (1003,'PC','PC de sobre mesa 2023');
select * from tb_console;

#Añadi la tabla categoria para relacionar con tabla juegos
CREATE TABLE tb_category
(
category_id Integer PRIMARY KEY,
category_name varchar(255)
);
INSERT into tb_category values(001, 'Accion');
INSERT into tb_category values(002, 'Aventura');
INSERT into tb_category values(003, 'Rol');
INSERT into tb_category values(004, 'Simulacion');
INSERT into tb_category values(005, 'Estrategia');
INSERT into tb_category values(006, 'Deportes');
INSERT into tb_category values(007, 'Carreras');
INSERT into tb_category values(008, 'Realidad Virtual');

select * from tb_category;

#Añadi la tabla plataforma para relacionar con tabla juegos
create table tb_platforms
(
platform_id Integer PRIMARY KEY,
plataform_name varchar(255)
);

insert into tb_platforms values (1,'Steam');
insert into tb_platforms values (2,'Epic Games');
insert into tb_platforms values (3,'GOG');
insert into tb_platforms values (4,'Origin');
insert into tb_platforms values (5,'Ubisoft');
insert into tb_platforms values (6,'Blizzard');

select * from tb_platforms;

#Añadi los campos category_id y plataform_id
CREATE TABLE tb_game(
id_game INT PRIMARY KEY,
name_game VARCHAR(50) NOT NULL,
description VARCHAR(80) NOT NULL,
type_console INT,
category_id INT,
platform_id INT,
FOREIGN KEY(id_game) REFERENCES tb_product(id_product),
FOREIGN KEY(type_console) REFERENCES tb_console(id_console),
FOREIGN KEY(category_id) REFERENCES tb_category(category_id),
FOREIGN KEY(platform_id) REFERENCES tb_platforms(platform_id)
);

insert into tb_game values (2001,'Red Dead Redemption II','Red Dead Redemption II',1003,002,2);
select * from tb_game;



#Añadi la tabla para relacionar con los accesorios
create table tb_companies
(
	id_company int primary key,
    name_company varchar(255)
);

insert into tb_companies values (1,'Corsair');
insert into tb_companies values (2,'Razer');
insert into tb_companies values (3,'Lenovo');
insert into tb_companies values (4,'Hyperx');
insert into tb_companies values (5,'Logitech');
insert into tb_companies values (6,'Microsoft');
insert into tb_companies values (7,'Play Station');

select * from tb_companies;

#Añadi el campo id_company
CREATE TABLE tb_accessories(
id_accessories INT PRIMARY KEY,
name_accessories VARCHAR(50) NOT NULL,
description VARCHAR(80) NOT NULL,
id_company INT,
FOREIGN KEY(id_accessories) REFERENCES tb_product(id_product),
FOREIGN KEY(id_company) REFERENCES tb_companies(id_company)
);
insert into tb_accessories values (3001,'Mando Xbox One Wireless','Mando para xbox/pc inalambrico',6);
select * from tb_accessories;

CREATE TABLE tb_order_exchange(
id_order INT AUTO_INCREMENT PRIMARY KEY,
id_user INT,
order_date DATETIME,
id_product INT,
id_user_exchange INT,
FOREIGN KEY(id_user) REFERENCES tb_user(id_user),
FOREIGN KEY(id_product) REFERENCES tb_product(id_product),
FOREIGN KEY(id_user_exchange) REFERENCES tb_user(id_user)
);

insert into tb_order_exchange values (null,1,'2023-12-31 23:59:59',2001,2);
select * from tb_order_exchange;

#le quite el campo id_user_buy
CREATE TABLE tb_order_buy(
id_order INT AUTO_INCREMENT PRIMARY KEY,
id_user INT,
order_date DATETIME,
id_product INT,
FOREIGN KEY(id_user) REFERENCES tb_user(id_user),
FOREIGN KEY(id_product) REFERENCES tb_product(id_product)
);
insert into tb_order_buy values (null,1,'2023-12-31 23:59:59',2001);
insert into tb_order_buy values (null,1,'2023-12-31 23:59:59',3001);
select * from tb_order_buy;


create table tb_admin
(
	id_admin int primary key,
	fullaname_admin varchar(255),
    username_admin varchar(255),
    password_admin varchar(255),
    email_admin varchar(255),
    phone_admin int(9)
);

insert into tb_admin values (1,'Becerra Azana Fabricio Alexander','Admin01','Admin01','admin@gmail.com',999888777);
select * from tb_admin;


#############################################################################################################################################################################
#									LOS CAMPOS QUE NO TIENEN # SON LOS NUEVOS           																					#
#############################################################################################################################################################################
#TABLAS CON SUS CAMPOS 
	select * from tb_user; 																	#id_user, first_name, second_name, last_name_pat, last_name_mat, age, email, num_phone
	select * from tb_product;																#id_product, stock, price, id_user
	select * from tb_console;																#id_console, name_console, description
    select * from tb_category;	
    select * from tb_platforms;
	select * from tb_game;																	#id_game, name_game, description, type_console
    select * from tb_companies;
	select * from tb_accessories;															#id_accessories, name_accessories, description
	select * from tb_order_exchange;														#id_order, id_user, order_date, id_product, id_user_exchange
	select * from tb_order_buy;																#id_order, id_user, order_date, id_product, id_user_buy
	select * from tb_admin;
#############################################################################################################################################################################
#TABLAS PARA CRUD 
	# select * from tb_product;  -- ya esta 
    # select * from tb_console;  -- ya esta 
    # select * from tb_game;
    # select * from tb_accessories; --ya esta 
	# NUEVAS OPCIONES PARA CRUD :
    # select * from tb_category; --yo categoria
	# select * from tb_platforms;
    # select * from tb_companies;
    
    
    -- 
    describe tb_category
    
#############################################################################################################################################################################
#TABLAS RELACIONAS 
	select * from tb_user; 																	
	select * from tb_product;																
	select * from tb_console;																
    select * from tb_category;	
    select * from tb_platforms;
	select * from tb_game;																
    select * from tb_companies;
	select * from tb_accessories;															
	select * from tb_order_exchange;														
	select * from tb_order_buy;																
	select * from tb_admin;
    
	select * from tb_game g join tb_console c on g.type_console = c.id_console join tb_category y on g.category_id = y.category_id join tb_platforms p on g.platform_id = p.platform_id;
	select 
	g.id_game,g.name_game,g.description,g.type_console,c.name_console,g.category_id,y.category_name,g.platform_id,p.plataform_name
    from tb_game g join tb_console c on g.type_console = c.id_console join tb_category y on g.category_id = y.category_id join tb_platforms p on g.platform_id = p.platform_id;
    
	select * from tb_accessories a join tb_companies c on a.id_company = c.id_company ;
	select 
    a.id_accessories,a.name_accessories,a.description,a.id_company,c.name_company
    from tb_accessories a join tb_companies c on a.id_company = c.id_company  ;  
    
    select * from tb_order_exchange o join tb_user u on o.id_user = u.id_user join tb_product p on o.id_product = p.id_product join tb_game g on p.id_product = g.id_game join tb_user z on o.id_user_exchange = z.id_user;
    
    
	select * from tb_order_buy o join tb_user u on o.id_order = u.id_user join tb_product p on o.id_product = p.id_product join tb_game g on p.id_product =g.id_game;
    
    
    select * from tb_order_buy o join tb_user u on o.id_order = u.id_user join tb_product p on o.id_product = p.id_product join tb_accessories a on p.id_product =a.id_accessories;
    
    
#############################################################################################################################################################################
															#VISTA GENERAL DE LA BASE DE DATOS 
#############################################################################################################################################################################
#VISTA DE TODOS LOS PRODUCTOS COMPRADOS
select 
b.id_order,b.id_user,u.first_name,u.email,b.order_date,b.id_product,p.price
from tb_order_buy b join tb_user u on b.id_user = u.id_user join tb_product p on b.id_product = p.id_product 
 ;
 #VISTA DE TODOS LOS JUEGOS COMPRADOS
select 
b.id_order,b.id_user,u.first_name,u.email,b.order_date,b.id_product,g.name_game,g.type_console,c.name_console,p.price
from tb_order_buy b join tb_user u on b.id_user = u.id_user join tb_product p on b.id_product = p.id_product join tb_game g on p.id_product = g.id_game join tb_console c 
on g.type_console = c.id_console  
 ;
  #VISTA DE TODOS LOS ACCESORIOS COMPRADOS
select 
b.id_order,b.id_user,u.first_name,u.email,b.order_date,b.id_product,a.name_accessories,p.price
from tb_order_buy b join tb_user u on b.id_user = u.id_user join tb_product p on b.id_product = p.id_product join tb_accessories a on p.id_product = a.id_accessories
 ; 
  ############################################################################################################################################################################# 
  
  #falta tabla para los envios 
