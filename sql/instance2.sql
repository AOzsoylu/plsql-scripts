set head off feedback off verify off trimspool on
exec dbms_output.put_line(RPAD('-',50,'-'));
select banner from v$version;
exec dbms_output.put_line(RPAD('-',50,'-'));
set serveroutput on size 200000
declare
  cursor mycur is
    select * from v$instance;
   myrec   mycur%rowtype;
begin
  open mycur;
  fetch mycur INTO myrec;
  if mycur%found then
    dbms_output.put_line('Instance Number : '||myrec.instance_number);
    dbms_output.put_line('Instance Name   : '||myrec.instance_name);
    dbms_output.put_line('Host Name       : '||myrec.host_name);
    dbms_output.put_line('Version         : '||myrec.version);
    dbms_output.put_line('Startup Time    : '||To_Char(myrec.startup_time,'dd/mm/yyyy hh24:mi:ss'));
    dbms_output.put_line('Status          : '||myrec.status);
    dbms_output.put_line('Parallel        : '||myrec.parallel);
    dbms_output.put_line('Thread#         : '||myrec.thread#);
    dbms_output.put_line('Archiver        : '||myrec.archiver);
    dbms_output.put_line('Log Switch Wait : '||myrec.log_switch_wait);
    dbms_output.put_line('Logins          : '||myrec.logins);
    dbms_output.put_line('Shutdown Pending: '||myrec.shutdown_pending);
    dbms_output.put_line('Database Status : '||myrec.database_status);
    dbms_output.put_line('Instance Role   : '||myrec.instance_role);
    dbms_output.put_line('Active State    : '||myrec.active_state);
  else
    dbms_output.put_line('Sistem bilgileri sorgulanamadý!');
  end if;
  close mycur;
end;
/
exec dbms_output.put_line(RPAD('-',50,'-'));
set head on feedback on verify on trimspool on
