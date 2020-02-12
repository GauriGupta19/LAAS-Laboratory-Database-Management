CREATE TABLE Personnel( idPersonnel INT PRIMARY KEY, nom TEXT, prénom TEXT, dateRecrutement DATE, dateNaissance DATE, adresse TEXT);
  
insert into Personnel(idPersonnel, nom,prénom,dateRecrutement,dateNaissance,adresse) values (1, 'rathi','saharsh','2015-03-29','1990-02-05','paris'), (2,'palat','gaori','2016-03-28','1991-02-05','paris'),  (3, 'aggrawal','ujjwal','2017-03-28','1992-02-05','paris'), (4, 'kapila','ritvik','2015-03-28','1993-02-05','paris'), (5, 'garg','sarthak','2016-03-28','1994-02-05','paris'), (6, 'wick','john','2017-03-28','1995-02-05','paris');

CREATE TABLE Scientifique( idScientifique INT PRIMARY KEY REFERENCES Personnel(idPersonnel), grade TEXT);

INSERT INTO Scientifique VALUES (1, 'cf hors classe'), (2, 'mcf'), (3, 'cr1');

CREATE TABLE Doctorant(idDoctorant INT PRIMARY KEY REFERENCES Personnel(idPersonnel), dateDebutThese DATE, dateSoutenance DATE);

INSERT INTO Doctorant values(4,'2015-04-05', '2019-04-04'), (5, '2016-04-06', '2020-04-05'), (6, '2017-04-07', '2021-04-06');

CREATE TABLE Chercheur(idChercheur INT PRIMARY KEY REFERENCES Scientifique(idScientifique));
INSERT INTO chercheur (idChercheur) VALUES (1),(2),(3);

CREATE TABLE Etablissement(idEtablissement INT PRIMARY KEY, nom TEXT, acronyme TEXT, adresse TEXT);

INSERT INTO Etablissement values (11, 'Indian Institute of Technology Delhi', 'IITD', 'Delhi'), (22, 'Indian Institute of Technology Bombay', 'IITB', 'Bombay'), (33, 'Indian Institute of Technology Kanpur', 'IITK', 'Kanpur'), (44, 'Indian Institute of Technology Mandi', 'IITM', 'Mandi');

CREATE TABLE Enseignant_Chercheur(idEnseignant INT PRIMARY KEY REFERENCES Scientifique(idScientifique), echelon INT, idEtablissement INT, FOREIGN KEY(idEtablissement) REFERENCES Etablissement(idEtablissement)); 
INSERT INTO Enseignant_Chercheur VALUES (2,1,11), (3,2,22), (1,1,22);

CREATE TABLE Encadrement(idDoctorant INT, idScientifique INT, FOREIGN KEY(idDoctorant) REFERENCES Doctorant(idDoctorant), FOREIGN KEY(idScientifique) REFERENCES Scientifique(idScientifique));

INSERT INTO Encadrement VALUES (4,1), (5,2), (6,3);

CREATE TABLE Conférence(idConférence INT PRIMARY KEY, nomConférence TEXT, annéeConférence INT, classeConférence TEXT);

 INSERT INTO Conférence values (1001, 'Data Science', 2015, 'A'), (1002, 'ML', 2016, 'B'), (1003, 'Quant', 2019, 'A*'), (1004, 'Medical', 2017, 'C');

CREATE TABLE Article(idArticle INT PRIMARY KEY, titre TEXT, idConférence INT, FOREIGN KEY(idConférence) REFERENCES Conférence(idConférence));

INSERT INTO Article VALUES (100,'Soft Exosuit',1001), (200,'Wearable technology',1002), (300,'Future on Mars',1001), (400,'Self Driving Cars',1003);

CREATE TABLE PublierLAAS(idPersonnel INT, idArticle INT, FOREIGN KEY(idPersonnel) REFERENCES Personnel(idPersonnel), FOREIGN KEY(idArticle) REFERENCES Article(idArticle));

INSERT INTO PublierLAAS VALUES (1,100), (1,200), (1,300), (2,200), (3,300), (4,100),(5,100),(6,100),(4,200),(5,300);

CREATE TABLE LaboratoireExterne(idLaboratoireExterne INT PRIMARY KEY, nom TEXT, pays TEXT); INSERT INTO LaboratoireExterne values (101, 'Scifii Lab', 'India'), (102, 'Robotics Lab', 'USA'), (103, 'Mathematics Lab', 'France');

