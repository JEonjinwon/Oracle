SELECT  case when sum(TO_NUMBER(SYSDATE) - TO_NUMBER(SPLAN_START) ) > 0 
                         then column_name
                         else 0
                      end  sum_of_non_negative
  FROM table_name



;

SELECT NVL2(SPLAN_START, 'NOT NULL','NULL') 
FROM SCHEDULE_PLAN RIGHT OUTER JOIN DUAL
WHERE SPLAN_CODE LIKE '%DIV%'
AND SYSDATE BETWEEN TO_CHAR(SPLAN_START,'YYYYMMDD') AND TO_CHAR(SPLAN_END,'YYYYMMDD')


;

SELECT PAY_NUMBER
,(TO_CHAR(SYSDATE,'YYYYMMDD')-PAY_START) AS PAY_START
,(PAY_END-TO_CHAR(SYSDATE,'YYYYMMDD'))  AS PAY_END
FROM PAY_TUITION
WHERE PAY_NUMBER != '0'
AND MEM_ID ='2051001'
AND  PAY_IMP IS NULL
AND SMST =(SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')

;





INSERT INTO PAY_TUITION (
    PAY_NO,
    MEM_ID,
    SMST,
    PAY_START,
    PAY_END,
    PAY_EXCPECT,
    PAY_NUMBER,
    PAY_DIVISION,
    PAY_CHECK
) VALUES (
    (SELECT NVL(MAX(PAY_NO),1)+1 FROM PAY_TUITION)
  ,'1911007'
  ,(SELECT SMST FROM PAY_TUITION WHERE MEM_ID='1911007' AND PAY_NUMBER='0')
  ,( SELECT TO_CHAR(SPLAN_START, 'YYYYMMDD') FROM SCHEDULE_PLAN WHERE SPLAN_CODE='DIV1')   
  ,( SELECT TO_CHAR(SPLAN_END, 'YYYYMMDD') FROM SCHEDULE_PLAN WHERE SPLAN_CODE='DIV1')    
  ,( SELECT TRUNC(SUM((
                       (SELECT PAY_EXCPECT 
                       FROM PAY_TUITION
                           WHERE MEM_ID='1911007'
                                 AND SMST =(SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
                                   AND PAY_NUMBER = '0'
                                   ) - (
                                        SELECT NVL(SUM(NVL2(SFUND_VALUE, SUM(SFUND_VALUE), 0)),0)
                                          FROM SCHAR_FUND 
                                              WHERE SFUND_STUDENT='1911007'
                                              AND CODE_RESULT ='PAYED'
                                             AND SFUND_SMST =(SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
                                                GROUP BY SFUND_VALUE)
                                     )/3),-5)
                     FROM PAY_TUITION 
                     WHERE MEM_ID='1911007'
                     AND PAY_NUMBER = '0'
                     AND SMST =(SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00'))
  ,'1'
  ,'Y'
  ,'Y'
)





