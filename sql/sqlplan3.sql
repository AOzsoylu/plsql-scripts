explain plan for
select 1 from dual;
select * from table(dbms_xplan.display(null, null, 'basic'));
