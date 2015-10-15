alter system set timed_statistics = true;
execute dbms_system.set_sql_trace_in_session( &sid, &serial, TRUE);
