set serveroutput on
declare
  cursor tabcur is
    select owner, table_name as name from dba_tables
    where owner in ( Upper('&1') )
    order by 1,2;
  tabrec    tabcur%rowtype;
  cursor findcur ( ptext  varchar2 ) is
    select name from dba_source where upper(text) like upper( ptext );
  tx    varchar2(1000);
  tyok  boolean;
begin
  open tabcur;
  loop
    fetch tabcur into tabrec;
    exit when tabcur%notfound;
    --
    tyok := TRUE;
    open findcur( tabrec.name );
    fetch findcur into tx;
    if findcur%FOUND Then
      tyok := FALSE;
    end if;
    Close findcur;
    open findcur( tabrec.owner||'.'||tabrec.name );
    fetch findcur into tx;
    if findcur%FOUND Then
      tyok := FALSE;
    end if;
    if tyok then
      dbms_output.put_line( tabrec.owner||'.'||tabrec.name );
    end if;
    Close findcur;
    --
  end loop;
  close tabcur;
end;
/
