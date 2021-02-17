   SELECT B.MEM_ID ,B.MEM_NAME
          FROM TAKE_LEC A, MEMBER B
          WHERE A.LEC_CODE='1000102'
          AND A.MEM_ID = B.MEM_ID;
          
          
          
       
			SELECT MEM_ID, MEM_NAME 
			FROM MEMBER
			WHERE DEP_NO = (SELECT DEP_NO FROM MEMBER WHERE MEM_ID='120003')
			AND MEM_TYPE ='ROLE_STUDENT';
            
            
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
 ||'   //' || (SELECT comments FROM ALL_COL_COMMENTS
                                                        WHERE TABLE_NAME = 'MESSAGE'
                                                        AND COLUMN_NAME = A.COLUMN_NAME
                                                        )
from cols A
WHERE TABLE_NAME = 'MESSAGE'
ORDER BY COLUMN_ID;




commit


INSERT INTO message (
    recipient,
    msg_content,
    msg_time
) VALUES (
    :v0,
    :v1,
    :v2
);

SELECT B.SUB_NAME
FROM LECTURE A, SUBJECT B
WHERE A.SUB_CODE = B.SUB_CODE
AND A.LEC_CODE='1000102'

;

SELECT
    count(*)
FROM
    message;




rollback





DELETE FROM message
WHERE
    AND   msg_num =:v3;




