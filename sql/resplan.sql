COLUMN plan FORMAT A30
COLUMN comments FORMAT A30
COLUMN status FORMAT A10
SET LINESIZE 100
SELECT plan_id,plan,comments,status,mandatory
FROM   dba_cdb_rsrc_plans
WHERE  plan = 'CDB2_PLAN'
/
--
COLUMN plan FORMAT A30
COLUMN pluggable_database FORMAT A25
SET LINESIZE 100
SELECT plan,pluggable_database,shares,utilization_limit AS util,parallel_server_limit AS parallel
FROM   dba_cdb_rsrc_plan_directives
WHERE  plan = 'CDB2_PLAN'
ORDER BY pluggable_database
/
