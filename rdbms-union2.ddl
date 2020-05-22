        CREATE DATABASE customer OPTIONS (ANNOTATION 'Customer VDB');  

        USE DATABASE customer;

        CREATE FOREIGN DATA WRAPPER postgresql;  

        CREATE FOREIGN DATA WRAPPER mysql;

        CREATE SERVER sampledb TYPE 'NONE' FOREIGN DATA WRAPPER postgresql
        OPTIONS ("resource-name" 'sampledb');   

        CREATE SERVER mysqlsampledb TYPE 'NONE' FOREIGN DATA WRAPPER mysql 
        OPTIONS ("resource-name" 'mysqlsampledb');

        CREATE SCHEMA accounts SERVER sampledb;   

        CREATE SCHEMA haccounts SERVER mysqlsampledb;   

        CREATE VIRTUAL SCHEMA portfolio;

        SET SCHEMA accounts;   

        IMPORT FOREIGN SCHEMA public FROM SERVER sampledb INTO accounts
        OPTIONS("importer.useFullSchemaName" 'false');   

        SET SCHEMA haccounts;   

        IMPORT FOREIGN SCHEMA public FROM SERVER mysqlsampledb INTO haccounts
        OPTIONS("importer.useFullSchemaName" 'false');

        SET SCHEMA portfolio; 

        CREATE VIEW CustomerZip(id bigint PRIMARY KEY, name string, ssn string,
        zip string) AS SELECT ID as id, NAME as name, SSN as ssn, ZIP as zip
        FROM accounts.CUSTOMERZIP UNION SELECT ID as id, NAME as name, SSN as
        ssn, ZIP as zip from haccounts.CUSTOMERZIP;