        SELECT
		    A.LTIME_START,
		    A.LTIME_END,
		    C.SUB_NAME,
		    A.LTIME_DAY
		FROM LECTURE_TIME A , TAKE_LEC B, SUBJECT C, LECTURE D
			WHERE A.LEC_CODE = B.LEC_CODE
			AND B.LEC_CODE = D.LEC_CODE
			AND D.SUB_CODE = C.SUB_CODE
			AND D.MEM_ID = '120003'
			AND D.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
          ;
          
          
SELECT SUB_CODE FROM SUBJECT WHERE SUB_NAME ='한국문학과사회';
SELECT LEC_CODE FROM LECTURE WHERE SUB_CODE = '10001' AND LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00') AND MEM_ID='120003' ;
SELECT LTIME_START,LTIME_END,LTIME_DAY FROM LECTURE_TIME WHERE LEC_CODE='1000102';






 SELECT A.LTIME_START, A.LTIME_END, C.SUB_NAME, A.LTIME_DAY FROM LECTURE_TIME A , TAKE_LEC B, 
SUBJECT C, LECTURE D WHERE A.LEC_CODE = B.LEC_CODE AND B.LEC_CODE = D.LEC_CODE AND D.SUB_CODE 
= C.SUB_CODE AND B.MEM_ID = '1911005' AND D.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE 
= 'A00')
;


SELECT A.LEC_CODE ,
        A.LEC_GRD,
        B.SUB_NAME,
        C.ROOM_CODE,
        LTIME_START,
        LTIME_END,
        LTIME_DAY
FROM LECTURE A, SUBJECT B, LECTURE_TIME C
WHERE A.SUB_CODE = B.SUB_CODE
AND A.LEC_CODE = C.LEC_CODE
AND A.MEM_ID='120003'
AND A.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')

;











SELECT 
COUNT (A.BO_NO)
FROM BOARD A, MEMBER B
WHERE A.BO_GROUP_CODE ='CYQNA'
AND A.BO_DELETE ='N'
AND A.BO_PARENT IS NULL
AND A.MEM_ID = B.MEM_ID



;


SELECT Y.*
FROM(
    SELECT ROWNUM RNUM,
        X.*
        FROM(
                SELECT 
                        A.LEC_CODE  ,
                        B.SUB_NAME  ,
                        C.MEM_NAME ,
                        A.LEC_FULL  ,
                        A.LEC_NMT ,
                        A.LEC_GRD ,
                        B.SUB_DETAIL ,
                        B.SUB_CREDIT 
                FROM LECTURE A , SUBJECT B, MEMBER C
                WHERE 1=1
                AND A.SUB_CODE = B.SUB_CODE
                AND C.MEM_TYPE ='ROLE_PROFESSOR'
                AND C.MEM_ID = A.MEM_ID
                AND A.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
                AND A.LEC_CODE IN(
                                SELECT LEC_CODE
                                  FROM LECTURE
                                  WHERE LEC_CODE
                                   NOT IN (SELECT A.LEC_CODE
                                              FROM LECTURE A , TAKE_LEC B
                                              WHERE B.MEM_ID = '1911005'
                                              AND A.LEC_CODE = B.LEC_CODE)
                )
        )X)Y
        ;




SELECT COUNT(*)
FROM LECTURE 
WHERE LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
AND LEC_CODE IN(
            SELECT LEC_CODE
              FROM LECTURE
              WHERE LEC_CODE
               NOT IN (SELECT A.LEC_CODE
                          FROM LECTURE A , TAKE_LEC B
                          WHERE B.MEM_ID = '1911005'
                          AND A.LEC_CODE = B.LEC_CODE)
                )            
            ;
            SELECT Y.*
FROM(
    SELECT ROWNUM RNUM,
        X.*
        FROM(        
             SELECT
               DISTINCT(A.MEM_NAME),
              A.MEM_ID 
         FROM MEMBER A, PAY_TUITION B, DEPARTMENT C
           WHERE A.MEM_TYPE = 'ROLE_STUDENT'
             AND A.MEM_ID = B.MEM_ID
             AND B.PAY_CHECK ='A'	
              AND C.DEP_NO = A.DEP_NO
         
           )X)Y;



SELECT DISTINCT( A.DEP_NAME)
FROM DEPARTMENT A, CODE B
	WHERE A.COL_CODE = B.CODE   
    AND B.CODE_NAME='인문대학';

