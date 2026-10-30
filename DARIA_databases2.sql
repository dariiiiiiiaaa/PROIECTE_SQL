--Exercitii recapitulative 3

--Stergeti variantele anterioare ale tabelelor Sectii si Pers. 
DROP TABLE Sectii; 
DROP TABLE Pers; 

--Creati tabela Sectii conform machetei prezentate. 
CREATE TABLE Sectii
( ID NUMBER(4) CONSTRAINT PKey_Sectii PRIMARY KEY,
Nume_sectie VARCHAR2(40)
);
SELECT * FROM Sectii;

--Introduceti inregistrari in Sectii preluand date din tabela Departamente(id_departament, denumire_departament) 
INSERT INTO Sectii SELECT id_departament, denumire_departament
FROM DEPARTAMENTE; 

--Creati tabela Pers conform machetei prezentate. 
CREATE TABLE Pers
( ID NUMBER(5) CONSTRAINT PKey_Pers PRIMARY KEY, 
Prenume VARCHAR2(20),
Nume VARCHAR2(20), 
Sectie_ID NUMBER(4) ,
CONSTRAINT FKey_Pers
FOREIGN KEY (Sectie_ID)
REFERENCES Sectii(ID)
);
SELECT * FROM Sectie;

--Adaugati coloana Nota in tabela Pers, de tip NUMBER(2).
ALTER TABLE Pers
ADD Nota NUMBER(2); 

--Adaugati restrictia Verifica_nota, care sa nu permita valori mai mici de 1 si mai mari de 10.
ALTER TABLE Pers
ADD CONSTRAINT Verifica_nota CHECK(Nota>1 AND Nota<10);

--Dezactivati restrictia Verifica_nota.
ALTER TABLE Pers
DISABLE CONSTRAINT Verifica_nota;

--Modificati campul Nume astfel incat lungimea lui sa fie 35. 
ALTER TABLE Pers
MODIFY Nume VARCHAR2(35); 

--Redenumiti tabela Pers in Pers2. 
RENAME Pers TO Pers2; 

--Creati tabela Salariati2 pe baza structurii tabelei Angajati, preluand toate inregistrarile.
CREATE TABLE Salariati2 AS SELECT * FROM Angajati; 
SELECT * FROM Salariati2; 

