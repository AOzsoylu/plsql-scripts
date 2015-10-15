set heading off verify off feedback off
exec dbms_output.put_line(RPAD('-',20,'-'));
declare
  mycid         integer default dbms_sql.open_cursor;
  mycolumnvalue varchar2(4000);
  mystatus      integer;
  mydesctbl     dbms_sql.desc_tab;
  mycolcnt      number;
  myquery       varchar2(4000) := '&1';
begin
  execute immediate 'alter session set nls_date_format=''dd-mm-yyyy hh24:mi:ss'' ';
  dbms_sql.parse( mycid, myquery, dbms_sql.native );
  dbms_sql.describe_columns( mycid, mycolcnt, mydesctbl );
  for i in 1 .. mycolcnt loop
    dbms_sql.define_column(mycid, i, mycolumnvalue, 4000);
  end loop;
  mystatus := dbms_sql.execute(mycid);
  --
  while ( dbms_sql.fetch_rows(mycid) > 0 ) loop
    for i in 1 .. mycolcnt loop
      dbms_sql.column_value( mycid, i, mycolumnvalue );
      dbms_output.put_line( rpad( mydesctbl(i).col_name, 30 )|| ': ' || mycolumnvalue );
    end loop;
    dbms_output.put_line(RPAD('-',20,'-'));
  end loop;
  execute immediate 'alter session set nls_date_format=''dd-mm-yyyy'' ';
exception
  when others then
    execute immediate 'alter session set nls_date_format=''dd-mm-yyyy'' ';
    raise;
end;
/
set heading on verify on feedback on
