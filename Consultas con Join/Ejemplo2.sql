use AdventureWorks2019;

--Función IIF

select IIF(1=1, 'VERDADERO', 'FALSO') AS 'RESULTADO'

CREATE VIEW vista_genero
AS
SELECT e.LoginID,e.Jobtitle, e.Gender, IIF(e.Gender=
'F', 'MUJER', 'HOMBRE') AS 'SEXO'
 FROM HumanResources.Employee as e; 


SELECT UPPER(Jobtitle) AS [TITULO] 
FROM vista_genero
where SEXO = 'MUJER';

IF OBJECT_ID (N'tempdb..#StudentsC1') is not NULL
begin
    drop table #StudentsC1;
end

CREATE TABLE #StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);

INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)

SELECT OBJECT_ID(N'tempdb.#Students')
--si objetId es nulo eliminar la tabla
IF OBJECT_ID(N'tempdb..#StudentsC2') is not NULL
begin
-- drop table ##StudentsC2 (ES GLOBAL)
drop table #StudentsC2
END


CREATE TABLE #StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);


INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)


select * from #StudentsC1
select * from #StudentsC2

--Que datos me darian
-- Inner Join 1,2
--Left Join 3,4

-- Inner Join 1,2
SELECT* FROM
#StudentsC1 as s1
INNER JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID

SELECT* FROM
#StudentsC1 as s1
LEFT JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID

SELECT* FROM
#StudentsC1 as s1
RIGHT JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID


SELECT s1.StudentID, s1.StudentName, s1.StudentStatus FROM
#StudentsC1 as s1
LEFT JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID
WHERE s1.StudentID is null


insert into  #StudentsC2 (StudentID, StudentName, StudentStatus)
SELECT s1.StudentID, s1.StudentName, s1.StudentStatus FROM
#StudentsC1 as s1
LEFT JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID
WHERE s2.StudentID is null


UPDATE s2
SET s2.StudentName = s1.StudentName,
    s2.StudentStatus = s1.StudentStatus
from
#StudentsC1 as s1
INNER JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID;