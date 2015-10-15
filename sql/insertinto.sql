set trimspool on heading off verify off
set serveroutput on size 200000
declare
  ptable           varchar2(50) := '&1';
  mycid            integer default dbms_sql.open_cursor;
  mycolumnvalue    varchar2(4000);
  mystatus         integer;
  mydesctbl        dbms_sql.desc_tab;
  mycolcnt         number;
  tquery           varchar2(4000);
  tmyscriptheader  varchar2(4000);
  tmyscript        varchar2(4000);
  tx               varchar2(4000);
  tdatatype        varchar2(50);
begin
  tquery := 'SELECT * FROM '||ptable;
  execute immediate 'alter session set nls_date_format=''dd-mm-yyyy hh24:mi:ss'' ';
  dbms_sql.parse( mycid, tquery, dbms_sql.native );
  dbms_sql.describe_columns( mycid, mycolcnt, mydesctbl );
  --
  for i in 1 .. mycolcnt loop
    dbms_sql.define_column(mycid, i, mycolumnvalue, 4000);
  end loop;
  mystatus := dbms_sql.execute(mycid);
  --
  tmyscriptheader := 'INSERT INTO '||ptable||' VALUES (';
  --
  while ( dbms_sql.fetch_rows(mycid) > 0 ) loop
    tmyscript := tmyscriptheader;
    for i in 1 .. mycolcnt loop
      dbms_sql.column_value( mycid, i, mycolumnvalue );
      tx := mycolumnvalue;
      if ( tx is NULL ) Then
        tx := 'NULL';
      else
        -- çekilen deðer number, varchar2, date üçlüsünden hangisi?
	Begin
	  SELECT data_type INTO tdatatype FROM user_tab_columns WHERE table_name=Upper(ptable) AND column_name=mydesctbl(i).col_name;
	  if ( tdatatype IN ('CHAR','VARCHAR','VARCHAR2','CLOB') ) Then
            tx := ''''||tx||'''';
	  elsif ( tdatatype = 'DATE' ) Then
	    tx := 'To_Date('''||tx||''',''dd-mm-yyyy hh24:mi:ss'')';
	  end if;
        Exception
	  When OTHERS Then
            dbms_output.put_line( sqlerrm );
	End;
      end if;
      --
      if ( i <> 1 ) Then
        tx := ','||tx;
      end if;
      tmyscript := tmyscript||tx;
    end loop;
    dbms_output.put_line( tmyscript||');' );
  end loop;
  execute immediate 'alter session set nls_date_format=''dd-mm-yyyy'' ';
exception
  when others then
    execute immediate 'alter session set nls_date_format=''dd-mm-yyyy'' ';
    raise;
end;
/
set heading on verify on
