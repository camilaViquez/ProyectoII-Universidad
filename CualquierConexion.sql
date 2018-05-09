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

/*TABLA DE GRADOS*/
CREATE TABLE Degree(
    Deg_ID VARCHAR2(20),
    Deg_Name VARCHAR2(50),
    Deg_Length INTEGER,
    Deg_Prereq VARCHAR2(50),
    Fac_ID INTEGER,
    PRIMARY KEY(Deg_ID),
    CONSTRAINT fk_Fac_ID
        FOREIGN KEY(Fac_ID)
        REFERENCES Faculty(Fac_ID))

/*TIPO DE OBJETO PERSONA*/
CREATE OR REPLACE TYPE Person AS OBJECT(
    Pers_ID INTEGER,
    Pers_Surname VARCHAR2(50),
    Pers_Fname VARCHAR2(50),
    Pers_Title VARCHAR2(50),
    Pers_Address VARCHAR2(100),
    Pers_Phone VARCHAR2(20),
    Pers_Postcode VARCHAR2(10),
    Campus_Location VARCHAR2(100))
    NOT INSTANTIABLE NOT FINAL;

/*TIPO DE OBJETO STAFF HEREDADO DE PERSONA*/
CREATE OR REPLACE TYPE Staff UNDER Person(
    Bld_ID VARCHAR2(20),
    Off_No VARCHAR2(30),
    Staff_Type VARCHAR2(20))
    NOT INSTANTIABLE NOT FINAL;

/*TIPO DE OBJETO ESTUDIANTE HEREDADO DE PERSONA*/
CREATE OR REPLACE TYPE Student FORCE UNDER Person(
    Year Integer)

/*TIPO DE ARREGLO DE VARCHAR2 PARA LOS Office_Skills*/
CREATE OR REPLACE TYPE Skills_V FORCE IS 
    VARRAY(10) OF VARCHAR2 (30);

/*TIPO DE OBJETO ADMINISTRADOR HEREDADO DE STAFF*/
CREATE OR REPLACE TYPE Admin FORCE UNDER Staff(
    Admin_Title VARCHAR2(50),
    Comp_Skills VARCHAR2(30),
    Office_Skills Skills_V)
    NOT INSTANTIABLE NOT FINAL;
    
/*TIPO DE OBJETO TECNICO HEREDADO DE STAFF*/
CREATE OR REPLACE TYPE Technician FORCE UNDER Staff(
    Tech_Title VARCHAR2(30),
    Tech_Skills Skills_V)
    
/*TIPO DE OBJETO TUTOR HEREDADO DE STAFF*/
CREATE OR REPLACE TYPE Tutor FORCE UNDER Staff(
    No_Hours INTEGER,
    Rate FLOAT)
    
/*TIPO DE OBJETO PROFESOR HEREDADO DE STAFF*/
CREATE OR REPLACE TYPE Lecturer FORCE UNDER Staff(
    Area VARCHAR2(50),
    Lect_Type VARCHAR2(30))
    NOT INSTANTIABLE NOT FINAL;

/*TIPO DE OBJETO SENIORLECTURER HEREDADO DE LECTURER*/
CREATE OR REPLACE TYPE SeniorLecturer FORCE UNDER Lecturer(
    No_Phd INTEGER,
    No_Master INTEGER,
    No_Hours INTEGER)    

/*TIPO DE OBJETO ASSOCIATELECTURER HEREDADO DE LECTURER*/
CREATE OR REPLACE TYPE AssociateLecturer FORCE UNDER Lecturer(
    No_Honours INTEGER,
    Year_Join INTEGER)
    
/*TABLA DE MATERIAS*/
CREATE TABLE Subject(
    Subj_ID VARCHAR2(20),
    Subj_Name VARCHAR2(50),
    Subj_Credit INTEGER,
    Subj_Prereq VARCHAR2(20),
    Pers_ID INTEGER,
    PRIMARY KEY(Subj_ID))

/*TABLA INTERMEDIA ENTRE ESTUDIANTES Y GRADOS*/
CREATE TABLE Enrolls_In(
    Student INTEGER,
    Degree VARCHAR2(20),
    
    CONSTRAINT fk_degree
        FOREIGN KEY(Degree)
        REFERENCES Degree(Deg_ID))

CREATE TABLE Takes(
    Student INTEGER,
    Subject VARCHAR2(20),
    Marks INTEGER,
    
    CONSTRAINT fk_Subject
        FOREIGN KEY(Subject)
        REFERENCES Subject(Subj_ID)
    
    )


