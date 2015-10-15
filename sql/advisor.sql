SELECT task_name, description, status, last_modified
FROM dba_advisor_tasks
WHERE status NOT IN ('COMPLETED')
/
