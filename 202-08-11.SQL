2020-08-11-01)

SELECT 문 사용형식
SELECT *| [DISTINCT] 컬럼명 [AS]["] 컬럼별칭["],

FORM 테이블명 [테이블 별칭], [.........]
[WHERE 조건 [AND | OR 조건 ] ...........]
[GROUP BY 컬럼명 [, 컬럼명 , ...............]
[HAVING 조건] 
[ORDER BY 컬럼명 | 컬럼 INDEX, .......];

1. 조건
1)관계 연산자를 사용하여 조건문 구성
        개발언어의 if문에 사용되는 조건문과 동일
        >, <, >=, <=, !(<>), = 사용
2)논리 연산자 (NOT(!), AND, OR)
        복수개의 조건문을 구성
3)기타 연산자
        ANY, SOME, IN, ALL, EXISTS 등이 제공됨
        
예)회원테이블 (MEMBER)에서 출생년도가 1973년도 이후 출생한 회원을 조회하시오
    단,Alias는 회원 번호, 회원명, 주민등록번호이다.
    SELECT MEM_ID AS 회원번호, 
               MEM_NANE AS 회원명,
               MEM_REGNO1||'_'||MEM_REGNO2 AS 주민등록번호 -- ||는 자바의 +이다. 문자열 결합할때 사용
    FROM MEMBER
    WHERE SUBSTR(MEM)REGNO1, 1, 2) >='73'
               
예) 사원테이블 (EMPLOYEES)에서 급여(SALARY)가 5000이상이고
    부서코드 (DEPARTMENT_ID)가80번인 사원을 조회하시오
    단,Alias는 사원 번호, 사원명, 부서코드, 급여 , 전화번호이다.
SELECT EMPLOYEE_ID AS 사원번호, 
        EMP_NAME AS 사원명,
        DEPARTMENT_ID AS 부서코드,
        SALARY AS 급여,
        PHONE_NUMBER AS 전화번호
    FROM EMPLOYEES 
 WHERE SALARY >=5000
    AND DEPARTMENT_ID=80;
    
예)사원테이블에서 30,40,60번 부서에 속한 사원정보를 조회하시오
    단, Alias는 사원명, 부서코드, 부서명, 직무명
select A.EMP_NAME AS 사원명, 
           A.DEPARTMENT_ID AS 부서코드, 
           B.DEPARTMENT_NAME AS 부서명,
           C.JOB_TITLE AS 직무명
     FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
    WHERE (A.DEPARTMENT_ID = 30
       OR A.DEPARTMENT_ID = 40
       OR A.DEPARTMENT_ID = 60)
      AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
      AND A.JOB_ID = C.JOB_ID;
    
IN연산자 
    컬럼 값이 복수개로 주어진 값 중 어느 하나와 일치하면 전체가 참(TRUE)을 반환
(사용형식) 
    컬럼명(표현식) IN (값1, 값2, ........)
    -OR 연산자로 변환 가능 
    
 select A.EMP_NAME AS 사원명, 
           A.DEPARTMENT_ID AS 부서코드, 
           B.DEPARTMENT_NAME AS 부서명,
           C.JOB_TITLE AS 직무명
     FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
    WHERE A.DEPARTMENT_ID IN(30, 40, 60) 
    --  WHERE (A.DEPARTMENT_ID = 30 
    --OR A.DEPARTMENT_ID = 40
    -- OR A.DEPARTMENT_ID = 60) 를 IN으로 줄인다
      AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
      AND A.JOB_ID = C.JOB_ID;   
    
 ANY 연산자 
    컬럼 값이 복수개로 주어진 값 중 어느 하나와 일치하면 전체가 참(TRUE)을 반환
(사용형식) 
    컬럼명(표현식) 관계연산자 ANY | SOME (값1, 값2, ........)
    -OR 연산자로 변환 가능 
    -IN 연산자로 변환 할 때 관계연산자는 생략
   
 select A.EMP_NAME AS 사원명, 
           A.DEPARTMENT_ID AS 부서코드, 
           B.DEPARTMENT_NAME AS 부서명,
           C.JOB_TITLE AS 직무명
     FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
    WHERE A.DEPARTMENT_ID =ANY(30, 40, 60) 
    --  WHERE (A.DEPARTMENT_ID = 30 
    --OR A.DEPARTMENT_ID = 40
    -- OR A.DEPARTMENT_ID = 60) 를 ANY으로 줄인다
      AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
      AND A.JOB_ID = C.JOB_ID;    
   
   
   
   
   
               