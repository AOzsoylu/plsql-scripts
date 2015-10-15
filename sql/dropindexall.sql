select tablespace_name, index_name, DECODE(Substr(index_name,1,2),'PK','alter table '||table_name||' drop constraint '||index_name||';','drop index '||index_name||';')
 from user_indexes
order by 3
/
