SELECT COMMAND,
       SNAP_ID,
       TIMESTAMP,
       SQL_ID,
       TO_CHAR(SQL_TEXT) AS SQLTEXT
FROM ( SELECT X.SNAP_ID,
              X.SQL_ID,
              SQL_TEXT,
              ROUND(X.ELAPSED_TIME/1000000/X.EXECUTIONS_DELTA,3) AVG_ELAPSED_TIME_SEC,
              ROUND(X.CPU_TIME/1000000/X.EXECUTIONS_DELTA,3) AVG_CPU_TIME_SEC,
              X.ELAPSED_TIME TOTAL_ELAPSED_TIME_MIC_SEC,
              X.CPU_TIME TOTAL_CPU_TIME_MIC_SEC,
              X.EXECUTIONS_DELTA EXECUTIONS,
              DECODE(DHST.COMMAND_TYPE, 3, 'Select',
                                       47, 'pl/sql',
                                        2, 'Insert' ) COMMAND,
              DHSP.TIMESTAMP
       FROM DBA_HIST_SQLTEXT DHST,
            DBA_HIST_SQL_PLAN DHSP,
            ( SELECT DHSS.SNAP_ID,
                     DHSS.SQL_ID SQL_ID,
                     SUM(DHSS.CPU_TIME_DELTA) CPU_TIME,
                     SUM(DHSS.ELAPSED_TIME_DELTA) ELAPSED_TIME,
                     SUM(DHSS.EXECUTIONS_DELTA) EXECUTIONS_DELTA
              FROM DBA_HIST_SQLSTAT DHSS
              WHERE PARSING_SCHEMA_NAME=Upper('&schema')
              GROUP BY DHSS.SQL_ID, DHSS.SNAP_ID) X
       WHERE X.SQL_ID=DHST.SQL_ID
         AND X.EXECUTIONS_DELTA>0
         AND DHSP.SQL_ID=X.SQL_ID
       ORDER BY AVG_ELAPSED_TIME_SEC DESC )
WHERE UPPER(DBMS_LOB.SUBSTR(SQL_TEXT,4000,1)) LIKE Upper('%&sqltext%')
GROUP BY TO_CHAR(SQL_TEXT), COMMAND, SNAP_ID, TIMESTAMP, SQL_ID
ORDER BY TIMESTAMP DESC
/
