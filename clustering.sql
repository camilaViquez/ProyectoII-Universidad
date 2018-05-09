
/*CREACIÓN DEL CLUSTER HASH */
CREATE CLUSTER Building_C
   (Bld_ID VARCHAR2(20))
SIZE 512 
STORAGE (initial 100K next 50K);

/*CREACIÓN DE CLUSTER KEY, cluster index*/
CREATE INDEX idx_Building ON CLUSTER Building_C;

/*TABLA BUILDING*/

CREATE TABLE Building
(
    Bld_ID VARCHAR2(20) PRIMARY KEY,
    Bld_Name VARCHAR2(20),
    Bld_Location VARCHAR2(20),
    Bld_Level VARCHAR2(20),
    Campus_Location VARCHAR(20),
    Fac_ID VARCHAR2(20)
)
cluster Building_C( Bld_ID);



/*TABLA OFFICE*/
CREATE TABLE Office
(
     Bld_ID VARCHAR2(20),
    Office_No VARCHAR2(20)PRIMARY KEY,
    Office_Phone VARCHAR2(100),
    FOREIGN KEY (Bld_ID ) REFERENCES Building(Bld_ID)
)
cluster Building_C( Bld_ID);


/*TABLA CLASSROM*/
CREATE TABLE Classroom
(
    Bld_ID VARCHAR2(20) ,
    Classroom_No VARCHAR2(20) PRIMARY KEY,
    Classroo_Capacity VARCHAR2(100),
    FOREIGN KEY (Bld_ID ) REFERENCES Building(Bld_ID)
)
cluster Building_C( Bld_ID);


/*VARRAY PARA LAB_EQIPMENT PARA TABLA LAB*/
CREATE OR REPLACE TYPE Equipment_V IS 
   VARRAY(10) OF VARCHAR2 (100); 

CREATE TABLE Lab                
(
    Bld_ID VARCHAR2(20),
    Lab_No VARCHAR2(20) PRIMARY KEY,
    Lab_Capacity VARCHAR(20),
    Lab_equipment Equipment_V,
    FOREIGN KEY (Bld_ID ) REFERENCES Building(Bld_ID)
)
cluster Building_C( Bld_ID);




