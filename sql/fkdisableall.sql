set serveroutput on size 200000
declare
  cursor mycur is
    SELECT c.owner, c.table_name, c.constraint_name
      FROM user_constraints c, user_tables t
      WHERE c.table_name = t.table_name
        AND c.status = 'ENABLED'
      ORDER BY c.constraint_type DESC;
  myrec    mycur%ROWTYPE;
  tkomut   varchar2(500);
Begin
  open mycur;
  Loop
    Fetch mycur INTO myrec;
    Exit When mycur%NOTFOUND;
    --
    tkomut := 'alter table '||myrec.owner||'.'||myrec.table_name||' disable constraint '||myrec.constraint_name;
    begin
      dbms_utility.exec_ddl_statement( tkomut );
      -- dbms_output.put_line( tkomut||';' );
    exception
      When OTHERS Then
        dbms_output.put_line( sqlerrm );
        dbms_output.put_line( tkomut );
        dbms_output.put_line( '-------------------' );
    end;
  End Loop;
  Close mycur;
End;
/
