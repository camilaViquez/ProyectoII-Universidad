/*TABLA DE CAMPUS*/
CREATE TABLE Campus(
    Campus_Location VARCHAR2(100),
    Campus_Address VARCHAR2(100),
    Campus_Phone INTEGER,
    Campus_Fax INTEGER,
    Campus_Head VARCHAR2(100)
)

/*TIPO OBJETO DE PROFESOR*/
CREATE OR REPLACE TYPE Professor_O FORCE AS OBJECT
(   
    Prof_Name VARCHAR2(100),
    Prof_Contact VARCHAR2(100)
);

/*TYPO TABLA DE OBJETOS PROFESOR*/
CREATE OR REPLACE TYPE Professor_T FORCE AS TABLE OF Professor_O

/*TIPO OBJETO DE DEPARTAMENTO*/
CREATE OR REPLACE TYPE Departament_O FORCE AS OBJECT(
    Dept_ID VARCHAR2(100),
    Dept_Name VARCHAR2(100),
    Dept_Head VARCHAR2(100),
    Dept_Prof Professor_T
)

/*TIPO TABLA DE OBJETOS DEPARTAMENTO*/
CREATE OR REPLACE TYPE Departament_T FORCE AS TABLE OF Departament_O

/*TIPO OBJETO DE ESCUELA*/
CREATE OR REPLACE TYPE School_O FORCE AS OBJECT(
    School_ID VARCHAR2(100),
    School_Name VARCHAR2(100),
    School_Head VARCHAR2(100),
    School_Prof Professor_T
)

/*TIPO TABLA DE OBJETOS ESCUELA*/
CREATE OR REPLACE TYPE School_T FORCE AS TABLE OF School_O

/*TIPO DE ARREGLO DE VARCHAR2 PARA LOS RC_UNIT*/
CREATE OR REPLACE TYPE RC_Unit_V FORCE IS 
    VARRAY(10) OF VARCHAR2 (100);

/*TIPO OBJETO DE CENTRO DE INVESTIGACION*/
CREATE OR REPLACE TYPE Research_Centre_O FORCE AS OBJECT(
    RC_ID VARCHAR2(100),
    RC_Name VARCHAR2(100),
    RC_Head VARCHAR2(100),
    RC_Unit RC_Unit_V
)

/*TIPO TABLA DE OBJETOS CENTROS DE INVESTIGACION*/
CREATE OR REPLACE TYPE Research_Centre_T FORCE AS TABLE OF Research_Centre_O

/*TIPO DE OBJETO FACULTAD*/
CREATE OR REPLACE TYPE Faculty_O FORCE AS OBJECT(
    Fac_ID INTEGER,
    Fac_Name VARCHAR2(100),
    Fac_Dean VARCHAR2(100),
    Departament Departament_T,
    School School_T,
    Research_Centre Research_Centre_T
)

/*TABLA FACULTAD*/
CREATE TABLE Faculty OF Faculty_O(    
    PRIMARY KEY (Fac_ID))
    NESTED TABLE Departament STORE AS Dept_Table
    (NESTED TABLE Dept_Prof STORE AS Dept_Prof_Table)
    NESTED TABLE School STORE AS School_Table
    (NESTED TABLE School_Prof STORE AS School_Prof_Table)
    NESTED TABLE Research_Centre STORE AS Research_Centre_Table
    
drop table Faculty
drop type Faculty_O

