set trimspool on heading off verify off
set serveroutput on size 200000
prompt :
exec printsql('&1')
set heading on verify on
