set serveroutput on
Declare
  cursor mycur( powner  varchar2, ptable   varchar2 ) is
    SELECT index_name FROM all_indexes
      WHERE owner = powner AND table_name = ptable
      ORDER BY index_name;
  tindex_name   all_ind_columns.index_name%TYPE;
  cursor colcur( powname varchar2, pname   varchar2 ) is
    SELECT column_name FROM all_ind_columns
      WHERE index_owner = powname AND index_name = pname
      ORDER BY column_position;
  tcolname    all_ind_columns.column_name%TYPE;
  temp        varchar2(1000);
  mytable     varchar2(100);
  myowner     varchar2(100);
begin
  myowner:=Upper(LTrim(RTrim( '&owner' )));
  mytable:=Upper(LTrim(RTrim( '&table' )));
  dbms_output.put_line(' ');
  dbms_output.put_line('OWNER NAME : '||myowner);
  dbms_output.put_line('TABLE NAME : '||mytable);
  dbms_output.put_line(RPAD('INDEX NAME',33)||'COLUMNS');
  dbms_output.put_line(RPAD('=',65,'='));
  Open mycur( myowner, mytable );
  Loop
    Fetch mycur INTO tindex_name;
    Exit When mycur%NOTFOUND;
    temp := NULL;
    Open colcur( myowner, tindex_name );
    Loop
      Fetch colcur INTO tcolname;
      Exit When colcur%NOTFOUND;
      If ( temp is NULL ) Then
        temp := LTrim(RTrim( tcolname ));
      Else
        temp := temp||'+'||LTrim(RTrim( tcolname ));
      End If;
    End Loop;
    Close colcur;
    dbms_output.put_line(RPAD(tindex_name,30)||' : '||temp);
  End Loop;
  Close mycur;
End;
/
