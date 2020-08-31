2020-08-31-01)
1. IF문 
    - 다른 응용 프로그램언어의 IF문과 같은 기능
    (사용형식) 
    IF 조건 THEN 
        명령1;
    [ELSE 
        명령 2;]
    END IF; 
    
(나열식 IF)
    IF 조건1 THEN
        명령1;
    ELSE 조건2 THEN
        명령2;
    ELSIF 조건3 THEN
        명령3;
    ELSE
        명령4;
    END IF;
(중첩 IF)    
    IF 조건1 THEN
        IF 조건2 THEN
            명령1;
         ELSE 
            명령2;
        END IF;
   ELSE 
        명령3;
   END IF;     
  
 예) 임의의 부서코드(10~110)를 하난 생성하여 해당부서에 속한 사원 정보를 조회하고 
      첫번째 검색된 사원의 급여가 
      3000미만이면 '낮은임금',
      3000~6000 이면 '중간임금'
      그 이상이면 '높은임금'을 출력하시오.
      출력할 데이터는 사원명, 부서명, 급여, 비고이다.
DECLARE --변수 선언부
    V_NAME EMPLOYEES.EMP_NAME%TYPE;
    V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    V_SAL EMPLOYEES.SALARY%TYPE;
    V_REMAK VARCHAR2(50);
    V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE;
BEGIN     
  V_DEPT_ID := ROUND(DBMS_RANDOM.VALUE(10,110),-1); --10부터 100사이에 있는 정수형 난수 발생 ,-1해서 일의자리는 전부 0
SELECT  A.EMP_NAME, B.DEPARTMENT_NAME, A.SALARY INTO V_NAME, V_DEPT_NAME, V_SAL        --INTO : 변수에 넘겨주는 것
    FROM EMPLOYEES A, DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
    AND A.DEPARTMENT_ID = V_DEPT_ID
    AND ROWNUM =1;
    
 IF V_SAL BETWEEN 1 AND 2999 THEN 
    V_REMAK :='낮은임금';
 ELSIF V_SAL BETWEEN 3000 AND 6000 THEN
    V_REMAK :='보통임금';
 ELSE
    V_REMAK :='높은임금';
 END IF;   
  
 DBMS_OUTPUT.PUT_LINE(V_NAME||', '||V_DEPT_NAME ||', '||V_SAL|| '=>'||V_REMAK);  
 
 END;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   