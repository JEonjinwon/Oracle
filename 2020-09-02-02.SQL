2020-09-02-03)
PACKAGE
    - 논리적 연관성이 있는 PL/SQL의 변수, 상수, 커서, 예외, 함수, 프로시져 등을 묶어 놓은 객체 
    - 함수, 프로시져와 다른점
1) 모듈화 기능 제공
    - 업무 연관성이 존재하는 함수, 프로시져 등 서브프로그램을 묶어 처리하기때문에 모듈화 가능 
    ex) 사원들에 관한업무(등록, 퇴사, 부서이동 등)를 묶어 놓고 필요한 업무만 선별적으로 처리
2) 프로그램 설계 용이성 
    - 패키지는 선언부와 실행부로 나누어 정의 
    - 선언부에서는 장래 사용할 함수, 프로시져, 변수 등의 선언만 담당
3) 캡슐화 가능 
    
    1. 패키지 선언부
        - 패키지의 스펙 정의
        - 변수, 상수, 예외 및 서브프로그램의 선언 
    (사용형식)
    CREATE [OR REPLACE] PACKAGE 패키지명
    IS
    변수선언;
    상수선언;
    커서구문;
        FUNCTION 함수명(매개변수 선언)
            RETURN 타입;
            
       PROCEDURT 프로시저명(매개변수 선언);
                        :
    END 패키지명 ;                    
    
 2. 패키지 실행부  
    - 선언부에서 선언된 함수나 프로시져의 구현
    (사용형식)
    CREATE [OF REPLACE] PACKAGE BODY 패키지명
    IS
        변수, 상수,  커서정의 근무;
    FUNCTION 함수명(매개변수 선언)
    RETURN 타입
    IS
        변수, 상수, 커서;
    BEGIN
        SQL 구문;
     END GKATNAUD ;
     
    PROCEDURE 프로시저명 (매개변수 선언)
    IS
      변수, 상수, 커서;
    BEGIN
        SQL 구문;
     END 프로시저명;
   END 패키지명; 
    **패키지 이름은 보통 pg_또는 접미사로 _pkg를 사용 
 예) 사원과 부서 등의 테이블을 사용한 비지니스 로직
     (사원번호를 이용한 이름검색, 신규사원 등로그 퇴직자처리)을 처리하는 패키지 
  (선언부)
  CREATE OR REPLACE PACKAGE em_pkg
  IS
    --사원번호를 이용한 이름 검색 함수 선언
    FUNCTION fn_get_name(P_ID = EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2 --크기 지정 금지
    --신규 사원 등록
    PROCEDURE new_emp_reg(
        P_EMP_NAME EMPLOYEES.EMP_NAME%TYPE,
        P_DATE IN DATE);
    --퇴직 처리
    PROCEDURE ret_emp(
    P_EMP_ID IN  EMPLOYEES.EMPLOYEE_ID%TYPE);
    END;
      
(실행부)
CREATE OR REPLACE PACKAGE BODY em_pkg
 IS
    FUNCTION fn_get_name( P_ID = EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2
IS
    V_EMP_NAME EMPLOYEES.EMP_NAME%TYPE;
 BEGIN
    SELECT EMP_NAME INTO V_EMP_NAME
        FROM EMPLOYEES 
        WHERE EMPLOYEE_ID = P_ID;
        RETURN NVL(V_EMP_NAME,'해당 사원 없음');
    END fn_get_name;
    
    PROCEDURE new_emp_reg(
        P_EMP_NAME EMPLOYEES.EMP_NAME%TYPE,
        P_DATE IN DATE);
IS 
    V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    -- 사원 번호 생성 
SELECT MAX(EMPLOYEE_ID) +1 INTO 
         V_EMP_ID
  FROM EMPLOYEES;
   -- 사원 등록 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, EMP_NAME, HIRE_DATE,SALARY)
    VALUES(V_EMP_ID, P_EMP_NAME, P_DATE,3500)
    COMMIT;
END  new_emp_reg;
--퇴직자 처리 
 PROCEDURE ret_emp(
    P_EMP_ID IN  EMPLOYEES.EMPLOYEE_ID%TYPE)
IS 
    UPDATE EMPLOYEES
        SET RETIRE_DATE = SYSDATE
    WHERE EMPLOYEE_ID = P_EMP_ID;
    COMMIT;
END ret_emp;
END em_pkg;

(실행)
1. 사원번호에 해당하는 사원명 출력 
SELECT em_pkg.FN_GET_NAME(200)
    FROM DUAL;

2. 모든 사원의 사원명 출력 
SELECT EMPLOYEE_ID AS 사원번호,
EM_PKG.FN_GET_NAME(EMPLOYEE_ID) AS 사원명 
FROM EMPLOYEES;

3. 신규사원 등록
EXEC EM_PKG.NEW_emp_reg('홍길동', SYSDATE);
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE EMP_NAME '홍길동';








