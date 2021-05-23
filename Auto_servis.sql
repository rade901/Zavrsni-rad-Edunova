drop database if exists Auto_servis;

create database 
    Auto_servis;

use Auto_servis;

create table klijent(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50)not null,
vozilo int not null,
usluga int,
kontakt varchar(100)
);
create table djelatnik(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50)not null,
iban varchar(21),
oib char(11),
radni_dan int not null,
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
cjena_radniSat decimal(18.2),
opis varchar(200),
placeno boolean not null
);
create table radni_dan(
sifra int not null primary key auto_increment,
vrijeme datetime,
usluga int not null,
klijent int not null,
vozilo int not null
);

alter table djelatnik add foreign key (radni_dan) references radni_dan(sifra);
alter table klijent add foreign key (usluga) references usluga(sifra);
alter table klijent add foreign key (vozilo) references vozilo(sifra);
alter table radni_dan add foreign key (klijent) references klijent(sifra);
alter table radni_dan add foreign key (usluga) references usluga(sifra);
alter table radni_dan add foreign key (vozilo) references vozilo(sifra);


select * from djelatnik;
select * from klijent;
select * from usluga;
select * from vozilo;
select * from radni_dan;

select cjena_radniSat,Auto_mehanika,marka,ime,prezime
from klijent  a 
inner join usluga b on b.sifra
inner join vozilo c on c.sifra;

insert  into vozilo (marka,tip_model,br_šasije,boja,U_prometu_od) values
('Volkswagen','Polo 1.4 variant','wvwzzz6ku1e557474','srebrena','2001-06-15');
insert  into usluga (Auto_mehanika,Auto_elektrika,Radni_sat,cjena_radniSat,opis,placeno) values
('1','1','2','200','montiranje alnasera i popravak kocnica',true);
insert  into klijent (ime,prezime,vozilo,usluga,kontakt) values
('Rade','Jasenovčanin',1,1,'0983448665');
insert  into radni_dan (vrijeme,usluga,klijent,vozilo) values
('2008-11-11 13:23:44',1,1,1);
insert  into djelatnik (ime,prezime,iban,oib,radni_dan,kontakt) values
('Dusan','Ćoralić','hr9809444899547893745','98735467892',1,'0993345566');

UPDATE usluga
SET Auto_mehanika = 'Kočnice', Auto_elektrika = 'Alnaser'
WHERE sifra = 1;




