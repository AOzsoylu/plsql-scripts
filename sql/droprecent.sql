select 'drop '||object_type||' '||object_name||';'
 from all_objects
where object_type = 'TABLE'
order by created desc
/
