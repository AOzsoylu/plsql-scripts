accept pinstnum prompt 'Instance Number : ';
accept ptarih prompt 'Tarih : ';
select *
 from (select event
       ,waits "Waits"
        ,round(time / 1000000
         ,2) "Wait Time (s)"
        ,round(pct * 100
         ,2) "Percent of Total"
        ,waitclass "Wait Class"
        ,round(time / waits / 1000) "avg (ms)"
     from (select e.event_name event
           ,e.total_waits - nvl(b.total_waits
                     ,0) waits
           ,(e.time_waited_micro - nvl(b.time_waited_micro
                        ,0)) time
           ,(e.time_waited_micro - nvl(b.time_waited_micro
                        ,0)) / (select sum(e1.time_waited_micro - nvl(b1.time_waited_micro
                                               ,0))
                              from dba_hist_system_event b1
                                ,dba_hist_system_event e1
                             where b1.snap_id(+) = b.snap_id
                             and e1.snap_id = e.snap_id
                             and b1.dbid(+) = b.dbid
                             and e1.dbid = e.dbid
                             and b1.instance_number(+) = b.instance_number
                             and e1.instance_number = e.instance_number
                             and b1.event_id(+) = e1.event_id
                             and e1.total_waits > nvl(b1.total_waits
                                         ,0)
                             and e1.wait_class = 'Idle') pct
           ,e.wait_class waitclass
         from dba_hist_system_event b
           ,dba_hist_system_event e
           ,(with dhs as (select * from dba_hist_snapshot where instance_number = &pinstnum)
             select * from (
                         select max(dbid) dbid, max(begin_interval_time) maxdata, max(snap_id) da_snap
                                   from dhs
                                  where trunc(begin_interval_time
                                       ,'MI') = to_date('&ptarih'
                                               ,'dd-mm-yyyy hh24:mi'))
             ) s1
        where b.snap_id = s1.da_snap
          and e.snap_id = (select min(snap_id)
                   from dba_hist_snapshot
                  where trunc(begin_interval_time
                       ,'MI') >= to_date('&ptarih'
                                ,'dd-mm-yyyy hh24:mi')
                    and instance_number = &pinstnum)
          and b.dbid = s1.dbid
          and e.dbid = s1.dbid
          and b.instance_number(+) = &pinstnum
          and e.instance_number = &pinstnum
          and b.event_id(+) = e.event_id
          and e.total_waits > nvl(b.total_waits
                     ,0)
          and e.wait_class = 'Idle'
        order by time  desc
            ,waits desc))
--where event like '%&evt%'
/
