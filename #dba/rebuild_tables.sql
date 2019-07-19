-- Rebuild all replicate tables in KTSR_OWNER

CREATE TABLESPACE TMP_REPLDATA DATAFILE
  '/oradata/KTSR/repldata/tmprepldata.dbf' SIZE 23552M AUTOEXTEND OFF
NOLOGGING
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT MANUAL;

ALTER TABLE KTSR_OWNER.T_REPL_TABLE MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_TABLE_STRUCTURE MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_TABLE_ACTION MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_ERRORS MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PACK MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PROCESSED_FILES MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PACKED_FOR_SERVER MOVE TABLESPACE TMP_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PREPARED_DATA MOVE LOB (DATA) STORE AS (TABLESPACE TMP_REPLDATA);
ALTER TABLE KTSR_OWNER.T_REPL_PREPARED_DATA MOVE TABLESPACE TMP_REPLDATA;

DROP TABLESPACE SAR_REPLDATA INCLUDING CONTENTS AND DATAFILES;

CREATE TABLESPACE SAR_REPLDATA DATAFILE
  '/oradata/KTSR/repldata/sarrepldata01.dbf' SIZE 8192M AUTOEXTEND OFF
NOLOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT MANUAL;

ALTER TABLE KTSR_OWNER.T_REPL_TABLE MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_TABLE_STRUCTURE MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_TABLE_ACTION MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_ERRORS MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PACK MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PROCESSED_FILES MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PACKED_FOR_SERVER MOVE TABLESPACE SAR_REPLDATA;
ALTER TABLE KTSR_OWNER.T_REPL_PREPARED_DATA MOVE LOB (DATA) STORE AS (TABLESPACE SAR_REPLDATA);
ALTER TABLE KTSR_OWNER.T_REPL_PREPARED_DATA MOVE TABLESPACE SAR_REPLDATA;

DROP TABLESPACE TMP_REPLDATA INCLUDING CONTENTS AND DATAFILES;


declare
    l_str VARCHAR2(300);
begin
    for r in (select owner, index_name from dba_indexes where owner = 'KTSR_OWNER' and table_name like 'T_REPL%' and index_type = 'NORMAL')
    loop
        l_str := 'alter index '||r.owner||'.'||r.index_name||' rebuild online';
        dbms_output.put_line (l_str);
        execute immediate l_str;
    end loop;
end;
/


-- Rebuild T_ASSIGN* tables in KTSR_OWNER

ALTER TABLE KTSR_OWNER.T_ASSIGN_SERVICE MOVE TABLESPACE SAR_DATA;
ALTER TABLE KTSR_OWNER.T_ASSIGN MOVE TABLESPACE SAR_DATA;

declare
    l_str VARCHAR2(300);
begin
    for r in (select owner, index_name from dba_indexes where owner = 'KTSR_OWNER' and table_name in ('T_ASSIGN_SERVICE','T_ASSIGN') and index_type = 'NORMAL')
    loop
        l_str := 'alter index '||r.owner||'.'||r.index_name||' rebuild online';
        dbms_output.put_line (l_str);
        execute immediate l_str;
    end loop;
end;
/

-- Rebuild T_LOG

ALTER TABLE KTSR_OWNER.T_LOG MOVE TABLESPACE SAR_LOG;

declare
    l_str VARCHAR2(300);
begin
    for r in (select owner, index_name from dba_indexes where owner = 'KTSR_OWNER' and table_name in ('T_LOG') order by table_name, index_name desc)
    loop
        l_str := 'alter index '||r.owner||'.'||r.index_name||' rebuild online';
        dbms_output.put_line (l_str);
        execute immediate l_str;
    end loop;
end;
/


-- Rebuild assign , provodka, saldo

ALTER TABLE KTSR_OWNER.T_ASSIGN MOVE TABLESPACE SAR_DATA;
ALTER TABLE KTSR_OWNER.T_ASSIGN_SERVICE MOVE TABLESPACE SAR_DATA;

ALTER TABLE KTSR_OWNER.T_PROVODKA MOVE TABLESPACE SAR_PROV;
ALTER TABLE KTSR_OWNER.T_SALDO_PAY MOVE TABLESPACE SAR_PROV;



declare
    l_str VARCHAR2(300);
begin
    for r in (select owner, index_name from dba_indexes where owner = 'KTSR_OWNER' and table_name in ('T_ASSIGN','T_ASSIGN_SERVICE','T_PROVODKA', 'T_SALDO_PAY') order by table_name, index_name desc)
    loop
        l_str := 'alter index '||r.owner||'.'||r.index_name||' rebuild online';
        dbms_output.put_line (l_str);
        execute immediate l_str;
    end loop;
end;
/



ALTER TABLE KTSR_OWNER.T_LS_SERVICE MOVE TABLESPACE SAR_DATA;
ALTER TABLE KTSR_OWNER.T_LS_SERVICE_DOSSIER MOVE TABLESPACE SAR_DATA;
ALTER TABLE KTSR_OWNER.T_TARIFF_BASE MOVE TABLESPACE SAR_DATA;

declare
    l_str VARCHAR2(300);
begin
    for r in (select owner, index_name from dba_indexes where owner = 'KTSR_OWNER' and table_name in ('T_LS_SERVICE','T_LS_SERVICE_DOSSIER','T_TARIFF_BASE') order by table_name, index_name desc)
    loop
        l_str := 'alter index '||r.owner||'.'||r.index_name||' rebuild online';
        dbms_output.put_line (l_str);
        execute immediate l_str;
    end loop;
end;
/
