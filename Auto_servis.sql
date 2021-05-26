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
kategorija_djelatnik int not null,
email varchar(50),
br_ugovora int
);
create table vozilo(
sifra int not null primary key auto_increment,
marka varchar(100) not null,
tip_model varchar(100),
br_šasije varchar(50),
boja varchar(50),
u_prometu_od date,
br_predjenih_kilometara varchar(100),
sledeci_servis date,
klijent int
);
create table usluga(
sifra int not null primary key auto_increment,
radni_sat decimal(18.2),
cjena_radniSat int not null,
opis varchar(200),
kategorija_usluga int not null
);
create table servis_usluga(
sifra int not null primary key auto_increment,
djelatnik int,
vozilo int,
usluga int,
datum date,
placeno bit not null
);
create table kategorija_usluga(
sifra int not null primary key auto_increment,
auto_mehanika bit not null,
auto_elektrika bit not null,
punjenje_klima bit,
auto_diagnostika bit,
vulkanizacija bit
);
create table kategorija_djelatnik(
sifra int not null primary key auto_increment,
auto_mehanika bit  not null,
auto_elektrika bit  not null,
auto_elektro_mehanicar_vulkanizer bit not null
);

alter table servis_usluga add foreign key (vozilo) references vozilo(sifra);
alter table servis_usluga add foreign key (usluga) references usluga(sifra);
alter table vozilo add foreign key (klijent) references klijent(sifra);
alter table servis_usluga add foreign key (djelatnik) references djelatnik(sifra);
alter table usluga add foreign key (kategorija_usluga) references kategorija_usluga(sifra);
alter table djelatnik add foreign key (kategorija_djelatnik) references kategorija_djelatnik(sifra);

select * from djelatnik;
select * from klijent;
select * from usluga;
select * from vozilo;
select * from servis_usluga;









