SET HEAD OFF VERIFY OFF
SELECT DECODE(ROWNUM, 1, 'CREATE OR REPLACE '||RTRIM(RTRIM(us.text, CHR(10))),
       RTRIM(RTRIM(us.text, CHR(10) ))) text
FROM  user_source us
WHERE us.name = UPPER('&1')
  AND us.type = UPPER('&2')
ORDER BY us.line
/
prompt /
SET HEAD ON VERIFY ON
