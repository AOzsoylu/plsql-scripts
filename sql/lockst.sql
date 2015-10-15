SELECT /*+ RULE */
  p.spid unix_pid,
  c.sid,
  c.serial# "Serial",
  NVL( lockwait, 'ACTIVE') "Wait",
  Substr(object_name,1,30) "Object",
  object_type "Object Type",
  Substr(owner,1,10) "Owner",
  DECODE( locked_mode,2,'Row Share',
                      3,'Row Exclusive',
                      4,'Share',
                      5,'Share Row Exclusive',
                      6,'Exclusive', 'Unknown') "Lock Mode",
  Substr(DECODE(sfprogramadi(c.sid, c.serial#),NULL,c.program,'OPSIS-'||sfprogramadi(c.sid, c.serial#)),1,48) "Program",
--  c.program "Program",
  os_user_name "OS Username"
FROM v$locked_object a, all_objects b, v$session c, v$process p
WHERE a.object_id = b.object_id
  AND c.sid       = a.session_id
  AND c.paddr     = p.addr(+)
  AND Upper(object_name) like Upper('&1%')
ORDER BY Substr(owner,1,10) ASC,
         Substr(object_name,1,20) ASC,
         NVL( lockwait, 'ACTIVE') DESC
/
