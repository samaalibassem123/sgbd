--Exercice 1
-- Question 1
--- incrementer le valeur de nujouer automatiquement avant ajouter un joueur si le champ de nujouer est null dans l'insertion
-- Question 2
create or replace trigger trig1 before
   insert on joueur
   for each row
begin
   :new.nom := upper(:new.nom);
end;

-- Question 4
create or replace trigger trig1 before
   update on joueur
   for each row
begin
   :new.nom := upper(:new.nom);
end;
-- Question 6
create or replace trigger trig2 before
   insert on gain
   for each row
begin
   if :new.annee < 2001 then
      :new.prime := :new.prime * 0.152;
   end if;
end;

--Exercice 2
-- Question 1
ACCEPT lieu rencontre.lieu%type prompt "donnez un lieu : ";
accept annee rencontre.annee%type prompt "donnez l'annee : ";
declare 
    primeMoy numeric(6,3);
    primeMoy_Error Exception;
begin
    select moy(nvl(prime, 0)) into primeMoy from gain where lieutournoi=lieu and annee=annee
    if primeMoy is null then
        raise primeMoy_Error;
    end if ;
    Exception
        when primeMoy_Error then
            dbms_output.put_line("moyenne est null");
        when others then
            dbms_output.put_line(SQLERRM);
    
end;


-- Exercice 3
accept an1 number prompt "donnez an1 : ";
accept an2 number prompt "donnez  an2 : ";

declare
    cursor c is select j.nom, g.prime from  joueuer j ,gain g where j.nujouer = g.nujouer;
begin
    open c
    loop 
        fetch c into 