CREATE TABLE AuteurExterne(idAuteurExterne INT PRIMARY KEY, nom TEXT, prénom TEXT, adresseEmail TEXT, idLaboratoireExterne INT, FOREIGN KEY(idLaboratoireExterne) REFERENCES LaboratoireExterne(idLaboratoireExterne));

INSERT INTO AuteurExterne VALUES (21,'Fombonne','Virgile','virgile@gmail.com',101), (24,'Agrawal','varun','varun@gmail.com',101), (25,'sharma','alok','alok@gmail.com',101), (22,'Castelanos','Sergio','sergio@gmail.com',102), (23,'Masceranus','Francisca','francisca@gmail.com',103);

CREATE TABLE PublierExterne(idAuteurExterne INT, idArticle INT, FOREIGN KEY(idAuteurExterne) REFERENCES AuteurExterne(idAuteurExterne), FOREIGN KEY(idArticle) REFERENCES Article(idArticle));

INSERT INTO PublierExterne VALUES (21,100), (24,100), (24,200), (25,100), (22,200), (23,300);

CREATE TABLE ProjetRecherche(idProjet INT PRIMARY KEY, titre TEXT, acronyme TEXT,  annéeDebut INT,  durée INT, coutGlobal INT,  budgetLAAS INT,  idPorteur INT,   FOREIGN KEY(idPorteur) REFERENCES Scientifique(idScientifique));

INSERT INTO ProjetRecherche values (91, 'a cat in the table', 'ACT', 2015, 10, 2000, 5000, 2), (92, 'a dog in the table', 'ADT', 2017, 7, 1500, 4000, 1);

CREATE TABLE ParticipationProjet(idScientifique INT, idProjet INT,   FOREIGN KEY(idScientifique) REFERENCES Scientifique(idScientifique),   FOREIGN KEY(idProjet) REFERENCES ProjetRecherche(idProjet));

INSERT INTO ParticipationProjet VALUES (1,91), (2,92);

CREATE TABLE Partenaires(  idPartenaire INT PRIMARY KEY,  nom TEXT,  pays TEXT);
INSERT INTO Partenaires VALUES  (201,'YIIS LAB','Switzerland'), (202,'OSDI LAB','India'), (203,'DGQO LAB','USA');

CREATE TABLE PartenaireProjet(  idPartenaire INT,  idProjet INT,  FOREIGN KEY(idPartenaire) REFERENCES Partenaires(idPartenaire),   FOREIGN KEY(idProjet) REFERENCES ProjetRecherche(idProjet));

INSERT INTO PartenaireProjet VALUES (201,91), (202,92);

CREATE TABLE EvènementScientifique(idEvenement INT,   nomEvènement TEXT,   dateDébut DATE, dateFin DATE);
INSERT INTO EvènementScientifique VALUES (51,'Machine Learning','2016-09-08','2016-09-10'),  (52,'Data Science', '2017-07-18','2017-07-25'),  (53,'MOSFET', '2018-08-12','2018-08-20');


CREATE TABLE ConférenceLAAS(idConférence INT PRIMARY KEY,   nomConférence TEXT,  dateDébut DATE,  dateFin DATE,  classeConférence VARCHAR(10),  nombreParticipant INT,   idPrésident INT,   FOREIGN KEY(idPrésident) REFERENCES Scientifique(idScientifique)); 

INSERT INTO ConférenceLAAS VALUES (2001, 'python','2016-01-14','2016-02-06','A',400,1), (2002, 'c++','2016-02-14','2016-03-06','B',700,2), (2003, 'java','2016-03-14','2016-04-06','C',200,3);

CREATE TABLE JournéePorteOuverte(idJournée INT PRIMARY KEY,  nomJournée TEXT,  dateDébut DATE,  dateFin DATE);
 
  INSERT INTO JournéePorteOuverte VALUES (9001, 'day1', '2017-03-15','2017-03-25'),  (9002, 'day2', '2016-04-14','2016-04-24');

CREATE TABLE ParticipationJournéePorteOuverte(idJournée INT,  idPersonnel INT,  FOREIGN KEY(idJournée) REFERENCES JournéePorteOuverte(idJournée),  FOREIGN KEY(idPersonnel) REFERENCES Personnel(idPersonnel));

  INSERT INTO ParticipationJournéePorteOuverte VALUES  (9001,1), (9001,2), (9001,4),(9002,3),(9002,4);










