2020-08-31-02)
반복문
    - PL/SQL의 반복문에는 LOOP, WHILE, FOR문이 제동
    1)LOOP문 
        - 반복문의 기본구조
        (사용형식)
        LOOP
            반복처리문;
            EXIT WHEN 조건; --조건이 맞으면 빠져나간다 JAVA의 break와 비슷
        END LOOP;   
        - '조건'이 참(TRUE)이면 반복을 벗어난다. 
        
예) 단을 입력받아 해당 구구단 출력 
ACCEPT P_BASE PROMPT '단 (2~9) 입력 : '
DECLARE 
    V_BASE NUMBER := TO_NUMBER('&P_BASE');
    V_CNT NUMBER := 1;
BEGIN 
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_BASE || ' * '||V_CNT||' = '||V_BASE*V_CNT);
    EXIT WHEN V_CNT =9;
    V_CNT := V_CNT+1;
    END LOOP;
 END;   
        
예) 1~50 사이의 FIBONACCI NUMBER를 구하라
DECLARE
    V_NUM1 NUMBER := 1;
    V_NUM2 NUMBER := 1;
    V_NUM NUMBER := 0;       --피보나치 수가 저장될  공간
    VP_NUM NUMBER := 0;      -- 이전 수
    VPP_NUM NUMBER := 0;    --전전 수 
BEGIN 
    V_RESULT:=TO_CHAR(V_NUM1)|| ', '|| TO_CHAR(V_NUM2)||', '||;
     VP_NUM := V_NUM2;
    VPP_NUM := V_NUM1;
LOOP
    V_NUM : VP_NUM +VPP_NUM;
    EXIT WHEN V_NUM>=50;    
    V_RESULT:=TO_CHAR(V_NUM)|| ', '||;
    VPP_NUM :=VP_NUM;
    VP_NUM := V_NUM;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
 END;       
        
예) 회원테이블에서 마일리지가 4000이상인 회원의 이름, 직업, 마일리지를 구하는 커서를
    생성하고 커서결과를 처리할 때 성별을 구별하여 '여성회원', '남성회원'을 출력하시오 
      
DECLARE 
  V_NAME MEMBER.MEM_NAME%TYPE;
  V_JOB MEMBER.MEM_JOB%TYPE;
  V_MILE MEMBER.MEM_MILEAGE%TYPE;
  V_GENDER VARCHAR2(30);
  V_ID CHAR(1);
  CURSOR CUR_MEM2 IS
     SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
       FROM MEMBER
      WHERE MEM_MILEAGE >= 3000;
BEGIN 
  OPEN CUR_MEM2;
  LOOP
    FETCH CUR_MEM2 INTO V_NAME, V_JOB, V_MILE;
    EXIT WHEN CUR_MEM2%NOTFOUND;
      SELECT SUBSTR(MEM_REGNO2,1,1) INTO V_ID
        FROM MEMBER 
       WHERE MEM_NAME = V_NAME;
    IF V_ID = '1' OR V_ID = '3' THEN 
      V_GENDER := '남성회원';
    ELSE 
      V_GENDER := '여성회원';
    END IF;
      DBMS_OUTPUT.PUT_LINE('회원명 : '||V_NAME);
      DBMS_OUTPUT.PUT_LINE('성별 : '||V_GENDER);
      DBMS_OUTPUT.PUT_LINE('직업 : '||V_JOB);
      DBMS_OUTPUT.PUT_LINE('마일리지 : '||V_MILE);
      DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;
      DBMS_OUTPUT.PUT_LINE('회원수 : '||CUR_MEM2%ROWCOUNT);
      CLOSE CUR_MEM2;
END;
    
    
    
 2) WHILE 문 
    - 다른 애플리케이션 개발언어의 WHILE문과 같은 기능 제공
    (사용형식)
    WHILE 조건
        LOOP
            반복처리문;
    END LOOP;
    - 조건이 참(true)이면 반복 수행하고 거짓(false)이면 반복문을 벗어난다.
