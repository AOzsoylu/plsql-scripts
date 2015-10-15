select * from (
select created, last_ddl_time, object_type, object_name from user_objects
order by 2 desc )
where rownum <= 50
/