/*  1. The name and ranks of the supervisors of a given doctoral student*/

SELECT  Personnel.nom, Scientifique.grade FROM ((Scientifique INNER JOIN Encadrement ON Encadrement.idScientifique= Scientifique.idScientifique) INNER JOIN Personnel ON Scientifique.idScientifique = Personnel.idPersonnel) WHERE Encadrement.idDoctorant = 6 ;

/* 2. The names and countries of collaborating authors of a given scientist from 2015 to 2019*/

SELECT AuteurExterne.nom, LaboratoireExterne.pays FROM (((((PublierLAAS INNER JOIN PublierExterne ON PublierLAAS.idArticle=PublierExterne.idArticle) INNER JOIN Article ON PublierLAAS.idArticle=Article.idArticle) INNER JOIN Conférence ON Article.idConférence = Conférence.idConférence) INNER JOIN AuteurExterne ON AuteurExterne.idAuteurExterne=PublierExterne.idAuteurExterne) INNER JOIN LaboratoireExterne ON LaboratoireExterne.idLaboratoireExterne=AuteurExterne.idLaboratoireExterne) WHERE PublierLAAS.idPersonnel=2 AND Conférence.annéeConférence BETWEEN 2015 AND 2019;

/*3. The total number of collaborators of a given scientist the last four years*/

SELECT COUNT(AuteurExterne.idAuteurExterne) FROM AuteurExterne INNER JOIN PublierExterne ON AuteurExterne.idAuteurExterne = PublierExterne.idAuteurExterne INNER JOIN PublierLAAS ON PublierExterne.idArticle =PublierLAAS.idArticle INNER JOIN Scientifique ON PublierLAAS.idPersonnel =Scientifique.idScientifique WHERE Scientifique.idScientifique = 1;

/*4. For PhD students in the 3rd year, we would like to retrieve the number of their publications*/

SELECT  COUNT(idArticle) FROM PublierLAAS INNER JOIN Personnel on PublierLAAS.idPersonnel = Personnel.idPersonnel INNER JOIN Doctorant on Doctorant.idDoctorant = Personnel.idPersonnel WHERE EXTRACT(YEAR FROM Personnel.dateRecrutement)='2016';

/*5. The number of publications per year of the entire laboratory since 2015 */

SELECT annéeConférence, COUNT(DISTINCT PublierLAAS.idArticle) FROM PublierLAAS INNER JOIN Article ON PublierLAAS.idArticle=Article.idArticle INNER JOIN Conférence ON Conférence.idConférence=Article.idConférence GROUP BY annéeConférence HAVING Conférence.annéeConférence>=2015;

/*6. The number of PhD students from the laboratory whose thesis is in progress */

SELECT COUNT(idDoctorant) FROM Doctorant WHERE dateSoutenance>NOW();

 /*7. The number of scientists in the laboratory */

 SELECT COUNT(idScientifique) from Scientifique;

/*8. The number of teacher-researchers by educational institution*/

SELECT COUNT(idEnseignant),Etablissement.idEtablissement FROM Enseignant_Chercheur INNER JOIN Etablissement ON Enseignant_Chercheur.idEtablissement=Etablissement.idEtablissement GROUP BY Etablissement.idEtablissement;

/* 9 The educational institution with the largest number of teacher-researchers (NOT COMPLETE) */

WITH d1 AS (SELECT Etablissement.idEtablissement, COUNT(idEnseignant) AS total FROM Etablissement INNER JOIN Enseignant_Chercheur ON Enseignant_Chercheur.idEtablissement=Etablissement.idEtablissement GROUP BY Etablissement.idEtablissement) SELECT idEtablissement FROM d1 ORDER BY total DESC LIMIT 1;

 /*10. People who attended all open days*/

 SELECT * FROM JournéePorteOuverte;
 select * from ParticipationJournéePorteOuverte; 
SELECT idpersonnel FROM ParticipationJournéePorteOuverte GROUP BY idpersonnel
 HAVING COUNT(idJournée)= (SELECT COUNT(*) FROM JournéePorteOuverte);

/*11. People who have never participated in open days*/

