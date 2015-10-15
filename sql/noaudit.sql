select 'noaudit '|| privilege||';' from dba_priv_audit_opts where user_name is null
/
