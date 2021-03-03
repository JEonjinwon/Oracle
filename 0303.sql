create or replace procedure pay_scheduler
is
begin
INSERT INTO PAY_TUITION
(
        PAY_NO
      , MEM_ID
      , SMST
      , PAY_START
      , PAY_END
      , PAY_EXCPECT
)
 SELECT ROWNUM+ 
                    (select NVL(MAX(PAY_NO),1) from pay_tuition),
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
                            WHERE  ((SYSDATE between to_CHAR(SPLAN_START, 'YYYYMMDD') and to_CHAR(SPLAN_END, 'YYYYMMDD'))
                                     OR SYSDATE = to_CHAR(SPLAN_END, 'YYYYMMDD'))
                            AND SPLAN_CODE ='PAY') = 'PAY'
                    GROUP BY ROWNUM, A.MEM_ID , B.SMST, C.SPLAN_START,C.SPLAN_END,  D.DEP_FEE   , B.PAY_AMOUNT , B.PAY_DIVISION  , B.PAY_NUMBER , B.PAY_CHECK;
 commit;
exception
    when others then 
     rollback;
     dbms_output.put_line('에러 발생, 롤백 처리됨');
end;




select * from user_jobs;





SELECT
		    A.LTIME_START,
		    A.LTIME_END,
		    C.SUB_NAME,
		    A.LTIME_DAY
		FROM LECTURE_TIME A , TAKE_LEC B, SUBJECT C, LECTURE D
			WHERE A.LEC_CODE = B.LEC_CODE
			AND B.LEC_CODE = D.LEC_CODE
			AND D.SUB_CODE = C.SUB_CODE
			AND B.MEM_ID ='510001'
			AND D.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')

;

SELECT A.LTIME_START,
        A.LTIME_END, 
        C.SUB_NAME,
        A.LTIME_DAY
FROM LECTURE_TIME A , TAKE_LEC B, SUBJECT C, LECTURE D 
WHERE A.LEC_CODE = B.LEC_CODE 
AND B.LEC_CODE = D.LEC_CODE 
AND D.SUB_CODE = C.SUB_CODE
AND D.MEM_ID = '510001' 
AND D.LEC_SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00') 

rollback
commit