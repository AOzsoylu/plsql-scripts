set serveroutput on size 200000
set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 1000
declare
  TYPE SatirTabType is TABLE OF varchar2(500)
    INDEX BY binary_integer;
  satirtab      SatirTabType;
  satirtablen   number(3);
  cursor tabcur ( pname  varchar2 ) is
    SELECT tablespace_name, pct_free, pct_used, initial_extent/1024 as initial_extent,
           DECODE(next_extent,NULL,initial_extent/1024,next_extent/1024) as next_extent
      FROM user_tables
      WHERE table_name = pname;
  tabrec        tabcur%rowtype;
  cursor tabcolcur ( pname  varchar2 ) is
    SELECT column_name, data_type, data_length, data_precision, data_scale,
           decode(nullable,'Y',', ',' NOT NULL,') as nullable
      FROM user_tab_columns
      WHERE table_name = pname
      ORDER BY column_id;
  tabcolrec     tabcolcur%rowtype;
  cursor indcur ( pname  varchar2 ) is
    SELECT index_name FROM user_indexes
      WHERE table_name = pname;
  tindex_name   varchar2(100);
  cursor indcolcur( pname   varchar2 ) is
    SELECT column_name FROM user_ind_columns
      WHERE index_name = pname
      ORDER BY column_position;
  tcolname      varchar2(100);
  tname         varchar2(100);
  tsatir        varchar2(500);
Begin
  satirtablen := 0;
  tname := UPPER('&1');
  open tabcur( tname );
  Fetch tabcur INTO tabrec;
  If tabcur%FOUND Then
    Close tabcur;
    open tabcolcur( tname );
    Loop
      Fetch tabcolcur INTO tabcolrec;
      Exit When tabcolcur%NOTFOUND;
      --
      satirtablen := satirtablen + 1;
      If ( satirtablen = 1 ) Then -- baþlýk
        satirtab( satirtablen ) := 'CREATE TABLE '||tname||' (';
        satirtablen := satirtablen + 1;
      End If;
      satirtab( satirtablen ) := RPAD(tabcolrec.column_name,30,' ')||tabcolrec.data_type;
      If tabcolrec.data_type <> 'DATE' then
        If tabcolrec.data_type = 'NUMBER' Then
          satirtab( satirtablen ) := satirtab( satirtablen )||'('||tabcolrec.data_precision;
          If NVL(tabcolrec.data_scale,0) > 0 Then
            satirtab( satirtablen ) := satirtab( satirtablen )||','||tabcolrec.data_scale;
          End If;
        Else
          satirtab( satirtablen ) := satirtab( satirtablen )||'('||tabcolrec.data_length;
        End If;
        satirtab( satirtablen ) := satirtab( satirtablen )||')';
      End If;
      satirtab( satirtablen ) := satirtab( satirtablen )||tabcolrec.nullable;
    End Loop;
    Close tabcolcur;
    If satirtablen > 1 Then
      satirtab( satirtablen ) := Substr(satirtab(satirtablen),1,Length(satirtab(satirtablen))-1)||' )';
      satirtablen := satirtablen + 1;
      satirtab( satirtablen ) := 'TABLESPACE '||tabrec.tablespace_name;
      satirtablen := satirtablen + 1;
      satirtab( satirtablen ) := 'STORAGE ( INITIAL '||tabrec.initial_extent||'K NEXT '||tabrec.next_extent||'K MAXEXTENTS UNLIMITED PCTINCREASE 0 )';
      satirtablen := satirtablen + 1;
      satirtab( satirtablen ) := '/';
      --
      Open indcur( tname );
      Loop
        Fetch indcur INTO tindex_name;
        Exit When indcur%NOTFOUND;
        --
        tsatir := null;
        Open indcolcur( tindex_name );
        Loop
          Fetch indcolcur INTO tcolname;
          Exit When indcolcur%NOTFOUND;
          if tsatir is null then
            tsatir := tcolname;
          else
            tsatir := tsatir||', '||tcolname;
          end if;
        End Loop;
        Close indcolcur;
        if tsatir is not null then
          satirtablen := satirtablen + 1;
          satirtab( satirtablen ) := 'CREATE INDEX '||tindex_name||' ON ';
          satirtablen := satirtablen + 1;
          satirtab( satirtablen ) := tname||'( '||tsatir||' )';
          satirtablen := satirtablen + 1;
          satirtab( satirtablen ) := '/';
        end if;
        --
      End Loop;
      Close indcur;
      --
      For i IN 1..satirtablen Loop
        dbms_output.put_line( satirtab(i) );
      End Loop;
    End If;
  Else
    Close tabcur;
    dbms_output.put_line('Tablo bulunamadý');
  End If;
End;
/
set head on feedback on verify on trimspool off
