CREATE OR REPLACE PROCEDURE PROC_CT_COSTUMER IS
    V_CNT NUMBER;
BEGIN
    SELECT count(*) INTO V_CNT
    FROM   ALL_TABLES
    WHERE  OWNER = 'DEMO' AND
           TABLE_NAME = 'COSTUMER';
           
    if V_CNT = 0 then
       EXECUTE IMMEDIATE 'CREATE TABLE COSTUMER
                          (
                              COSTUMER_ID INTEGER PRIMARY KEY,
                              EMAIL     VARCHAR(45),
                              FIRSTNAME  VARCHAR(40),
                              LASTNAME  VARCHAR(40),
                              GENDER    VARCHAR(20),
                              BIRTHDAY   DATE,
                              CREDITS  DECIMAL(4)
                          )';
        COMMIT;
    end if;
    
    SELECT count(*) INTO V_CNT
    FROM   ALL_SEQUENCES
    WHERE  SEQUENCE_OWNER = 'DEMO' AND
           SEQUENCE_NAME  = 'SEQ_COSTUMERNUMBER';
           
    if V_CNT = 0 then
        EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_COSTUMERNUMBER
                           START WITH 10000
                           INCREMENT BY 1
                           CACHE 50';
        COMMIT;
    end if;
END PROC_CT_COSTUMER;