/*TABLA DE CAMPUS*/
CREATE TABLE Campus(
    Campus_Location VARCHAR2(100),
    Campus_Address VARCHAR2(100),
    Campus_Phone INTEGER,
    Campus_Fax INTEGER,
    Campus_Head VARCHAR2(100)
)

/*TIPO OBJETO DE DEPARTAMENTO*/
CREATE OR REPLACE TYPE Departament_O AS OBJECT(
    Dept_ID VARCHAR2(100),
    Dept_Name VARCHAR2(100),
    Dept_Head VARCHAR2(100)
)

/*TIPO TABLA DE OBJETOS DEPARTAMENTO*/
CREATE OR REPLACE TYPE Departament_T AS TABLE OF Departament_O

CREATE OR REPLACE TYPE Faculty_O AS OBJECT(
    Fac_ID INTEGER,
    Fac_Name VARCHAR2(100),
    Fac_Dean VARCHAR2(100),
    Departament Departament_T
)

/*TABLA FACULTAD*/
CREATE TABLE Faculty OF Faculty_O(    
    PRIMARY KEY (Fac_ID))
    NESTED TABLE Departament STORE AS Departament_Table
    


       