SELECT idPersonnel , nom, prénom FROM Personnel WHERE idPersonnel NOT IN (SELECT idPersonnel FROM ParticipationJournéePorteOuverte);

/*12. The name, year and class of all conferences organized by a given scientist.*/

SELECT Conférence.nomConférence, Conférence.annéeConférence, Conférence.classeConférence FROM (Scientifique INNER JOIN PublierLAAS ON PublierLAAS.idPersonnel=Scientifique.idScientifique INNER JOIN Article ON PublierLAAS.idArticle= Article.idArticle INNER JOIN Conférence ON Conférence.idConférence=Article.idConférence )WHERE Scientifique.idScientifique=1;


/*13. The names and surnames of scientists who have never supervised*/
 
 SELECT nom, prénom FROM Scientifique INNER JOIN Personnel ON Personnel.idPersonnel=Scientifique.idScientifique WHERE Scientifique.idScientifique IN (SELECT idScientifique FROM Scientifique EXCEPT SELECT DISTINCT idScientifique FROM Encadrement);

/*14. The names and surnames of the scientists who have never published, supervised or participated in projects.*/

 SELECT nom, prénom FROM Scientifique INNER JOIN Personnel ON Personnel.idPersonnel=Scientifique.idScientifique WHERE (Scientifique.idScientifique IN (SELECT idScientifique FROM Scientifique EXCEPT SELECT DISTINCT idScientifique FROM Encadrement)) OR (Scientifique.idScientifique IN (SELECT idScientifique FROM Scientifique EXCEPT SELECT idScientifique FROM ParticipationProjet)) OR (Scientifique.idScientifique IN  (SELECT idScientifique FROM Scientifique EXCEPT SELECT Scientifique.idScientifique FROM PublierLAAS INNER JOIN Scientifique ON Scientifique.idScientifique=PublierLAAS.idPersonnel));

/*15. Display for each scientist, the number of his publications, the number of his projects and his doctoral students in the last 4 years*/

SELECT s.idScientifique, COUNT(DISTINCT idArticle) AS nombrePublication, COUNT(DISTINCT idProjet) AS nombreProject, COUNT(DISTINCT e.idDoctorant) AS nombreDoctorant FROM Scientifique s LEFT OUTER JOIN PublierLAAS p ON p.idPersonnel=s.idScientifique LEFT OUTER JOIN ProjetRecherche r ON r.idPorteur=s.idScientifique LEFT OUTER JOIN Encadrement e ON e.idScientifique=s.idScientifique AND ((SELECT dateDebutThese FROM Doctorant WHERE idDoctorant=e.idDoctorant)>=(CURRENT_DATE-1461)) GROUP BY s.idScientifique;

/*16. Scientists who only have doctoral students who supported more than 2 years ago and have no current doctoral students*/
SELECT idScientifique, nom, prénom FROM Personnel p INNER JOIN Encadrement e ON p.idPersonnel=e.idScientifique INNER JOIN Doctorant d ON e.idDoctorant=d.idDoctorant AND (current_date-d.dateSoutenance>=731); 

/*17. Scientists who supervise but do not have doctoral students who have already supported*/
SELECT idScientifique, nom, prénom FROM Personnel p INNER JOIN Scientifique s ON p.idPersonnel=s.idScientifique WHERE idScientifique IN (SELECT DISTINCT idScientifique FROM Encadrement e EXCEPT SELECT idScientifique FROM Encadrement WHERE idDoctorant IN (SELECT idDoctorant FROM Doctorant WHERE dateSoutenance < NOW()));

/*18. Doctoral students who have only one supervisor and who only have publications with their supervisor*/
SELECT idDoctorant , nom, prénom FROM Personnel p INNER JOIN Doctorant d ON p.idPersonnel=d.idDoctorant WHERE idDoctorant IN (SELECT DISTINCT idDoctorant FROM Encadrement e WHERE((SELECT COUNT(idScientifique) FROM Encadrement GROUP BY idDoctorant HAVING idDoctorant=e.idDoctorant )=1));
     
/*19. Doctoral students who have more than 3 supervisors*/
SELECT DISTINCT idDoctorant FROM Encadrement e WHERE((SELECT COUNT(idScientifique) FROM Encadrement GROUP BY idDoctorant HAVING idDoctorant=e.idDoctorant)>3);






