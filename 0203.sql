UPDATE member
    SET
        a = b
WHERE
    mem_id =:v0
    AND   dep_no =:v1
    AND   mem_type =:v2
    AND   mem_pass =:v3
    AND   mem_name =:v4
    AND   mem_reg1 =:v5
    AND   mem_reg2 =:v6
    AND   mem_tel =:v7
    AND   mem_mail =:v8
    AND   mem_zip =:v9
    AND   mem_addr1 =:v10
    AND   mem_addr2 =:v11
    AND   mem_acn =:v12
    AND   mem_bank =:v13
    AND   mem_grd =:v14
    AND   mem_state =:v15
    AND   mem_position =:v16
    AND   mem_admission =:v17
    AND   mem_graduation =:v18
    AND   mem_img =:v19;
    

    
    
SELECT 

A.SMST AS 년도학기,
A.PAY_EXCPECT AS 원납액,
B.SFUND_VALUE AS 장학내역,
(A.PAY_EXCPECT - B.SFUND_VALUE) AS 실납입액,
A.PAY_START  AS 분할납부시작일,
A.PAY_END AS 납부마감일,
A.PAY_CHECK AS 처리상태

FROM PAY_TUITION A , SCHAR_FUND B
WHERE A.SMST = B.SFUND_SMST
        AND A.MEM_ID = '1911005'
        AND B.SFUND_STUDENT =A.MEM_ID 
;





SELECT PAY_AMOUNT FROM PAY_TUITION WHERE MEM_ID = '1911005';

SELECT   SFUND_VALUE FROM SCHAR_FUND WHERE Sfund_Student ='1911005' AND SFUND_SMST = '202101';
    
    
    
    
    
    
    
    
    
    
    
    
    
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
                                                        WHERE TABLE_NAME = 'PAY_TUITION'
                                                        AND COLUMN_NAME = A.COLUMN_NAME
                                                        )
from cols A
WHERE TABLE_NAME = 'PAY_TUITION'
ORDER BY COLUMN_ID;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    