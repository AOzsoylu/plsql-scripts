set pages 0 feed off veri off lines 500 wrap off
accept useradi prompt "Model olacak User Adý: "
accept yeniuseradi prompt "Yeni User Adý: "
accept yeniusersifre prompt "Yeni User Þifresi: " HIDE
spool output.sql
--
-- Create user...
select 'create user &&yeniuseradi identified by values '' '''||
       ' default tablespace '||default_tablespace||
       ' temporary tablespace '||temporary_tablespace||' profile '||profile||';'
from sys.dba_users
where username = upper('&&useradi');
-- Grant Roles...
select 'grant '||granted_role||' to &&yeniuseradi'||
       decode(ADMIN_OPTION, 'YES', ' WITH ADMIN OPTION')||';'
from sys.dba_role_privs
where grantee = upper('&&useradi');
-- Grant System Privs...
select 'grant '||privilege||' to &&yeniuseradi'||
       decode(ADMIN_OPTION, 'YES', ' WITH ADMIN OPTION')||';'
from sys.dba_sys_privs
where grantee = upper('&&useradi');
-- Grant Object Privs...
select 'grant '||privilege||' on '||owner||'.'||table_name||' to &&yeniuseradi'||
       decode(GRANTABLE, 'YES', ' WITH GRANT OPTION')||';'
from sys.dba_tab_privs
where grantee = upper('&&useradi');
-- Grant Column Privs...
select 'grant '||privilege||' on '||owner||'.'||table_name||
       '('||column_name||') to &&yeniuseradi'||
       decode(GRANTABLE,'YES',' WITH ADMIN OPTION;',';')
from sys.dba_col_privs
where grantee = upper('&&useradi');
-- Tablespace Quotas...
select 'alter user '||username||' quota '||
       decode(max_bytes, -1, 'UNLIMITED', max_bytes)||
       ' on '||tablespace_name||';'
from sys.dba_ts_quotas
where username = upper('&&useradi');
-- SYSDBA Privs...
select 'grant '||decode(SYSDBA,'TRUE','SYSDBA')||
       ' to &&yeniuseradi'||';'
from v$pwfile_users
where username=upper('&&useradi');
-- SYSOPER Privs...
select 'grant '||decode(SYSOPER,'TRUE','SYSOPER')||
       ' to &&yeniuseradi'||';'
from v$pwfile_users
where username=upper('&&useradi');
-- Set Default Role...
set serveroutput on
create table deneme (line varchar2(4000));
declare
  defroles varchar2(4000);
begin
  for c1 in ( select * from sys.dba_role_privs where grantee = upper('&&useradi')
              and default_role = 'YES' ) loop
    if length(defroles) > 0 then
      defroles := defroles||','||c1.granted_role;
    else
      defroles := defroles||c1.granted_role;
    end if;
  end loop;
  --- Sometimes output buffer size is not enough for display
  --- Therefore keeping the output in a table is better.
  --- dbms_output.put_line('alter user &&yeniuseradi default role '||defroles||';');
  insert into deneme values ('alter user &&yeniuseradi default role '||defroles||';');
end;
/
select * from deneme;
drop table deneme;
spool off
-- @output
--- More secure to keep password in memory rather than spool file
-- alter user &&yeniuseradi identified by &&yeniusersifre;
-- host del output.sql
-- quit
