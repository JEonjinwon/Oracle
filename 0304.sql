 SELECT DISTINCT A.MEM_GRD
				               , A.MEM_NAME
				               , B.DEP_NAME
				               , A.MEM_ID
				               , A.MEM_TEL
				               , A.MEM_IMG
				          FROM MEMBER A INNER JOIN DEPARTMENT B ON (A.DEP_NO = B.DEP_NO)
				                        INNER JOIN CONSULT C ON (A.MEM_ID = C.CST_STUDENT)
					     WHERE A.MEM_ID = '2051001'
					       AND C.CST_ACCPT NOT IN('접수','반려')
                           
                           ;
	
    
    SELECT CST_DATE, CST_CONTENT, CST_TIME, CST_NO, CST_APPTM
		  FROM CONSULT
		 WHERE CST_PROFESSOR = '510001'
		   AND CST_STUDENT = '2051001'
		   AND CST_ACCPT = '승인'
           
           
  ;
					      SELECT DISTINCT( A.MEM_GRD)
				               , A.MEM_NAME
				               , B.DEP_NAME
				               , A.MEM_ID
				               , A.MEM_TEL
				               , A.MEM_IMG
				          FROM MEMBER A INNER JOIN DEPARTMENT B ON (A.DEP_NO = B.DEP_NO)
				                        INNER JOIN CONSULT C ON (A.MEM_ID = C.CST_STUDENT)
					     WHERE A.MEM_ID = '2051001'
					       AND C.CST_ACCPT NOT IN('접수','반려')
  ;         
           
           
           SELECT A.MEM_GRD , A.MEM_NAME , B.DEP_NAME , A.MEM_ID , A.MEM_TEL , A.MEM_IMG , C.CST_NO 
           FROM MEMBER A INNER JOIN DEPARTMENT B ON (A.DEP_NO = B.DEP_NO)
                        INNER JOIN CONSULT C ON (A.MEM_ID = C.CST_STUDENT) 
                        WHERE MEM_ID = '2051001' 
                        AND C.CST_ACCPT NOT IN('접수','반려')
                        
                        
                        ;
                        
                        
SELECT CST_DATE, CST_CONTENT, CST_TIME, CST_NO, CST_APPTM
		  FROM CONSULT
		 WHERE CST_PROFESSOR = '510001'
		   AND CST_STUDENT =  '2051001'
		   AND CST_ACCPT = '승인'
           
           
           ;