    
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










    
    
    
    
    
SELECT Y.*
		FROM(
		    SELECT ROWNUM RNUM,
		        X.*
		        FROM(
		                SELECT 
		                        D.LEC_CODE  ,
		                        B.SUB_NAME  ,
		                        C.MEM_NAME ,
		                        A.LEC_FULL  ,
		                        A.LEC_NMT ,
		                        A.LEC_GRD ,
		                        B.SUB_DETAIL ,
		                        B.SUB_CREDIT 
		                                             
		                FROM LECTURE A , SUBJECT B, MEMBER C, INTEREST_LEC D
		                WHERE 1=1
		                AND A.LEC_SMST = '202001'
		                AND A.SUB_CODE = B.SUB_CODE
		                AND C.MEM_TYPE ='ROLE_PROFESSOR'
		                AND C.MEM_ID = A.MEM_ID
		                AND A.LEC_CODE = D.LEC_CODE
		                AND D.MEM_ID = '1911005'
		                AND A.LEC_CODE IN(
		                                SELECT LEC_CODE
		                                    FROM LECTURE
		                                    WHERE LEC_CODE NOT IN (SELECT A.LEC_CODE
                                                                    FROM LECTURE A , TAKE_LEC B
                                                                    WHERE B.MEM_ID = '1911005'
                                                                    AND A.LEC_CODE = B.LEC_CODE)
		                )               
		        )X)Y


UPDATE pay_tuition
    SET
        PAY_DIVISION = 'Y',
        PAY_CHECK = 'A'
WHERE
      mem_id ='1911005'
    AND SMST ='202101'
    ;
   
	SELECT 
			A.PAY_EXCPECT,
			B.SFUND_VALUE ,
			A.PAY_CHECK,
			A.PAY_DIVISION 
		FROM PAY_TUITION A , SCHAR_FUND B
		WHERE MEM_ID = '1911005'
		  AND B.SFUND_STUDENT =A.MEM_ID 
		  AND A.SMST ='202101'

;

    
    
SELECT 
PAY_AMOUNT,
PAY_NUMBER,
TO_CHAR(PAY_DATE,'YYYY-MM-DD')
FROM PAY_TUITION
WHERE
       MEM_ID = '1911005'
        AND SMST ='202101'
        ;



	UPDATE PAY_TUITION
	SET PAY_DIVISION = 'Y',
        PAY_CHECK = 'A'
	WHERE  MEM_ID = '1911005'
	  AND SMST ='202101'


;





SELECT MEM_PASS FROM MEMBER WHERE MEM_ID='1911005'



;



SELECT C.LEC_CODE 
		    , B.SUB_NAME 
		    , (SELECT MEM_NAME FROM MEMBER WHERE MEM_ID = C.MEM_ID) AS MEM_NAME
		    , C.LEC_FULL 
		    , C.LEC_NMT 
		    , C.LEC_GRD 
		    , B.SUB_DETAIL 
		    , B.SUB_CREDIT 
            , C.LEC_SMST
		FROM MEMBER A, SUBJECT B, LECTURE C, TAKE_LEC D
		WHERE D.MEM_ID = '1911005'
		AND D.MEM_ID = A.MEM_ID
		AND D.LEC_CODE = C.LEC_CODE
		AND C.SUB_CODE = B.SUB_CODE
        AND C.LEC_SMST = '202001' ;



	SELECT
		    A.LTIME_START,
		    A.LTIME_END,
		    C.SUB_NAME,
		    A.LTIME_DAY
		FROM LECTURE_TIME A , TAKE_LEC B, SUBJECT C, LECTURE D
			WHERE A.LEC_CODE = B.LEC_CODE
			AND B.LEC_CODE = D.LEC_CODE
			AND D.SUB_CODE = C.SUB_CODE
			AND B.MEM_ID = '1911005'
			AND D.LEC_SMST = '202001'


;
SELECT * FROM CODE WHERE GROUP_CODE_NAME = '학부코드'
;
SELECT * FROM  DEPARTMENT ;



SELECT DISTINCT(B.CODE_NAME)
FROM DEPARTMENT A, CODE B 
WHERE A.COL_CODE = B.CODE


;
SELECT A.MEM_NAME, A.MEM_ID 
FROM MEMBER A, PAY_TUITION B
WHERE A.MEM_TYPE = 'ROLE_STUDENT'
AND A.MEM_ID = B.MEM_ID
AND B.PAY_CHECK ='A'

;




