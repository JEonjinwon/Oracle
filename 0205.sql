SELECT COUNT(DISTINCT(MEM_NAME))
  FROM MEMBER A, PAY_TUITION B
   WHERE A.MEM_TYPE = 'ROLE_STUDENT'
                AND A.MEM_ID = B.MEM_ID
                  AND B.PAY_CHECK ='A'	;
                  
                  
                  
    SELECT Y.*
FROM(
    SELECT ROWNUM RNUM,
        X.*
        FROM(        
                SELECT
                  DISTINCT(A.MEM_NAME),
                 A.MEM_ID 
            FROM MEMBER A, PAY_TUITION B
              WHERE A.MEM_TYPE = 'ROLE_STUDENT'
                AND A.MEM_ID = B.MEM_ID
                AND B.PAY_CHECK ='A'	
              )X)Y       ;       
              
              
              
              
              
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
                                              WHERE B.MEM_ID = '1910005'
                                              AND A.LEC_CODE = B.LEC_CODE)
                )
        )X)Y

              ;
              
              
              
SELECT SUB_CODE , LEC_CODE
FROM LECTURE
WHERE LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00');
              
              
              
              
              
              
              	SELECT
	            A.LEC_CODE ,
	            B.SUB_DETAIL ,
	            B.SUB_NAME ,
	            B.SUB_CREDIT  ,
	            C.LTIME_DAY ,
	            C.LTIME_START ,
	            C.LTIME_END ,
	            A.LEC_GRD,
	            A.LEC_FULL,
	            C.ROOM_CODE , 
	            D.MEM_NAME ,
	            D.MEM_TEL ,
	            D.MEM_MAIL ,
	            A.LEC_MBK ,
	            A.LEC_SBK 
	FROM LECTURE A,  SUBJECT B, LECTURE_TIME C, MEMBER D
	   WHERE A.LEC_CODE = '1000301'
	   AND A.SUB_CODE = B.SUB_CODE
	    AND A.LEC_CODE = C.LEC_CODE
        AND A.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
	    AND A.MEM_ID = D.MEM_ID
        ;




SELECT 
A.MEM_NAME ,
A.MEM_TEL ,
A.MEM_MAIL 
FROM MEMBER A, LECTURE B
WHERE A.MEM_ID = B.MEM_ID
AND B.LEC_CODE='1000301'
AND B.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
;



SELECT 
A.LTIME_DAY ,
A.LTIME_START ,
A.LTIME_END ,
A.ROOM_CODE
FROM LECTURE_TIME A, LECTURE B
WHERE B.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
AND A.LEC_CODE = B.LEC_CODE
AND B.LEC_CODE='1000301'
;


SELECT
A.SUB_DETAIL,
A.SUB_NAME ,
A.SUB_CREDIT ,
A.SUB_CODE
FROM SUBJECT A, LECTURE B
WHERE B.LEC_CODE = '1000301'
AND A.SUB_CODE = B.SUB_CODE
AND B.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
;
SELECT 
A.LTIME_DAY ,
A.LTIME_START ,
A.LTIME_END ,
A.ROOM_CODE
FROM LECTURE_TIME A, LECTURE B
WHERE B.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
AND A.LEC_CODE = B.LEC_CODE
AND B.LEC_CODE= '4000102'
;
SELECT 
    LEC_CODE,
    LEC_GRD,
    LEC_FULL,
    LEC_MBK,
    LEC_SBK
    SUB_CODE
FROM LECTURE
WHERE LEC_CODE = '1000301'
AND LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00');
      
      
   ;
   
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
			AND D.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
      
      

;

SELECT 
		PAY_AMOUNT,
		PAY_NUMBER,
		TO_CHAR(PAY_DATE,'YYYY-MM-DD') AS PAY_DATE
	FROM PAY_TUITION
	WHERE MEM_ID = #{memId}
	  AND SMST ='202101';



UPDATE PAY_TUITION
    SET
       PAY_CHECK = 'A'
WHERE
    MEM_ID ='1911005'
   







;
SELECT A.PAY_EXCPECT, B.SFUND_VALUE , A.PAY_CHECK, A.PAY_DIVISION FROM PAY_TUITION A , SCHAR_FUND 
B WHERE A.MEM_ID = '1911005' AND A.PAY_NUMBER ='1' AND B.SFUND_STUDENT =A.MEM_ID AND A.SMST 
='202101'




              