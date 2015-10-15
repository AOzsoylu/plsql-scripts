SELECT s.username, s.sid, s.serial#,
       UPPER(DECODE(s.command, 1,'Create Table',2,'Insert',3,'Select', 4,'Create Cluster',5,'Alter Cluster',6,'Update',
                               7,'Delete', 8,'Drop Cluster', 9,'Create Index', 10,'Drop INdex', 11,'ALter Index', 12,'Drop Table',
                               13,'Create Sequence', 14,'ALter Sequence', 15,'ALter Table', 16,'Drop Sequence', 17,'Grant', 18,'Revoke',
                               19,'Create Synonym', 20,'Drop Synonym', 21,'Create View', 22,'Drop View', 23,'Validate Index',
                               24,'Create Procedure', 25,'Alter Procedure', 26,'Lock Table', 27,'No Operation', 28,'Rename',
                               29,'Comment', 30,'Audit', 31,'NoAudit', 32,'Create Database Link', 33,'Drop Database Link',
                               34,'Create Database', 35,'Alter Database', 36,'Create Rollback Segment', 37,'Alter Rollback Segment',
                               38,'Drop Rollback Segment', 39,'Create Tablespace', 40,'ALter Tablespace', 41,'Drop TAblespace',
                               42,'ALter Sessions', 43,'ALter User', 44,'Commit', 45,'Rollback', 46,'Savepoint', 47,'PL/SQL Execute',
                               48,'Set Transaction', 49,'ALter System switch Log', 50,'Explain Plan', 51,'Create User',
                               52,'Create Role', 53,'Drop User', 54,'Drop Role', 55,'Set Role', 56,'Create Schema',
                               57,'Create Control File', 58,'ALter Tracing', 59,'Create Trigger', 60,'Alter Trigger',
                               61,'Drop Trigger', 62,'Analyze Table', 63,'Analyze Index', 64,'Analyze Cluster', 65,'Create Profile',
                               66,'Drop Profile', 67,'Alter Profile', 68,'Drop Procedure', 69,'Drop Procedure', 70,'Alter Resource Cost',
                               71,'Create Snapshot Log', 72,'ALter Snapshot LOg', 73,'Drop Snapshot Log', 74,'Create Snapshot',
                               75,'Alter Snapshot', 76,'Drop Snapshot', 79,'ALter Role', 85,'Truncate Table', 86,'Truncate Cluster',
                               88,'Alter View', 91,'Create Function', 92,'ALter Function', 93,'Drop FUnction', 94,'Create Package',
                               95,'ALter Package',96,'Drop Package', 97,'Create Package Body', 98,'ALter Package Body',
                               99,'Drop Package Body')) command,
       t.value cpu_time, i.physical_reads phy_reads, i.block_gets blk_gets, s.status, s.lockwait, q.sql_text, s.sql_hash_value
FROM v$session s, v$sesstat t,v$statname n, v$sess_io i, v$sqlarea q
WHERE s.username is not null
  AND (t.value > 100 or i.physical_reads > 100 or i.block_gets > 100)
  AND s.sid = t.sid
  and t.statistic# = n.statistic#
  and n.name = 'CPU used by this session'
  AND s.sid = i.sid
  and s.sql_address = q.address
  and s.sql_hash_value = q.hash_value
ORDER BY t.value desc
/
