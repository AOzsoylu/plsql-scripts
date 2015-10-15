set pages 10000
set linesize 1000
set trimspool on 
drop table ao$keeppool purge;
create table ao$keeppool as
select
   o.owner          owner,
   o.object_name    object_name,
   o.subobject_name subobject_name,
   o.object_type    object_type,
   count(distinct file# || block#)         num_blocks
from
   dba_objects  o,
   v$bh         bh
where
   o.data_object_id  = bh.objd
and
   o.owner not in ('SYS','SYSTEM')
and
   bh.status != 'free'
group by
   o.owner,
   o.object_name,
   o.subobject_name,
   o.object_type
order by
   count(distinct file# || block#) desc
/
spool keeppool.lst
select
   'alter '||s.segment_type||' '||t1.owner||'.'||s.segment_name||' storage (buffer_pool keep);'
from
   ao$keeppool t1,
   dba_segments s
where
   s.segment_name = t1.object_name
and
   s.owner = t1.owner
and
   s.segment_type = t1.object_type
and
   nvl(s.partition_name,'-') = nvl(t1.subobject_name,'-')
and
   buffer_pool <> 'KEEP'
and
   object_type in ('TABLE','INDEX') 
group by
   s.segment_type,
   t1.owner,
   s.segment_name
having
   (sum(num_blocks)/greatest(sum(blocks), .001))*100 > 80
/
spool off;
drop table ao$keeppool purge;
