drop sequence new_seq;
drop table gain;
drop table rencontre;
drop table joueur;

-- script de creation des tables de la base TENNIS
create table joueur (
   nujoueur    number(5) primary key,
   nom         varchar(20),
   prenom      varchar(20),
   annais      number(5),
   nationalite varchar(20)
);

create table gain (
   nujoueur    number(5),
   lieutournoi varchar(20),
   annee       number(5),
   prime       number(10,3),
   nomsponsor  varchar(20),
   constraint cg1 primary key ( nujoueur,
                                lieutournoi,
                                annee ),
   constraint cg2 foreign key ( nujoueur )
      references joueur ( nujoueur )
);

create table rencontre (
   nugagnant   number(5),
   nuperdant   number(5),
   lieutournoi varchar(20),
   annee       number(5),
   constraint cr1
      primary key ( nugagnant,
                    nuperdant,
                    lieutournoi,
                    annee ),
   constraint cr2 foreign key ( nugagnant )
      references joueur ( nujoueur ),
   constraint cr3 foreign key ( nuperdant )
      references joueur ( nujoueur )
);


create sequence new_seq start with 1 increment by 1 nocache nocycle
/

create or replace trigger auto_increment before
   insert on joueur
   for each row
begin
   if ( :new.nujoueur is null ) then
      select new_seq.nextval
        into :new.nujoueur
        from dual;
   end if;
end;
/

-- insertion dans la table joueur

insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'MARTINEZ',
           'Conchita',
           1972,
           'Espagne' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'NAVRATILOVA',
           'Martina',
           1957,
           'Etats-Unis' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'GRAF',
           'Steffi',
           1969,
           'Allemagne' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'HALARD',
           'Julie',
           1970,
           'France' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'PIERCE',
           'Mary',
           1975,
           'France' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'EDBERG',
           'Stephan',
           1966,
           'Suede' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'LARSSON',
           'Magnus',
           1970,
           'Suede' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'LECONTE',
           'Henri',
           1963,
           'France' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'FORGET',
           'Guy',
           1965,
           'France' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'FLEURIAN',
           'Jean-Philippe',
           1965,
           'France' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'WILANDER',
           'Mats',
           1964,
           'Suede' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'CONNORS',
           'Jimmy',
           1952,
           'Etats-Unis' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'McENROE',
           'John',
           1959,
           'Etats-Unis' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'SAMPRAS',
           'Pete',
           1972,
           'Etats-Unis' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'KUERTEN',
           'Gustavo',
           1976,
           'Bresil' );
insert into joueur (
   nom,
   prenom,
   annais,
   nationalite
) values ( 'CORRETJA',
           'Alex',
           1974,
           'Espagne' );

-- insertion dans la table gain 1


insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 16,
           'Roland Garros',
           2001,
           500000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 15,
           'Roland Garros',
           2001,
           1000000,
           'Diadora' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 14,
           'Roland Garros',
           1992,
           200000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 14,
           'Roland Garros',
           1994,
           1800000,
           'Reebok' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 14,
           'Wimbledon',
           1992,
           700000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 14,
           'Wimbledon',
           1993,
           1400000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 13,
           'Roland Garros',
           1990,
           1100000,
           'Kennex' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 13,
           'Roland Garros',
           1992,
           1500000,
           'Kennex' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 13,
           'Wimbledon',
           1989,
           350000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 13,
           'Wimbledon',
           1992,
           400000,
           'Kennex' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 12,
           'Roland Garros',
           1990,
           400000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 12,
           'Roland Garros',
           1992,
           200000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 12,
           'Wimbledon',
           1989,
           600000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 12,
           'Flushing Meadow',
           1989,
           1600000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 12,
           'Flushing Meadow',
           1991,
           1800000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 11,
           'Roland Garros',
           1990,
           700000,
           'Kennex' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 11,
           'Roland Garros',
           1992,
           500000,
           'Kennex' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 11,
           'Wimbledon',
           1989,
           1000000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 10,
           'Roland Garros',
           1994,
           600000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 10,
           'Wimbledon',
           1993,
           500000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 8,
           'Roland Garros',
           1992,
           500000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 8,
           'Roland Garros',
           1994,
           1000000,
           'Reebok' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 8,
           'Wimbledon',
           1989,
           350000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 7,
           'Roland Garros',
           1992,
           200000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 7,
           'Wimbledon',
           1993,
           800000,
           'Reebok' ); 
  
