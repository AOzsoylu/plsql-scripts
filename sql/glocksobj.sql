select inst_id, sid from gv$lock
where id1=( select object_id from dba_objects where owner=Upper('&owner')
              and object_name=Upper('&objname') )
/
