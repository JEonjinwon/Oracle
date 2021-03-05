    SELECT WEEK, ATTEN_CODE
    FROM ATTENDANCE
    WHERE LEC_CODE='5000102'
    AND MEM_ID ='20'
    ORDER BY 1
    
    
    
    
    
    ;
    
    
    
    
    	SELECT A.MEM_ID
		       , A.MEM_NAME
		       , A.MEM_TEL
		       , A.MEM_REG1
		       , A.MEM_REG2
		       , A.MEM_GRD
		       , B.DEP_NAME
		      
		  FROM MEMBER A INNER JOIN DEPARTMENT B ON(A.DEP_NO = B.DEP_NO)
		             
		  WHERE A.MEM_ID = '2051001'
          
          ;
          
          SELECT
               bo_no,
                bo_title
        FROM
            board
          WHERE BO_NO = (SELECT MAX(BO_NO)
                                  FROM BOARD 
                                  WHERE  bo_group_code = 'CYQNA'
                                  AND bo_secret ='Y'
                                  AND bo_delete ='N'
                                  AND BO_NO  < '70'
                                  )
                                                                  
          ;
          SELECT
               bo_no,
                bo_title
        FROM
            board
          WHERE BO_NO = (SELECT MIN(BO_NO)
                                  FROM BOARD 
                                  WHERE  bo_group_code = 'CYQNA'
                                  AND bo_secret ='Y'
                                  AND bo_delete ='N'
                                  AND BO_NO  > '70'
                                  )
                                                        
          
          
          
          