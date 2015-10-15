select bytes "MB", status, name from
( select '1' as sira, status, trunc(bytes/(1024*1024)) as bytes, name
    from v$datafile
  union
  select '2' as sira, '---------' as status, NULL as bytes, '-------------------------------------------' as name
    from dual
  union
  select '3' as sira, status, trunc(bytes/(1024*1024)) as bytes, name
    from v$tempfile )
where Upper(name) like Upper('%&filename%')
order by sira, name
/
