--Exercitii recapitulative BD 2
DROP TABLE Ang2; 
DROP TABLE Dep;

CREATE TABLE DEPT
(ID NUMBER(5) CONSTRAINT PKey_Dept PRIMARY KEY,
Denumire VARCHAR2(30)
); 
SELECT * FROM DEPT;

INSERT INTO DEPT SELECT id_departament, denumire_departament
FROM DEPARTAMENTE; 

CREATE TABLE ANG_T
(ID NUMBER(6) PKey_ANG_T PRIMARY KEY, 
Prenume VARCHAR2(30),
Nume VARCHAR2(30),
Dep_ID NUMBER(5), 
CONSTRAINT FKey_ANG FOREIGN KEY(Dep_ID) REFERENCES DEP(ID), 
); 
ALTER TABLE ANG_T
ADD Vechime NUMBER(2); 

ALTER TABLE ANG_T
ADD CONSTRAINT Verifica_vechime CHECK (Vechime>0 and Vechime<40); 

ALTER TABLE ANG_T 
DISABLE CONSTRAINT Verifica_vechime; 

RENAME Ang_t TO Ang_t2;

CREATE TABLE Personal AS SELECT * FROM Angajati; 
SELECT * FROM Personal; 

UPDATE Personal 
SET prenume='Ioana'
WHERE id_angajat=6;

UPDATE Personal 
SET email='IPAVEL'
WHERE id_angajat=6;

UPDATE Personal
SET salariul=salariul*1.20
WHERE salariul<7000; 

UPDATE Personal 
SET id_functie='IT_PROG'
WHERE id_angajat=2;

UPDATE Personal
SET comision=0.1
WHERE comision IS NULL; 

UPDATE Personal 
SET salariul=salariul*1.5
WHERE id_departament=60 AND salariul<8000;

UPDATE Personal 
SET comision=(SELECT comision FROM personal WHERE id_angajat=5)
WHERE id_angaajat=6;

UPDATE Personal 
SET comision=0.3
WHERE(SELECT comision FROM personal WHERE id_angajat=6);

DELETE FROM personal WHERE id_angajat=4;

DELETE FROM personal 
WHERE id_departament=80 AND salariul<3000;
