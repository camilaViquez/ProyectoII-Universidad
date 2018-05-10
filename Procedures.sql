/*CRUD CAMPUS*/
/*Procedimiento para insertar en la tabla Campus*/
CREATE OR REPLACE PROCEDURE Insert_Campus(
    Camp_log IN Campus.Campus_Location%TYPE,
    Camp_Add IN Campus.Campus_Address%Type,
    Camp_Phone IN Campus.Campus_Phone%TYPE,
    Camp_Fax IN Campus.Campus_Fax%TYPE,
    Camp_Head IN Campus.Campus_Head%TYPE)
IS
BEGIN 
    INSERT INTO Campus(Campus_Location,Campus_Address,Campus_Phone,Campus_Fax,Campus_Head)
    VALUES(Camp_log,Camp_Add, Camp_Phone,Camp_Fax,Camp_Head);
    
    COMMIT;
END;

/*Prueba*/
BEGIN 
    Insert_Campus('sede central','Cartago',52245688,4578,'Lola Lopez');
END;

/*Procedimeinto READ campus*/
/*
CREATE OR REPLACE PROCEDURE Read_Campus(
    Camp_log OUT Campus.Campus_Location%TYPE,
    Camp_Add OUT Campus.Campus_Address%Type,
    Camp_Phone OUT Campus.Campus_Phone%TYPE,
    Camp_Fax OUT Campus.Campus_Fax%TYPE,
    Camp_Head OUT Campus.Campus_Head%TYPE
)
IS
BEGIN
    SELECT Campus_Location,Campus_Address ,Campus_Phone,Campus_Fax,Campus_Head
    INTO Camp_log,Camp_Add,Camp_Phone,Camp_Fax,Camp_Head
    FROM Campus;
    END;
*/
/*Prueba*/
/*
DECLARE
    Camp_log CAMPUS.CAMPUS_LOCATION%TYPE;
    Camp_Add CAMPUS.CAMPUS_ADDRESS%TYPE;
    Camp_Phone CAMPUS.CAMPUS_PHONE%TYPE;
    Camp_Fax CAMPUS.CAMPUS_FAX%TYPE;
    Camp_Head CAMPUS.CAMPUS_HEAD%type;
BEGIN 
    Read_Campus('sede central','Cartago','');
    
*/
/*UPDATE Campus*/
CREATE OR REPLACE PROCEDURE Update_Campus(
    Camp_log IN Campus.Campus_Location%TYPE,
    Camp_Add IN Campus.Campus_Address%Type,
    Camp_Phone IN Campus.Campus_Phone%TYPE,
    Camp_Fax IN Campus.Campus_Fax%TYPE,
    Camp_Head IN Campus.Campus_Head%TYPE)
is
BEGIN
UPDATE Campus SET Campus_Location = Camp_log,
    Campus_Address = Camp_Add,
    Campus_Phone = Camp_Phone,
    Campus_Fax = Camp_Fax,
    Campus_Head = Camp_head;
    COMMIT;
END;

/*Prueba update*/
BEGIN 
    Update_Campus('zona norte','Guanacaste', 789456,789,'Luisa');
END;

/*DELETE Campus*/
CREATE OR REPLACE PROCEDURE Delete_Campus(Camp_log IN CAMPUS.CAMPUS_LOCATION%TYPE)
IS
BEGIN
    DELETE Campus where Campus_Location = Camp_log;
    COMMIT;
END;

/*Prueba delete */
BEGIN 
    Delete_Campus('sede central');
END;


/*SELECT all*/
CREATE OR REPLACE PROCEDURE Read_Campus IS
BEGIN
    SELECT * FROM Campus;

    END;
    


