select CASE
    WHEN NULLABLE='N' AND (DATA_TYPE='VARCHAR2' OR DATA_TYPE='CHAR')
        THEN '@NotBlank'
        WHEN NULLABLE='N' AND DATA_TYPE = 'NUMBER' THEN '@NotNull @Min(0)'
        ELSE '' END
   || DECODE(DATA_TYPE, 'NUMBER', '', '@Size(max='||DATA_LENGTH||')')     
from cols
WHERE TABLE_NAME = 'MEMBER'
ORDER BY COLUMN_ID;





SELECT 
'private '||
    (CASE A.DATA_TYPE
            WHEN 'NUMBER'
            THEN 'long'
            WHEN 'DATE'
            THEN 'Date'
            
            WHEN 'VARCHAR2'
            THEN 'String'
            WHEN 'CHAR'
            THEN 'String'
            ELSE ''
   END 
   ) ||
   ' '||
   LOWER(SUBSTR(A.CAMEL_CASE,1,1))||
   SUBSTR(A.CAMEL_CASE,2)||
   ';' AS RESULT
FROM (
   SELECT
        COLUMN_NAME,
        DATA_TYPE,
        REPLACE(initcap(COLUMN_NAME),'_') AS CAMEL_CASE
        FROM ALL_TAB_COLUMNS
        WHERE TABLE_NAME ='MEMBER'
        ORDER BY COLUMN_ID
        )A;




select CASE WHEN NULLABLE='N' AND (DATA_TYPE='VARCHAR2' OR DATA_TYPE='CHAR')
        THEN '@NotBlank'
        WHEN NULLABLE='N' AND DATA_TYPE = 'NUMBER' THEN '@NotNull @Min(0)'
        ELSE '' END
   || DECODE(DATA_TYPE, 'NUMBER', '', '@Size(max='||DATA_LENGTH||')')     
   ||  ' private '||
   DECODE( DATA_TYPE , 'NUMBER', 'Integer ', 'String ' )||
   LOWER(SUBSTR(  REPLACE(initcap(COLUMN_NAME),'_'),1,1))||
   SUBSTR(  REPLACE(initcap(COLUMN_NAME),'_'),2)||
  ';'
from cols
WHERE TABLE_NAME = 'MEMBER'
ORDER BY COLUMN_ID;




