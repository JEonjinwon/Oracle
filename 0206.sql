
		SELECT 
			A.PAY_EXCPECT,
			B.SFUND_VALUE,
			A.PAY_CHECK,
			A.PAY_DIVISION ,
            A.PAY_NUMBER
		FROM PAY_TUITION A, SCHAR_FUND B
		WHERE A.MEM_ID = '1911005'
		  AND A.PAY_NUMBER ='1'
		  AND B.SFUND_STUDENT =A.MEM_ID 
		  AND A.SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
          AND A.SMST = B.SFUND_SMST
          ;
          
          SELECT A.PAY_EXCPECT,
                   
                    A.PAY_CHECK,
                    A.PAY_DIVISION ,
                    A.PAY_NUMBER
          FROM PAY_TUITION A ,  SCHAR_FUND B
          WHERE A.MEM_ID='1911005'
           AND A.SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
          
          
          ;
          
          
          
          
          
          
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
                 AND B.PAY_DIVISION ='Y'	
              )X)Y
              
              
              ;
              
              SELECT COUNT(DISTINCT(MEM_NAME))
  FROM MEMBER A, PAY_TUITION B
   WHERE A.MEM_TYPE = 'ROLE_STUDENT'
                AND A.MEM_ID = B.MEM_ID
                  AND B.PAY_CHECK ='A'
                  AND B.PAY_DIVISION ='Y'	
;

SELECT DISTINCT(B.CODE_NAME)
	FROM DEPARTMENT A, CODE B 
	WHERE A.COL_CODE = B.CODE;
    
    
    SELECT COUNT(DISTINCT(MEM_NAME))
  FROM MEMBER A, PAY_TUITION B, DEPARTMENT C
   WHERE A.MEM_TYPE = 'ROLE_STUDENT'
                AND A.MEM_ID = B.MEM_ID
                  AND B.PAY_CHECK ='A' 
                   AND C.DEP_NO = A.DEP_NO;
                   
    
    SELECT SUB_CODE
    FROM LECTURE 
    WHERE MEM_ID='120003'
    
    ;               
                   
                   
 SELECT B.SUB_NAME 
 FROM LECTURE A, SUBJECT B  
 WHERE MEM_ID='120003'
 AND A.SUB_CODE = B.SUB_CODE
 AND A.LEC_SMST =  (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
 ;
                   
                   
SELECT A.LEC_CODE
 FROM LECTURE A, SUBJECT B  
 WHERE B.SUB_NAME='한국문학과사회'
 AND A.SUB_CODE = B.SUB_CODE
 AND A.MEM_ID='120003'
 AND A.LEC_SMST =  (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
 ;
                           
                   
SELECT 한국문학과사회             
                   
                   
      ;
      
      
      
      
      UPDATE subject
    SET
      
        subCredit = '',
        subDetail =''
WHERE
    sub_code = ''
   
      
      
    SELECT SUB_CODE 
    FROM SUBJECT
    WHERE SUB_NAME ='한국문학과사회'
      
      ;
SELECT A.LEC_CODE 
FROM LECTURE A, SUBJECT B 
WHERE B.SUB_NAME='no' 
AND A.SUB_CODE = B.SUB_CODE 
AND A.MEM_ID='120003' 
AND A.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00') 
      ;
      
      
      
      
      
UPDATE lecture
    SET
        lecFull = b,
        lecGrd='',
        lecMbk='',
        lecSbk='',
WHERE
    lec_code =:v0
    
    
    
    
    ;
    
    SELECT A.LEC_CODE FROM LECTURE A, SUBJECT B WHERE B.SUB_NAME='no' AND A.SUB_CODE = B.SUB_CODE 
AND A.MEM_ID='120003' AND A.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00') 
   ;
      
      
      
      
      
                   ;