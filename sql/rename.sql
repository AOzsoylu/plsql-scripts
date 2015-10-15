select 'alter database rename file '''||name||''' to ''C'||substr(name,2)||''';' from v$datafile
union
select 'alter database rename file '''||member||''' to ''C'||substr(member,2)||''';' from v$logfile
union
select 'alter database rename file '''||name||''' to ''C'||substr(name,2)||''';' from v$tempfile
/
