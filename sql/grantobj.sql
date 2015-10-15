select u.name as owner,
       'grant '||tpm.name||' on '||o.name||' to '||ue.name||decode(oa.option$,1,' with grant option;',';') as script,
       ue.name as grantee,
       o.name as object,
       tpm.name as privilege,
       decode(mod(oa.option$,2), 1, 'YES', 'NO'),
       decode(bitand(oa.option$,2), 2, 'YES', 'NO')
from sys.objauth$ oa, sys.obj$ o, sys.user$ u, sys.user$ ue, table_privilege_map tpm
where oa.obj# = o.obj#
  and oa.grantor# = u.user#
  and oa.grantee# = ue.user#
  and oa.col# is null
  and u.user# = o.owner#
  and oa.privilege# = tpm.privilege
  and u.user# in (oa.grantor#, oa.grantee#, o.owner#)
  and u.name like Upper('%&username%')
  and o.name like Upper('%&objectname%')
order by u.name, ue.name, o.name, tpm.name
/
