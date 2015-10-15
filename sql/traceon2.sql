alter system set timed_statistics = true;
execute dbms_system.set_ev( &sid, &serial, 10046, 12, '');
