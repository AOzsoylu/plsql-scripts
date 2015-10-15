set heading off verify off feedback off
select 'alter profile default limit password_life_time unlimited;' from dual
union all
select 'alter user <username> identified by <userpwd>;' from dual;
set heading on verify on feedback on