/*20. Scientists who have more than 4 doctoral students who started their thesis less than 2 years ago.*/

With d as (select * from doctorant WHERE dateDebutThese>CURRENT_DATE-731) select Scientifique.idscientifique,count(Encadrement.idDoctorant) as cont from Scientifique INNER JOIN Personnel ON Personnel.idpersonnel=Scientifique.idScientifique INNER JOIN Encadrement on Scientifique.idscientifique = Encadrement.idscientifique INNER JOIN d ON Encadrement.idDoctorant=d.idDoctorant GROUP BY Scientifique.idscientifique HAVING count(Encadrement.idDoctorant)>4;

/*21. Doctoral students who are in 3rd year and have no publication*/

INSERT INTO Doctorant values(9,'2015-04-05', '2019-04-04');

SELECT Doctorant.idDoctorant FROM Doctorant  LEFT JOIN PublierLAAS ON PublierLAAS.idPersonnel = Doctorant.idDoctorant WHERE PublierLAAS.idPersonnel IS NULL;

/* 23. Scientists who recruit at least one PhD student per year  */

/* selects all the scientist who have hired a doctorant from years 2015,2016,2017 as their sum is 6048*/ 

select distinct idScientifique, SUM(EXTRACT(YEAR FROM dateRecrutement)  ) as c from Encadrement inner join Personnel on Personnel.idPersonnel = Encadrement.idDoctorant group by idScientifique having SUM(EXTRACT(YEAR FROM dateRecrutement)  ) = 6048;




/*24. Countries that are present at all projects*/

select idPartenaire, count(idProjet) as c from PartenaireProjet group by idPartenaire having count(idProjet) = (SELECT COUNT(*) FROM ProjetRecherche);

/*25. Scientists who publish only in class A lectures*/
 
with derive as (select  idScientifique  , (classeConférence)  from Conférence inner join Article on Article.idConférence = Conférence.idConférence inner join PublierLAAS on PublierLAAS.idArticle = Article.idArticle inner join Scientifique on Scientifique.idScientifique = PublierLAAS.idPersonnel) ,derive2 as (select idScientifique, count(classeConférence) as diff_classes from derive group by idScientifique)
select derive.idScientifique  from derive inner join derive2 on derive2.idScientifique = derive.idScientifique  where classeConférence = 'A' and diff_classes = 1 ;

/* 26. Scientists who have never published in class A lectures */

with derive as (select distinct idScientifique  , (classeConférence)  from Conférence inner join Article on Article.idConférence = Conférence.idConférence inner join PublierLAAS on PublierLAAS.idArticle = Article.idArticle inner join Scientifique on Scientifique.idScientifique = PublierLAAS.idPersonnel) , derive2 as (select idScientifique, count(classeConférence) as a from derive where not derive.classeConférence = 'A' group by idScientifique), derive3 as (select idScientifique, count(classeConférence) as a from derive group by idScientifique) select derive3.idScientifique,  derive3.a as abc, derive2.a as bca from derive3 inner join derive2 on derive2.idScientifique = derive3.idScientifique where derive3.a = derive2.a ;

/*OR*/

Select idScientifique from Scientifique except select idScientifique from Conférence inner join Article on Article.idConférence = Conférence.idConférence inner join PublierLAAS on PublierLAAS.idArticle = Article.idArticle inner join Scientifique on Scientifique.idScientifique = PublierLAAS.idPersonnel Where classeConférence LIKE 'A';

/* 27. The number of class A lectures organized by the laboratory per year*/

SELECT annéeConférence, COUNT(idConférence) AS Conférences FROM Conférence WHERE classeConférence LIKE 'A' GROUP BY annéeConférence;

/*28. Number of employees per country */

Select pays from Partenaires p INNER JOIN PartenaireProjet pp ON p.idPartenaire=pp.idPartenaire INNER JOIN ParticipationProjet r ON pp.idProjet=r.idProjet ;

/*29. The country with which the lab collaborates the most */

with d2 as (select LaboratoireExterne.pays,  count(idarticle) as total from LaboratoireExterne
inner join AuteurExterne on LaboratoireExterne.idLaboratoireExterne = AuteurExterne.idLaboratoireExterne
inner join PublierExterne on PublierExterne.idAuteurExterne = AuteurExterne.idAuteurExterne
group by pays) select pays from d2 where total in (select max(total) from d2)












