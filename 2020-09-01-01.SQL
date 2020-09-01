2020-09-01)
3-2 for 문을 이용한 cursor
    (사용형식)
    
    for 레코드명 in(subquery) loop
        처리문;
    end loop;
    - subquery : 커서역활을 하는 sql
예) 키보드로 직업을 입력 받아 해당 직업을 가진 회원의 이름, 직업, 마일리지를 출력하는 커서를 for문을 이용하여 작성 
ACCEPT P_JOB PROMPT '직업 : '
DECLARE
 V_JOB MEMBER.MEM_JOB%TYPE;
 
 CURSOR CUR_MEM_JOB IS 
    SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
      FROM MEMBER
     WHERE MEM_JOB ='&P_JOB';
BEGIN
  FOR REC_MEM IN CUR_MEM_JOB LOOP
    DBMS_OUTPUT.PUT_LINE('회원명 : '||REC_MEM.MEM_NAME);
    DBMS_OUTPUT.PUT_LINE('직업 : '||REC_MEM.MEM_JOB);
    DBMS_OUTPUT.PUT_LINE('마일리지 : '||REC_MEM.MEM_MILEAGE);
    END LOOP;
END;



** INLINE_FOR

ACCEPT P_JOB PROMPT '직업 : '
DECLARE
 
 CURSOR CUR_MEM_JOB IS 
    SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
      FROM MEMBER
     WHERE MEM_JOB ='&P_JOB';
BEGIN
  FOR REC_MEM IN
                ( SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
                    FROM MEMBER
                    WHERE MEM_JOB ='&P_JOB')
    LOOP
    DBMS_OUTPUT.PUT_LINE('회원명 : '||REC_MEM.MEM_NAME);
    DBMS_OUTPUT.PUT_LINE('직업 : '||REC_MEM.MEM_JOB);
    DBMS_OUTPUT.PUT_LINE('마일리지 : '||REC_MEM.MEM_MILEAGE);
    END LOOP;
END;


