SELECT Y.* 
FROM( 

SELECT ROWNUM AS boNo, X.*
FROM( 
SELECT DISTINCT(A.MEM_NAME), A.MEM_ID 
FROM 
MEMBER A, PAY_TUITION B WHERE A.MEM_TYPE = 'ROLE_STUDENT' AND A.MEM_ID = B.MEM_ID AND B.PAY_CHECK 
='A' AND B.PAY_DIVISION ='Y'
)X)Y 
WHERE boNo BETWEEN 1 AND 5



;



SELECT PAY_IMP
  FROM PAY_TUITION
 WHERE MEM_ID = '2051001'
   AND (
         SELECT SPLAN_CODE 
           FROM SCHEDULE_PLAN
          WHERE SYSDATE BETWEEN TO_CHAR(SPLAN_START, 'YYYYMMDD') AND TO_CHAR(SPLAN_END, 'YYYYMMDD') 
            AND SPLAN_CODE LIKE '%DIV%'
       ) = (
          SELECT SPLAN_CODE
            FROM SCHEDULE_PLAN
           WHERE SYSDATE between to_CHAR(SPLAN_START, 'YYYYMMDD') and to_CHAR(SPLAN_END, 'YYYYMMDD')
             AND SPLAN_CODE LIKE '%DIV%' )
  AND PAY_NUMBER = (SELECT MAX(PAY_NUMBER)
                      FROM PAY_TUITION
                     WHERE MEM_ID = '2051001'
                       AND PAY_IMP IS NOT NULL
        )
        
        
        ;
        
        
        
