SELECT MACHINE, FAILOVER_TYPE, FAILOVER_METHOD, FAILED_OVER, COUNT(*) FROM V$SESSION
group by MACHINE, FAILOVER_TYPE, FAILOVER_METHOD, FAILED_OVER
/
