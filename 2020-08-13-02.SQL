2020-08-13-02)
문자열 함수
1. INITCAP, LOWER, UPPER
    1) LOWER(c)
    - 주어진c 문자열의 모든 문자를 소문자로 변환하여 반환
    - 주로 비교문에서 사용
예) 사원테이블에서 사원의 이름과 이메일 값을 문자로 변화하여 출력하시오.    
SELECT EMP_NAME AS "사원명 (원래값)",
           EMAIL AS "이메일 (원래값)",
           LOWER (EMP_NAME) AS "사원명 (변환값)",
           LOWER (EMAIL) AS "이메일 (변환값)"
FROM EMPLOYEES;

예) 사원 테이블에서 FAST NAME이 'G'로 시작하는 사원을 조회하시오.
    Alias는 사원명, 부서코드 ,직책코드, 급여
SELECT EMP_NAME AS 사원명,
           DEPARTMENT_ID AS 부서코드,
           JOB_ID AS 직책코드, 
           SALARY AS 급여
FROM EMPLOYEES
WHERE LOWER (SUBSTR(EMP_NAME,1,1)) = 'g';

예) 상품테이블(PROD)에서 분류가 전자제품(P102)에 속한 상품의 수를 출력하세요.
SELECT COUNT(*)
    FROM PROD
WHERE LOWER (PROD_LGU)='p102'; --P102데이터를 찾는데 p102로 사용하여 LOWER로 바꿔줌

예) 사원 테이블의 사원이름을 모두 소문자로 변환하여 저장하시오.
UPDATE EMPLOYEES
    SET EMP_NAME = LOWER(EMP_NAME);
    
SELECT EMP_NAME FROM EMPLOYEES;
ROLLBACK;
COMMIT;

2)UPPER(c)
    - c에  저장된 문자열의 모든 문자를 대문자로 변환
예) 사원테이블의 사원명을 모두 대문자로 변환
UPDATE EMPLOYEES
    SET EMP_NAME = UPPER(EMP_NAME);

3)INITCAP(c)
    - c에 저장된 각 문자의 첫 글자만 대문자로 변환
    - 이름 표기법에 주로 사용
    - 공백이 단어 구별
예) 사원테이블의 이름을 첫글자만 대문자로 변환하시오.    
UPDATE EMPLOYEES
    SET EMP_NAME = INITCAP(EMP_NAME);
    
    
2. CONCAT
    (사용형식)
    CONCAT(c1,c2)
        - c1문자열과 c2문자열을 결합하여 반환
        - '||' 연산자와 같은 기능
예) 회원테이블에서 마일리지가 3000이상인 회원정보를 조회하시오.
    Alise는 회원명, 주민번호, 마일리지, 직업이다.
    단, 주민번호는 XXXXXX-XXXXXXX형식으로 출력하되 CONCAT을 사용할 것
SELECT MEM_NAME AS 회원명,
          CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO02)
          MEM_JOB AS 직업
        
 SUBSTR(c, pos[, len])
    - 주어진 문자열 c에서 pos위치에서 len 갯수 만큼의 문자열을 추출하여 반환
    - pos 값이0인 경우 1로 취급
    - len이 생략되면 pos위치 이후의 모든 문자열을 반환 
    - 가장 많이 사용되는 문자열 함수

예) 회원테이블에서 주민등록번호를 이용하여 여성회원들의 나이를 출력하시오
    Alias는 회원명, 주민번호, 나이, 마일리지
SELECT MEM_NAME AS 회원명,
        MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
        EXTRACT(YEAR FROM SYSDATE) - 
            --1900+TO_NUMBER(SUBSTR(MEM_REGNO1,1,2)) 
            TO_NUMBER('19'||SUBSTR(MEM_REGNO1,1,2)),
            MEM_MILEAGE AS 마일리지
FROM MEMBER
WHERE SUBSTR(MEM_REGNO2, 1,1)='2';

문제] 사원테이블에서 근속년수 15년 이상인 사원들에게 특별 보너스를 지급하려 한다.
        보너스는 급여 * (근속년수/100)이며 소숫첫자리에서 반올림 한다.
        지급액 = 급여 +보너스 
        Alias는 사원명, 부서코드, 입사일, 근속년수, 보너스, 급여, 지급액 
SELECT EMP_NAME AS 사원명,
           EMPLOYEE_ID AS 부서코드,
           HIRE_DATE AS 입사일, 
           EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4) AS 근속년수, 
           ROUND(SALARY*((EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4))/100)) AS 보너스, 
           SALARY AS 급여,
           SALARY +ROUND(SALARY*((EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4))/100))  AS 지급액 
FROM EMPLOYEES
WHERE  SUBSTR(EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4),1,2) >=15 ;



