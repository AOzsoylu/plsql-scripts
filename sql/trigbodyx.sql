set serveroutput on size 200000
accept myowner prompt 'Owner   : ';
accept mytriggername prompt 'Trigger : ';
declare
  cursor mycur is
    select body from ao$clob;
  cbody      clob;
  tpos       number;
begin
  insert into ao$clob (body)
    select to_lob(trigger_body) from dba_triggers
    where owner=Upper('&myowner')
      and trigger_name=Upper('&mytriggername');
  open mycur;
  fetch mycur INTO cbody;
  if mycur%found then
    cbody := '|'||cbody;
    while ( 1=1 ) loop
      tpos := InStr(cbody,chr(10));
      if ( tpos > 0 ) then
        dbms_output.put_line(Substr(cbody,1,tpos-1));
        cbody := '|'||Substr(cbody,tpos+1);
      else
        dbms_output.put_line(cbody);
        exit;
      end if;
    end loop;
  end if;
  close mycur;
  commit;
end;
/
