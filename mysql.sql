CREATE TABLE CUSTOMERZIP (
ID bigint,
SSN char(25),
NAME varchar(64),
ZIP char(10),
CONSTRAINT CUSTOMERZIP_PK PRIMARY KEY(ID));

INSERT INTO CUSTOMERZIP (ID,SSN,NAME,ZIP) VALUES (20, 'CST11002','Baby Jane Penn', '12345');
INSERT INTO CUSTOMERZIP (ID,SSN,NAME,ZIP) VALUES (21, 'CST11003','George saint Pierre', '23456');
INSERT INTO CUSTOMERZIP (ID,SSN,NAME,ZIP) VALUES (22, 'CST11004','Mark Hunt', '12001');
