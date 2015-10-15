set head off feedback off verify off trimspool on
exec dbms_output.put_line(RPAD('Sistem Saati ',16,'-')||'> '||To_Char(sysdate,'DD-MM-YYYY HH24:MI:SS'))
--select name, value from v$sysstat where name in ('user commits','user rollbacks');
select RPAD(name,20,' ')||To_Char(value,'9999999999999990') from v$sysstat where name in ('user commits','user rollbacks');
set head on feedback on verify on trimspool off
