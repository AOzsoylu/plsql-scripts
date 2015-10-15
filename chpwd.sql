select 'alter user '||username||' identified by '||&1||';' from dba_users where username not in ('SYS','SYSTEM')
/
