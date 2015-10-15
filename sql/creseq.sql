select 'create sequence '||sequence_name||
       ' start with '||last_number||
       ' increment by '||increment_by||
       ' '||decode(cycle_flag,'Y','CYCLE','NOCYCLE')||
       ' '||decode(cycle_flag,'N',NULL,'MINVALUE '||min_value||' MAXVALUE '||max_value)||
       ' NOCACHE;' from user_sequences
order by sequence_name
/
