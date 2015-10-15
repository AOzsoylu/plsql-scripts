select * from (
select created, object_name from user_objects
order by created desc )
where rownum <= &sayi
/