예) 구구단 7단 출력
DECLARE 
    V_CNT NUMBER :=0;
    V_RESULT VARCHAR2(50);
BEGIN
    WHILE V_CNT < 9 LOOP
    V_CNT:=V_CNT+1;
    V_RESULT :='7 * ' ||V_CNT||'='|| V_CNT*7;
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
  END LOOP;  
   END;     
        
예) 사원테이블에서 사원명, 부서명, 직책명을 추출하는 커서를 생성하고 출력하는 PL/SQL을 작성하시오.
예) 사원테이블에서 부서코드 50번 부서의 사원명, 부서명, 직책명을 추출하는 커서를 생성하고 사원수를 출력하는 PL/SQL을 작성하시오

DECLARE 
  V_EMP_NAME EMPLOYEES.EMP_NAME%TYPE;
  V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
  V_JOB_NAME JOBS.JOB_TITLE%TYPE;
  CURSOR CUR_EMP02 IS 
    SELECT A.EMP_NAME, B.DEPARTMENT_NAME, C.JOB_TITLE
      FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
       AND A.JOB_ID = C.JOB_ID
       AND A.DEPARTMENT_ID = 50;
BEGIN
  OPEN CUR_EMP02;
  FETCH CUR_EMP02 INTO V_EMP_NAME, V_DEPT_NAME, V_JOB_NAME;
  WHILE CUR_EMP02%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('사원명 : '||V_EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('부서명 : '||V_DEPT_NAME);
    DBMS_OUTPUT.PUT_LINE('직책명 : '||V_JOB_NAME);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
    FETCH CUR_EMP02 INTO V_EMP_NAME, V_DEPT_NAME, V_JOB_NAME;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('사원수 : '||CUR_EMP02%ROWCOUNT);
    CLOSE CUR_EMP02;
 END;
  
3-1. 일반 FOR문 
    -다른 애플리케이션 개발언어의 FOR문의 역할 
    (사용형식)
    FOR 인덱스 IN (REVERSE) 초기값..최종값 
        LOOP 
            반복처리문;
    END LOOP;       
    - 인덱스는 선언하지 않아도 된다.
 예) 구구단 7단을 출력
 DECLARE 
    V_BASE NUMBER :=7;
    V_RESULT VARCHAR2(30);
  BEGIN 
    FOR I IN 1..9 LOOP
    V_RESULT := V_BASE||' * '||I||' = '||V_BASE*I;
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
    END LOOP;
    END;
        
   3-2. CURSOR를 사용한 FOR 문 
   (사용형식) 
   FOR 레코드명 IN 커서명 LOOP 
        커서 처리문;
    END LOOP;
  - 커서의 OPEN, FETCH, CLOSE문을 생략  
  - 커서의 컬럼명은 '레코드명.컬럼명'으로 참조 
  - 레코드명은 시스템에서 제공 (선언이 불필요)
        
예) 사원테이블에서 사원명, 부서명, 직책명을 추출하는 커서를 생성하고 출력하는 PL/SQL을 작성하시오.
 DECLARE 
    CURSOR CUR_EMP03 IS 
      SELECT A.EMP_NAME AS ENAME,
                B.DEPARTMENT_NAME AS DNAME,
                C.JOB_TITLE AS JNAME
      FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
       AND A.JOB_ID = C.JOB_ID
       AND A.DEPARTMENT_ID = 50;
  BEGIN 
    FOR REC_EMP IN CUR_SOR03 LOOP
        DBMS_OUTPUT.PUT_LINE('사원명 : '||REC_EMP.ENAME);
        DBMS_OUTPUT.PUT_LINE('부서명 : '||REC_EMP.DNAME);
        DBMS_OUTPUT.PUT_LINE('직책명 : '||REC_EMP.JNAME);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('사원수 : '||CUR_EMP03%ROWCOUNT);
    END;
        
        
        
        
        
        
        
        
        
        
        