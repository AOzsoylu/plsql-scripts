select 'COMMIT FORCE '''||global_tran_id||''', '''||commit#||''';' from dba_2pc_pending
/
