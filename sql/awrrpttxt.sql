select 'select * from table(dbms_workload_repository.awr_report_text( '||'&'||'dbid, '||'&'||'instancenumber, '||'&'||'beginsnap, '||'&'||'endsnap ));' from v$database a, v$instance b
/

