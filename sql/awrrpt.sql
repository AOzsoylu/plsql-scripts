set feedback off
set echo off
set verify off
set timing off
 
-- Set AWR_FORMAT to "text" or "html"

define AWR_FORMAT = 'html'

define outfile_name = 'awrrptsil.sql'
define NO_ADDM = 0
 
-- Get values for dbid and inst_num before calling awrinput.sql
 
set echo off heading on
column inst_num heading "Inst Num" new_value inst_num format 99999;
column inst_name heading "Instance" new_value inst_name format a12;
column db_name heading "DB Name" new_value db_name format a12;
column dbid heading "DB Id" new_value dbid format 9999999999 just c;
 
prompt
prompt Current Instance
prompt ~~~~~~~~~~~~~~~~
 
select d.dbid dbid
 , d.name db_name
 , i.instance_number inst_num
 , i.instance_name inst_name
 from v$database d,
 v$instance i;

-- Call the Oracle common input script to setup start and end snap ids

@@awrinput.sql

set heading off
set linesize 1000
set trimspool on
set serverout on
set termout off
 
-- spool to outputfile
spool &outfile_name

set heading on
 
-- Begin iterating through snapshots and generating reports
DECLARE
  c_awr_options     CONSTANT NUMBER := &&NO_ADDM;
  c_report_type     CONSTANT CHAR(4):= '&&AWR_FORMAT';
  v_awr_reportname  VARCHAR2(100);
  v_report_suffix   CHAR(5);

BEGIN
  dbms_output.put_line('');
  dbms_output.put_line('prompt Beginning AWR Generation...');
  dbms_output.put_line('set heading off feedback off lines 1000 pages 9000 trimspool on trimout on');

  -- Determine report type (html or text)
  IF c_report_type = 'html' THEN
    v_report_suffix := '.html';
  ELSE
    v_report_suffix := '.txt';
  END IF;

  -- Construct filename for AWR report
  v_awr_reportname := 'awrrpt_'|| :inst_num ||'_'|| :bid ||'_'|| :eid|| v_report_suffix;

  dbms_output.put_line('prompt ..Creating AWR Report '||v_awr_reportname||' for instance number '|| :inst_num ||' snapshots '|| :bid||' to '|| :eid );

  -- Disable terminal output to stop AWR text appearing on screen
  dbms_output.put_line('set termout off');

  -- Set spool to create AWR report file
  dbms_output.put_line('spool '||v_awr_reportname);

  -- call the table function to generate the report
  dbms_output.put_line('select output from table(dbms_workload_repository.awr_report_'||c_report_type||'('|| :dbid ||','|| :inst_num ||','|| :bid ||','|| :eid ||','||c_awr_options||'));');

  dbms_output.put_line('spool off');

  -- Enable terminal output having finished generating AWR report
  dbms_output.put_line('set termout on');
  dbms_output.put_line('set heading on feedback 6 lines 1000 pages 1000');
  dbms_output.put_line('prompt AWR Generation Complete');
 
  -- EXCEPTION HANDLER?
END;
/
 
spool off
set termout on

@@awrrptsil.sql
 
--clear columns sql
undefine outfile_name
undefine AWR_FORMAT
undefine DEFAULT_OUTPUT_FILENAME
undefine NO_ADDM
undefine OUTFILE_NAME
 
set feedback 6 verify on lines 1000 pages 1000
