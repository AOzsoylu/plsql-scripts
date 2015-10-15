select distinct owner, name, type from dba_source
where upper(text) like upper('%'||'&text'||'%')
order by 1,2,3
/
