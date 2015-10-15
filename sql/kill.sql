select 'alter system kill session '''||sid||','||serial#||''';' from v$session
where terminal NOT IN ('ATILLAOZ','ATILLAOZ-N')
  and username is not null
  and status != 'KILLED'
/
