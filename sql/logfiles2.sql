COLUMN MEMBER FORMAT A50
SELECT V2.THREAD#,
       V2.GROUP#,V2.STATUS,
       V1.MEMBER,
       V2.BYTES/1024/1024 AS REDO_SIZE_MB
FROM V$LOGFILE V1, V$LOG V2
WHERE V1.GROUP# = V2.GROUP#
ORDER BY V2.GROUP#, V1.MEMBER, V2.STATUS
/
