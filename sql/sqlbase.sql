prompt |
prompt |
prompt |  alter session set optimizer_use_sql_plan_baselines = false;
prompt |  alter session set optimizer_use_sql_plan_baselines = true;
prompt |
prompt |
prompt |  select signature, sql_handle, plan_name, enabled, accepted, fixed, sql_text from dba_sql_plan_baselines; 
prompt |
prompt |
prompt |  declare
prompt |     l_plans pls_integer;
prompt |  begin
prompt |     l_plans := dbms_spm.alter_sql_plan_baseline (
prompt |        sql_handle       => 'SQL_8a9d1f0629e71635',
prompt |        plan_name        => 'SQL_PLAN_8p78z0snyf5jped79ade2',
prompt |        attribute_name   => 'fixed',
prompt |        attribute_value  => 'YES'
prompt |     );
prompt |  end;
prompt |  /
prompt |
prompt |
prompt |  declare
prompt |     l_plans pls_integer;
prompt |  begin
prompt |     l_plans := dbms_spm.alter_sql_plan_baseline (
prompt |        sql_handle       => 'SQL_8a9d1f0629e71635',
prompt |        plan_name        => 'SQL_PLAN_8p78z0snyf5jped79ade2',
prompt |        attribute_name   => 'fixed',
prompt |        attribute_value  => 'NO'
prompt |     );
prompt |  end;
prompt |  /
prompt |
prompt |
