SELECT ROWNUM+ NVL(MAX(B.PAY_NO),1),
                    A.MEM_ID ,
                    B.SMST,
                    TO_CHAR(C.SPLAN_START,'YYYYMMDD'),
                    TO_CHAR(C.SPLAN_END, 'YYYYMMDD'),
                    D.DEP_FEE 
                    FROM MEMBER A, PAY_TUITION B, SCHEDULE_PLAN C, DEPARTMENT D
                    WHERE A.MEM_ID NOT IN (
                                        SELECT 
                                        B.MEM_ID
                                        FROM MEMBER A, PAY_TUITION B
                                        WHERE A.MEM_TYPE ='ROLE_STUDENT'
                                        AND A.MEM_ID = B.MEM_ID
                                        AND B.SMST =(SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
                                        )
                    AND A.MEM_TYPE='ROLE_STUDENT'
                    AND A.MEM_STATE ='ING'  
                    AND B.SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
                    AND C.SPLAN_CODE = 'PAY'
                    AND  A.DEP_NO = D.DEP_NO
                      AND (SELECT
                            SPLAN_CODE FROM SCHEDULE_PLAN
                            WHERE  SYSDATE between to_CHAR(SPLAN_START, 'YYYYMMDD') and to_CHAR(SPLAN_END, 'YYYYMMDD') 
                            AND SPLAN_CODE ='PAY') = 'PAY'
                    GROUP BY ROWNUM, A.MEM_ID , B.SMST, C.SPLAN_START,C.SPLAN_END,  D.DEP_FEE   , B.PAY_AMOUNT , B.PAY_DIVISION  , B.PAY_NUMBER , B.PAY_CHECK;
                    
                    
                    select * from user_jobs;
                    
                    
                    
                    
                    SELECT
                            SPLAN_CODE FROM SCHEDULE_PLAN
                            WHERE  (
                                        (SYSDATE between to_CHAR(SPLAN_START, 'YYYYMMDD') and to_CHAR(SPLAN_END, 'YYYYMMDD') )
                                        OR (SYSDATE =  to_CHAR(SPLAN_END, 'YYYYMMDD'))
                                        )
                            AND SPLAN_CODE ='PAY'