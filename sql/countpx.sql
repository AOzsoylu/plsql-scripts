set serveroutput on size 200000
declare
  mycur    SYS_REFCURSOR;
  tsay     number;
  tname    varchar2(100);
  --
  cursor tabcur (ptab  varchar2) is
    select table_name as tname, partition_name as pname
    from user_tab_partitions
    where table_name = UPPER(ptab)
    order by partition_name;
  tabrec   tabcur%ROWTYPE;
  --
  tmysql   varchar2(500);
begin
  tname := Upper('&1');
  Open tabcur( tname );
  Loop
    Fetch tabcur INTO tabrec;
    Exit when tabcur%NOTFOUND;
    --
    begin
      tmysql := 'SELECT count(*) FROM '||tabrec.tname||' partition ('||tabrec.pname||')';
      Open mycur FOR tmysql;
      Fetch mycur INTO tsay;
      dbms_output.put_line( RPAD(tabrec.pname,32,' ')||'-> '||To_Char(tsay,'fm9999999999999990') );
      Close mycur;
    exception
      when others then
      dbms_output.put_line( RPAD(tabrec.pname,32,' ')||'-> ?' );
    end;
    --
  End Loop;
  Close tabcur;
end;
/
