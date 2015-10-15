select sid, serial#, audsid from v$session where audsid = userenv('SESSIONID')
/
