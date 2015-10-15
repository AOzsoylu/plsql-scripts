set head on echo off verify off feedback off tab off
set pagesize 5000
rem ----------------------------------------------------------------
rem alerts.sql
rem Comments:    Show errors in alert.log from the last n hours.
rem              It works for both UNIX and Windows databases.
rem		 For Oracle 7.3 and higher.
rem	         Check the format of the alert log file before.
rem
rem Required:    * utl_file_dir must contain background_dump_dest
rem              * background_dump_dest parameter must be a complete directory
rem                name, in the form '?/rdbms/log' or '%RDBMS73%' etc
rem ----------------------------------------------------------------
set serverout on
exec dbms_output.enable( 1000000)
DECLARE
  v_sid          v$database.name%TYPE;   /* database */                                      
  v_bdumpdest    v$parameter.value%TYPE; /* directory of alert.log */                      
  v_count        NUMBER;                                                                   
  v_alertname    VARCHAR2(19);           /* name of the alert.log */                                
  v_file_handle  utl_file.file_type;     /* handle tp alert.log */                             
  v_eof          BOOLEAN := false;                                                         
  v_text         VARCHAR2(2000);                                                          
  v_date_try     DATE;                   /* help var. for date line in de alert.log */                       
  v_date         DATE;                   /* keep de date line from alert.log */                              
  v_date_is_new  BOOLEAN;                /* datum to be displayed */                                      
  v_interesting  BOOLEAN := FALSE;       /* relevant content from the alert.log */               
  c_aantal_uren  NUMBER := &1;           /* total hours from the time the contents have to be displayed */
  --
  FUNCTION File_Exists ( plocation IN VARCHAR2, pfilename IN VARCHAR2) RETURN BOOLEAN AS
    v_file_handle   utl_file.file_type;
  BEGIN
    v_file_handle := utl_file.fopen( location => plocation, filename => pfilename, open_mode => 'R' );
    utl_file.fclose( file => v_file_handle);
    RETURN TRUE;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN FALSE;
  END File_Exists;
BEGIN
  SELECT name INTO v_sid FROM v$database;
  SELECT value INTO v_bdumpdest FROM v$parameter
    WHERE name = 'background_dump_dest';
  SELECT COUNT(*) INTO v_count FROM v$version
    WHERE banner LIKE '%Windows%';
  IF v_count = 0 THEN
    IF File_Exists( v_bdumpdest, 'alert_'||v_sid||'.log' ) THEN
      v_alertname := 'alert_'||v_sid||'.log';
    ELSE
      v_alertname := 'alert_'||LOWER(v_sid)||'.log';
    END IF;
  ELSE
    v_alertname := v_sid || 'ALRT.LOG';
  END IF;
  BEGIN
    v_file_handle := utl_file.fopen
                       ( location => v_bdumpdest
                       , filename => v_alertname
                       , open_mode => 'R'
                       );
  EXCEPTION
    WHEN utl_file.invalid_mode THEN
      RAISE_APPLICATION_ERROR( -20001, 'the open_mode string was invalid');
  END;
  WHILE NOT v_eof LOOP
    BEGIN
         utl_file.get_line
         ( file => v_file_handle
         , buffer => v_text
         );
    EXCEPTION
         WHEN NO_DATA_FOUND THEN
            v_eof := TRUE;
         WHEN value_error THEN
            utl_file.fclose_all;
            RAISE_APPLICATION_ERROR
            ( -20001, 'line too long to store in buffer');
         WHEN utl_file.invalid_operation THEN
            utl_file.fclose_all;
            RAISE_APPLICATION_ERROR
            ( -20001, 'file is not open for reading');
         WHEN utl_file.read_error THEN
            utl_file.fclose_all;
            RAISE_APPLICATION_ERROR
            ( -20001, 'OS error occurred during read');
    END;
    IF v_interesting THEN
         IF SUBSTR( v_text, 4, 1) = '-' /* 'ORA-..., PLS-..., etc. */
         THEN
            IF v_date_is_new THEN
               dbms_output.put_line( CHR( 10));
               dbms_output.put_line
               ( INITCAP( TO_CHAR( v_date, 'DY MON DD HH24:MI:SS YYYY')));
            END IF;
            v_date_is_new := FALSE;
            dbms_output.put_line( SUBSTR( v_text, 1, 80));
         END IF;
      END IF;

      BEGIN
         v_date_try := TO_DATE( v_text, 'DY MON DD HH24:MI:SS YYYY');
         IF v_date != v_date_try OR v_date IS NULL
         THEN
            v_date := v_date_try;
            v_date_is_new := TRUE;
            IF v_date > SYSDATE - ( c_aantal_uren / 24) THEN
               v_interesting := TRUE;
            END IF;
         ELSE
            v_date_is_new := FALSE;
         END IF;
      EXCEPTION
         WHEN OTHERS THEN
            NULL; /* There is no date. The file is read further. */
      END;
   END LOOP;

   utl_file.fclose( file => v_file_handle);

EXCEPTION
   WHEN utl_file.invalid_path THEN
      dbms_output.put_line
      ( 'alerts.sql: utl_file.invalid_path encountered. ' ||
        'Check utl_file_dir.'
      );
   WHEN utl_file.invalid_operation THEN
      IF v_bdumpdest LIKE '%$%'
      OR v_bdumpdest LIKE '%?%'
      OR v_bdumpdest LIKE '%\%%' ESCAPE '\'
      THEN
         dbms_output.put_line
         ( 'alerts.sql: Unable to read alert.log because ' ||
           'of background_dump_dest parameter ' || 
           v_bdumpdest || '.'
         );
      ELSE
         dbms_output.put_line
         ( 'alerts.sql: utl_file.invalid_operation encountered.');
      END IF;
END;
/
