Create directory MYCSV as ‘C:\Users\Admin\DEVICE_DIR’;
CREATE TABLE "SYSTEM"."DATAA" ("ID" VARCHAR2 (70 BYTE), "DNAME" VARCHAR2 (70 BYTE), "JOB" VARCHAR2 (70 BYTE))   ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY "MYCSV"ACCESS PARAMETERS ( records delimited by newline fields terminated by ','    ) LOCATION ('SET-dec-2013.csv')) REJECT LIMIT UNLIMITED;
CREATE TABLE "SYSTEM"."DATA_LINE" ("ID" VARCHAR2 (70 BYTE), "DNAME" VARCHAR2 (70 BYTE), "JOB" VARCHAR2 (70 BYTE)) ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY "MYCSV"ACCESS PARAMETERS ( records delimited by newline fields terminated by ','    ) LOCATION (‘line.csv’)) REJECT LIMIT UNLIMITED;
CREATE TABLE "SYSTEM"."DATA_TRENITO" ("ID" VARCHAR2 (70 BYTE), "DNAME" VARCHAR2 (70 BYTE), "JOB" VARCHAR2 (70 BYTE), "SMS_IN" VARCHAR2 (70 BYTE), "SMS_OUT" VARCHAR2 (70 BYTE), "DUR_IN" VARCHAR2 (70 BYTE), "DUR_OUT" VARCHAR2 (70 BYTE), "INTERV" VARCHAR2 (70 BYTE)) ORGANIZATION EXTERNAL   (TYPE ORACLE_LOADER DEFAULT DIRECTORY "MYCSV"ACCESS PARAMETERS ( records delimited by newline fields terminated by ','    ) LOCATION (‘trento.csv’)) REJECT LIMIT UNLIMITED;
CREATE TABLE "SYSTEM"."DATA_SMS"  ("ID" VARCHAR2 (70 BYTE), "DNAME" VARCHAR2 (70 BYTE), "JOB" VARCHAR2 (70 BYTE), "SMS_IN" VARCHAR2 (70 BYTE), "SMS_OUT" VARCHAR2 (70 BYTE), "DUR_IN" VARCHAR2 (70 BYTE), "DUR_OUT" VARCHAR2 (70 BYTE), "INTERV" VARCHAR2 (70 BYTE)) ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY "MYCSV"ACCESS PARAMETERS (records delimited by newline fields terminated by ','    )LOCATION (‘sms.csv’ ) )REJECT LIMIT UNLIMITED;
Select id, dname, job from dataa group by id order by job desc;
Select id, dname, job from dataa where job<0 order by to_number (job) asc;
Select id, dname, job from data_line where dname=‘DG1000422’ having to_number (count (job))>1;
Select id, count (sms_in), count (sms_out), and count (dur_in), count (dur_out) from data_trenito 
Where sms_in is not null group by id order by count (sms_in) desc;
Select id, count (sms_in), count (sms_out), and count (dur_in), count (dur_out) from DATA_SMS
Where sms_in is not null group by id order by count (sms_in) desc;
CREATE TABLE DATA_TELE ("ID" VARCHAR2 (70 BYTE),"PROVINCE" VARCHAR2 (70 BYTE), "INTERVAL" VARCHAR2 (70 BYTE),"SQ_PROVNCE" VARCHAR2 (70 BYTE),"PROVINCE_SQ" VARCHAR2 (70 BYTE)) ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY "MYCSV" ACCESS PARAMETERS ( records delimited by newline fields terminated by ','    ) LOCATION ('italian_tel.csv')) REJECT LIMIT UNLIMITED;
Select id, sum(PROVINCE_SQ )from data_TELE GROUP BY ID ORDER BY sum(PROVINCE_SQ )  DESC;
Select id, nvl(sum(SQ_PROVNCE ) ,'0')from data_TELE GROUP BY ID ORDER BY nvl(sum(SQ_PROVNCE ) ,'0') DESC;
                                                                                      

