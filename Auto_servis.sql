drop database if exists Auto_servis;

create database 
    Auto_servis;

use Auto_servis;

create table klijent(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50)not null,
vozilo int not null,
usluga int not null,
kontakt varchar(100),
vrijeme_dolaska datetime
);
create table djelatnik(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50)not null,
iban varchar(21),
oib char(11),
kontakt varchar(100)
);
create table vozilo(
sifra int not null primary key auto_increment,
marka varchar(100) not null,
tip_model varchar(100),
br_šasije varchar(50),
boja varchar(50),
U_prometu_od date
);
create table Usluga(
sifra int not null primary key auto_increment,
Auto_mehanika varchar(50) not null,
Auto_elektrika varchar(50) not null,
Radni_sat decimal(18.2),
cjena_radniSat int not null,
opis varchar(200),
placeno bit not null
);
create table djelatnik_vozilo_usluga(
sifra int not null primary key auto_increment,
djelatnik int,
vozilo int,
usluga int
);

alter table klijent add foreign key (vozilo) references vozilo(sifra);
alter table klijent add foreign key (usluga) references usluga(sifra);
alter table djelatnik_vozilo_usluga add foreign key (vozilo) references vozilo(sifra);
alter table djelatnik_vozilo_usluga add foreign key (djelatnik) references djelatnik(sifra);
alter table djelatnik_vozilo_usluga add foreign key (usluga) references usluga(sifra);

select * from djelatnik;
select * from klijent;
select * from usluga;
select * from vozilo;
select * from djelatnik_vozilo_usluga;

#insert into vozilo
insert  into vozilo (marka,tip_model,br_šasije,boja,U_prometu_od) values
('Volkswagen','Polo 1.4 variant','wvwzzz6ku1e557474','srebrena','2001-06-15');
insert  into vozilo (marka,tip_model,br_šasije,boja,U_prometu_od) values
('yugo','coral','wvwzzz6ku1e557474','crvena','1990-06-15');
insert  into vozilo (marka,tip_model,br_šasije,boja,U_prometu_od) values
('audi','a4','wvwzzz6ku1e557474','crvena','2011-06-15');
#insert into usluga
insert  into Usluga (Auto_mehanika,Auto_elektrika,Radni_sat,cjena_radniSat,opis,placeno) values
('zglobovi','akumulator',1,'200','montiranje zglobova i ugradnja akumulatora',true);
insert  into Usluga (Auto_mehanika,Auto_elektrika,Radni_sat,cjena_radniSat,opis,placeno) values
('lezajevi','instalacije',1,'200','montiranje lezajeva i ugradnja instalacija',true);
#insert into klijent
insert  into klijent (ime,prezime,vozilo,usluga,kontakt,vrijeme_dolaska) values
('Rade','Jasenovčanin',1,1,'0983448665','2008-11-11 13:23:44');
insert  into klijent (ime,prezime,vozilo,usluga,kontakt,vrijeme_dolaska) values
('anteo','Jurlina',2,2,'0983448665','2008-11-11 13:23:44');
#insert into djelatnik
insert  into djelatnik (ime,prezime,iban,oib,kontakt) values
('Dusan','Ćoralić','hr9809444899547893745','98735467892','0993345566');
#insert into klijent
insert  into klijent (ime,prezime,vozilo,usluga,kontakt,vrijeme_dolaska) values
('Miroslav','Tomic',1,1,'0953448665','2001-11-11 15:23:44');
#insert into klijent_usluga_vozilo
insert into djelatnik_vozilo_usluga (djelatnik,vozilo,usluga) values
(1,1,1);
insert into djelatnik_vozilo_usluga (djelatnik,vozilo,usluga) values
(1,2,2);
insert into djelatnik_vozilo_usluga (djelatnik,vozilo,usluga) values
(1,2,2);

UPDATE usluga
SET Auto_mehanika = 'Kočnice', Auto_elektrika = 'Alnaser'
WHERE sifra = 1;







