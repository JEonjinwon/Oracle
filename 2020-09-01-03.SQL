2020-09-01-03)
**OUT 매개변수
    - 실행이 BLOCK에 기술 
예) 회원번호를 입력 받아 이름과 직업을 출력하는 프로시져 작성
    (단, 이름과 직업은 OUT 매개변수 사용)
CREATE OR REPLACE PROCEDURE PROC_MEM03(
    P_MEM_ID IN MEMBER.MEM_ID%TYPE,
    P_NAME OUT MEMBER.MEM_NAME%TYPE,
    P_JOB OUT MEMBER.MEM_JOB%TYPE)
   IS
   BEGIN
SELECT  MEM_NAME, MEM_JOB            --넘겨줄거
        INTO  P_NAME, P_JOB                --넘겨주는거 INTO
FROM MEMBER
 WHERE MEM_ID = P_MEM_ID;
END;

DECLARE 
    V_NAME MEMBER.MEM_NAME%TYPE;
    V_JOB MEMBER.MEM_JOB%TYPE;
BEGIN
    --EXEC PROD_MEM02('g001', :V_NAME,:V_JOB);
    --SQL에 코딩단위 LINE
    DBMS_OUTPUT.PUT_LINE('회원명 : '||V_NAME );
    DBMS_OUTPUT.PUT_LINE('직업 : '||V_JOB);
    END;
    
    
    
2020-09-01-04)
사용자 정의 함수 (USER DEFINED FUNCTION)
    - 반환(하나) 값이 있음 
    - 반환되는위치는 함수 호출문의 위치
    - 사용형식은 PROCEDURE와 유사
    (사용형식)
    CREATE [OR REPLACE] FUNCTION 함수명 [(
    매개면수 IN|OUT|INOUT 타입명 [ := default 값],
                            :
    매개면수 IN|OUT|INOUT 타입명 [ := default 값],
    
    RETURN 타입명   --변수명 아니고 타입명
    
    IS| AS 
    BEGIN 
        RETURN 변수 | 값 | 수식 ;  -- 타입명하고 일치해야한다.
    END;
    
 예) 회원번호를 입력받아 나이를 반환하는 함수를 작성하시오 
CREATE OR REPLACE FUNCTION FN_MEM01(
    P_MEM_ID MEMBER.MEM_ID%TYPE)
    RETURN NUMBER   --타입명만 쓴다 크기지정하지 않고 
 IS 
    V_AGE NUMBER :=0; --초기화 반드시 해야한다 않하면 오류
BEGIN
    SELECT EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM MEM_BIR) 
            INTO V_AGE
        FROM MEMBER
      WHERE MEM_ID = P_MEM_ID; 
    EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류발생 : ' || SQLERRM);
        RETURN NULL;     --EXCEPTION 쓸때 써야된다 FUNCTION에서
RETURN V_AGE;    
END;
    
(실행)
SELECT MEM_ID AS 회원명,
        FM_MEM_01(MEM_ID) AS 나이,
        MEM_JOB AS 직업 ,
        MEM_MILEAGE AS 마일리지
    FROM MEMBER
 WHERE    FM_MEM_01(MEM_ID) >=50;
 

    
    
    
    
    
    
    
    
    