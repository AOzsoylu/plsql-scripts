prompt 'zaman formatý DD/MM/YYYY HH24:MI:SS olmalý :'
select To_Char(timestamp_to_scn(to_timestamp('&zaman','DD/MM/YYYY HH24:MI:SS')),'fm9999999999999999990') as scn from dual
/
