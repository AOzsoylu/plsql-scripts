set arraysize 5
set pagesize 10000
set linesize 10000
set serveroutput on size 200000
set trimspool on
-- ----------------------
column name format A70
set heading off verify off feedback off
define prompt='SQL->'
column prompt format a40
column prompt new_value prompt
set termout off
select 'set sqlprompt '||localconnection||'->' as prompt from dual;
set sqlprompt &prompt
set termout on
-- set sqlprompt "_user @ _connect_identifier _privilege >"
-- set sqlprompt SQL->
set heading on verify on feedback on
-- ----------------------
set arraysize 5
set pagesize 10000
set linesize 10000
set serveroutput on size 200000
set trimspool on
