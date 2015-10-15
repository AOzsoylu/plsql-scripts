select 'revoke all on '||object_name||' from public;'
 from all_objects a where owner not in
 ('SYS','PUBLIC','SYSTEM','ORDSYS','MDSYS','CTXSYS','WKSYS','OEM_OHOST','OUTLN')
/