-- insertion dans la table gain 2

insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 7,
           'Flushing Meadow',
           1991,
           1000000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 6,
           'Roland Garros',
           1992,
           900000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 6,
           'Wimbledon',
           1992,
           1200000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 5,
           'Wimbledon',
           1992,
           300000,
           'Dunlop' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 5,
           'Wimbledon',
           1993,
           350000,
           'Reebok' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 4,
           'Roland Garros',
           1994,
           400000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 4,
           'Wimbledon',
           1992,
           300000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 4,
           'Wimbledon',
           1993,
           350000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 9,
           'Roland Garros',
           1990,
           400000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 9,
           'Roland Garros',
           1992,
           200000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 9,
           'Roland Garros',
           1994,
           600000,
           'Reebok' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 9,
           'Wimbledon',
           1992,
           400000,
           'Peugeot' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 9,
           'Wimbledon',
           1993,
           500000,
           'Reebok' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 9,
           'Flushing Meadow',
           1989,
           900000,
           'Lacoste' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 3,
           'Roland Garros',
           1990,
           500000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 3,
           'Roland Garros',
           1992,
           550000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 3,
           'Roland Garros',
           1994,
           400000,
           'Reebok' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 3,
           'Wimbledon',
           1989,
           750000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 3,
           'Wimbledon',
           1992,
           850000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 3,
           'Flushing Meadow',
           1989,
           700000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Roland Garros',
           1990,
           800000,
           'Vittel' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Roland Garros',
           1992,
           900000,
           'Vittel' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Roland Garros',
           1994,
           1200000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Wimbledon',
           1989,
           400000,
           'Vittel' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Wimbledon',
           1992,
           500000,
           'Vittel' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Wimbledon',
           1993,
           600000,
           'Donnay' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 2,
           'Flushing Meadow',
           1989,
           1000000,
           'Vittel' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 1,
           'Wimbledon',
           1993,
           900000,
           'Nike' );
insert into gain (
   nujoueur,
   lieutournoi,
   annee,
   prime,
   nomsponsor
) values ( 1,
           'Roland Garros',
           1994,
           800000,
           'Nike' );      

-- insertions dans  la table rencontre partie 1

insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 13,
           9,
           'Roland Garros',
           1990 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 11,
           12,
           'Roland Garros',
           1990 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 13,
           11,
           'Roland Garros',
           1990 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           3,
           'Roland Garros',
           1990 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 13,
           12,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 6,
           14,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 11,
           9,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 8,
           7,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 13,
           8,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 6,
           11,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 13,
           6,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           3,
           'Roland Garros',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 14,
           10,
           'Roland Garros',
           1994 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 8,
           9,
           'Roland Garros',
           1994 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 14,
           8,
           'Roland Garros',
           1994 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           4,
           'Roland Garros',
           1994 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 1,
           3,
           'Roland Garros',
           1994 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           1,
           'Roland Garros',
           1994 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 11,
           8,
           'Wimbledon',
           1989 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 12,
           13,
           'Wimbledon',
           1989 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 11,
           12,
           'Wimbledon',
           1989 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 3,
           2,
           'Wimbledon',
           1989 );

-- insertions dans  la table rencontre partie 2

insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 14,
           13,
           'Wimbledon',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 6,
           9,
           'Wimbledon',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 6,
           14,
           'Wimbledon',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 3,
           5,
           'Wimbledon',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           4,
           'Wimbledon',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 3,
           2,
           'Wimbledon',
           1992 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 14,
           10,
           'Wimbledon',
           1993 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 7,
           9,
           'Wimbledon',
           1993 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 14,
           7,
           'Wimbledon',
           1993 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 1,
           5,
           'Wimbledon',
           1993 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           4,
           'Wimbledon',
           1993 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 1,
           2,
           'Wimbledon',
           1993 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 12,
           9,
           'Flushing Meadow',
           1989 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 2,
           3,
           'Flushing Meadow',
           1989 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 12,
           7,
           'Flushing Meadow',
           1991 );
insert into rencontre (
   nugagnant,
   nuperdant,
   lieutournoi,
   annee
) values ( 15,
           16,
           'Roland Garros',
           2001 );