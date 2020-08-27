2020-08-20)
4. MIN, MAX
(사용형식) 
MIN (expr), MAX(expr),
    -주어진 컬럼이나 수식의 값 중 최소(MIN)또는 최대(MAX)값을 찾아 반환
**GREATEST(n1, n2,.......)
    - 주어진 자료 n1~에서 최대값을 반환
 **ㅣLEAST(n1, n2,.......)
    - 주어진 자료 n1~에서 최소값을 반환   
 MAX 예) 오늘이 2005년 7월 28일 이라고 가정하여  장바구니 번호를 생성하시오
 SELECT TO_CHAR (SYSDATE, 'YYYYMMDD') || TRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(CART_NO),9))+1,'00000'))
 FROM CART;
    
    
SELECT MAX(PROD_ID)+1
    FROM PROD
    WHERE PROD_LGU='P101';
    
    
    
    
SELECT  MAX(PROD_ID)   
 FROM PROD
 WHERE PROD_LGU='P101';
 
     SELECT 'P101'
                ||TRIM(TO_CHAR(TO_NUMBER(SUBSTR
                (MAX(PROD_ID),5))+1,'000000'))
      FROM PROD
      WHERE PROD_LGU = 'P101';
 
예) 회원테이블에서 마일리지가 1000미만인 회원을 찾아 마일리지를 1000으로 조정하시오.
SELECT   MEM_ID AS 회원번호,
            MEM_NAME AS 회원이름, 
            MEM_MILEAGE AS 원본마일리지,
            GREATEST(MEM_MILEAGE,1000) AS 마일리지-- GREATEST(A,B) AB중에 큰값 출력
FROM MEMBER;

RPLLUP과 CUBE


SELECT PERIOD,
    REGION,
    SUM(LOAN_
    FROM KOR)LOAN)STATUS
    GROUP BY PRIOD,REGION
    ORDER BY 2;
    
1.ROLLUP
    - 기본 집계합수에서 제공하지 않는 부분별 소계를 제공
    - GROUP BY 절에 사용
    (사용형식)
    ROLLUP(c1 c2, ..........)
    -명시된 컬럼 (c1 c2, ..........)의 수와 순서 (오른쪽 -> 왼쪽)에 따라 레벨별 집계 결과 반환
    SELECT PERIOD,
    SUM(LOAN_JAN_AMT)
    FROM KOR_LOAN_STATUS
GROUP BY ROLLUP(PERIOD,REGION)
ORDER BY 2;

2. CUBE
    - ROLLUP과 비슷한 개념
    - CUBE는 기술된 모든 컬럼을 조합할 수 있는 모든 가지수(경우의 수) 만큼의 합계를 반환
    - n개의 컬럼이 사용되면 2의 n승 종류 만크의 합계 반환 

예) 대출잔액 테이블에서 기간별, 지역별, 구분별, 대출잔액합계를 조회하시오
(기본 집계 함수)
SELECT PERIOD,
            REGION,
            GUBUN,
            SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY  PERIOD, REGION,  GUBUN;

JOIN
    - RDB의 핵심 기능
    - 조회할 컬럼이 여러개의 테이블에 분산되어 저장된 경우 테이블 사이의 관계(Relatationship)를 이용하여 검색할 때 사용
    - 일반 join과 ansi join으로 구분
1. Cartesian Product
    -모든 행들의 조합을 결과로 반환 
    (ex A 테이블이 100행 20열, B테이블이 2000행 10열로 구성되었다면 A, B테이블의 Cartesian Product 결과는 200000행, 30열로 결과 반환)

예)
1. cart 테이블의 행의 수
SELECT COUNT(*) FROM CART;

2. MEMBER 테이블 행의 수
SELECT COUNT(*) FROM MEMBER;

3. CART와 MEMBER 테이블에 Cartensian Product 수행 시키면
SELECT COUNT(*)
FROM MEMBER, CART;


2. Equi-JOIN
    - 조인 조건에 '=' 연산자를 사용하는 조인 형식
    - 조인 조건은 사용된 테이블의 갯수가 n-1개 이상이어야 한다.
    - 내부 조인이라고도 한다
    - 일치하지 않는 데이터(행) 무시
    -ANSI 형식에서는 INNER JOIN이라고함
    (사용형식 - 일반 JOIN)
    SELECT 컬럼list
    FROM 테이블명 [별칭], 테이블명 [별칭 ],.........................
    WHERE 조인조건1
    [AND 조인조건2]
    [AND 일반조건........]
    

    SELECT 컬럼list
    FROM 테이블명 [별칭]
    INNER JOIN 테이블명 ON(조인조건1 
    [AND 일반조건.]
    [INNER JOIN 테이블명 ON(조인조건1 
    [AND 일반조건.]    
    [WHERE 일반조건]

    
    예) 사원테이블에서 사원정보를 조회하시오
        Alias는 사원번호, 사원명, 부서코드, 부서명
        (일반조인문)
        SELECT EMPLOYEES.EMPLOYEE_ID AS 사원번호,
            EMPLOYEES.EMP_NAME AS 사원명,
            EMPLOYEES.DEPARTMENT_ID AS 부서코드,
            DEPARTMENTS.DEPARTMENT_NAME AS 부서명
        FROM EMPLOYEES, DEPARTMENTS
    WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;    --사장은 조인 조건이 않맞아서 버림 
    
    
    
    
    