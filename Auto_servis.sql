drop database if exists Auto_servis;

create database 
    Auto_servis;

use Auto_servis;

create table klijent(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50)not null,
usluga int not null,
kontakt varchar(100)not null,
email varchar(50),
adresa_stanovanja varchar(100)
);
create table djelatnik(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50)not null,
iban varchar(21),
oib char(11),
kontakt varchar(100)not null,
kategorija int not null,
email varchar(50),
br_ugovora int
);
create table vozilo(
sifra int not null primary key auto_increment,
marka varchar(100) not null,
tip_model varchar(100),
br_sasije varchar(50),
boja varchar(50),
u_prometu_od date,
br_predjenih_kilometara varchar(100),
sledeci_servis date,
klijent int
);
create table usluga(
sifra int not null primary key auto_increment,
radni_sat decimal(18.2),
cjena_radni_sat int not null,
kategorija_usluga int not null
);
create table auto_servis(
sifra int not null primary key auto_increment,
djelatnik int,
vozilo int,
servis int,
datum date
);
create table kategorija_usluga(
sifra int not null primary key auto_increment,
opis varchar(300),
auto_mehanika varchar(300) not null,
auto_elektrika varchar(300) not null,
punjenje_klima varchar(300) not null,
auto_diagnostika varchar(300) not null,
vulkanizacija varchar(300) not null
);
create table kategorija(
sifra int not null primary key auto_increment,
sifra_djelatnika varchar(50),
auto_mehanika varchar(50) not null,
auto_elektrika varchar(50) not null,
auto_elektro_mehanicar_vulkanizer varchar(50) not null
);
create table servis(
sifra int not null primary key auto_increment,
usluga int,
placeno bit not null
);
alter table auto_servis add foreign key (vozilo) references vozilo(sifra);
alter table auto_servis add foreign key (servis) references servis(sifra);
alter table vozilo add foreign key (klijent) references klijent(sifra);
alter table auto_servis add foreign key (djelatnik) references djelatnik(sifra);
alter table usluga add foreign key (kategorija_usluga) references kategorija_usluga(sifra);
alter table djelatnik add foreign key (kategorija) references kategorija(sifra);
alter table servis add foreign key (usluga) references usluga(sifra);


select * from djelatnik;
select * from klijent;
select * from usluga;
select * from vozilo;
select * from auto_servis;
select * from servis s ;
select * from kategorija_usluga;
select * from kategorija;








