Create or replace TYPE Typ_JobsRunningObj is OBJECT (
  spid             varchar2(9),
  sid              number,
  serial#          number,
  job              number,
  username         varchar2(30),
  this_date        date,
  this_sec         varchar2(8),
  failures         number,
  broken           char(1),
  interval         varchar2(50),
  what             varchar2(200) )
/
Create or replace TYPE Typ_JobsRunningTab is TABLE OF Typ_JobsRunningObj
/
--
Create or replace function stfJobsRunning Return Typ_JobsRunningTab PIPELINED is
  --
  cursor mycur is
    SELECT /*+ RULE */
           p.spid,
           r.sid,
           v.serial#,
           r.job,
           j.schema_user as username,
           r.this_date,
           r.this_sec,
           j.failures,
           j.broken,
           Substr(j.interval,1,50) as interval,
           Substr(j.what,1,200) as what
    FROM dba_jobs_running r, dba_jobs j, v$session v, v$process p
    WHERE r.job = j.job
      AND r.sid = v.sid
      AND v.paddr = p.addr(+);
  myrec         mycur%ROWTYPE;
  --
  TYPE MyTabType is TABLE OF Typ_JobsRunningObj
    INDEX BY binary_integer;
  mytab       MyTabType;
  mytablen    number(10);
  thata       char(1);
  tpos        number(3);
Begin
  mytablen := 0;
  Open mycur;
  Loop
    Fetch mycur INTO myrec;
    Exit When mycur%NOTFOUND;
    mytablen := mytablen + 1;
    Begin
      mytab(mytablen) := Typ_JobsRunningObj( null,0,0,0,null,null,null,0,null,null,null );
      --
      mytab(mytablen).spid      := myrec.spid;
      mytab(mytablen).sid       := myrec.sid;
      mytab(mytablen).serial#   := myrec.serial#;
      mytab(mytablen).job       := myrec.job;
      mytab(mytablen).username  := myrec.username;
      mytab(mytablen).this_date := myrec.this_date;
      mytab(mytablen).this_sec  := myrec.this_sec;
      mytab(mytablen).failures  := myrec.failures;
      mytab(mytablen).broken    := myrec.broken;
      mytab(mytablen).interval  := myrec.interval;
      mytab(mytablen).what      := myrec.what;
    Exception
      When OTHERS Then
        Exit;
    End;
  End Loop;
  Close mycur;
  If ( mytablen = 0 ) Then
    Return;
  End If;
  For i IN 1..mytablen Loop
    PIPE ROW( mytab(i) );
  End Loop;
  Return;
End;
/
ALTER FUNCTION "STFJOBSRUNNING" COMPILE TIMESTAMP '2001-01-01:01:01:01';
--
create or replace view v_JobsRunning
 ( SPID, SID, SERIAL#, JOB, USERNAME, THIS_DATE, THIS_SEC,
   FAILURES, BROKEN, INTERVAL, WHAT )
as 
  SELECT SPID, SID, SERIAL#, JOB, USERNAME, THIS_DATE, THIS_SEC,
         FAILURES, BROKEN, INTERVAL, WHAT
  FROM table(sys.stfJobsRunning);
create or replace public synonym v_JobsRunning for v_JobsRunning;
--
--grant select on v_JobsRunning to selectrole, updaterole;
--grant execute on stfJobsRunning to selectrole, updaterole;
