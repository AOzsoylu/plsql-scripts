set serveroutput on size 200000
declare
  cursor mycur ( powner  varchar2, ptrigname  varchar2 ) is
    select TRIGGER_BODY from dba_triggers
      where owner = powner and trigger_name = ptrigname;
  tbody      long;
  towner     varchar2(100);
  ttrigname  varchar2(100);
begin
  dbms_output.put_line('-------------------------------');
  dbms_output.put_line('@trigbody <owner> <triggername>');
  dbms_output.put_line('-------------------------------');
  towner := Upper('&1');
  ttrigname := Upper('&2');
  open mycur( towner, ttrigname );
  fetch mycur INTO tbody;
  if mycur%found then
    dbms_output.put('|');
    for i IN 1 .. length(tbody) loop
      if ( ASCII(substr(tbody,i,1)) = 10 ) Then
        dbms_output.put_line(' ');
        dbms_output.put('|');
      elsif ( ASCII(substr(tbody,i,1)) = 32 ) Then
        dbms_output.put(' ');
      else
        dbms_output.put( substr(tbody,i,1) );
      end if;
    end loop;
  end if;
  close mycur;
end;
/
