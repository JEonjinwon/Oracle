2020-08-20-01
2. AVG
(사용형식)
AVG(expr)
    - expr은 컬럼명이나 수식
    - 그룹핑된 expr에 저장된 값에 대한 평균을 반환
    
예) 사원테이블에서 각 부서별 평균 급여를 구하시오
SELECT DEPARTMENT_ID AS 부서코드,
    ROUND(AVG(SALARY),1) AS  평균급여
    FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;


문제 1) 회원테이블에서 50대 성별  평균마일리지를 구하시오 .

SELECT  SUBSTR(MEM_REGNO2,1,1) AS 성별, 
          ROUND(AVG(MEM_MILEAGE),1) AS 평균마일리지  
FROM MEMBER
WHERE MEM_REGNO1 BETWEEN '620101' AND '711231'
GROUP BY SUBSTR(MEM_REGNO2,1,1) ;
;
문제] 장바구니 테이블에서 2005년 5월 회원별 평균 매출액을 구하시오.
    단, 평균매출액이 100만원이 이상인 회원만 죄화하시오
    ALIAS는 회원번호, 평균매출
SELECT  A.CART_MEMBER AS 회원번호,
           ROUND(AVG(B.PROD_PRICE*A.CART_QTY)) AS 평균매출
FROM CART A, PROD B
WHERE  A.CART_NO LIKE '200505%' 
            AND B.PROD_ID= A.CART_PROD
GROUP BY  A.CART_MEMBER
HAVING ROUND(AVG(B.PROD_PRICE*A.CART_QTY))>=1000000
ORDER BY 2;

문제) 사원테이블에서 부서별 사원들의 평균 근속 년수를 구하고 가장 큰 부서 3개만 출력하시오
SELECT     A.DID AS 부서코드,
            B.DEPARTMENT_NAME AS 부서명,
             ROUND(A.AVGCNT) AS 평균 군속년수
FROM DEPARTMENTS B,(SELECT DEPARTMENT_ID AS DID,
                                AVG(EXTRACT(YEAR FROM SYSDATE) - 
                                EXTRACT(YEAR FROM HIRE_DATE)) AS AVGCNT
                                FROM EMPLOYEES
                                GROUP BY DEPARTMENT_ID
                                ORDER BY 2 DESC) A
WHERE A,DUD=B.DEPARTMENT_ID
AND ROWNUM <=3;

3.COUNT 
(사용형식)
COUNT(*|expr)
    - 쿼리의 결과 내의 행의수를 반환
    - 외부 조인에서는 expr를 사용해야함(*를 사용하면 '0'이 '1'로 반환)

예) 사원테이블에서 부서별 사원수를 조회하시오
SELECT A.DEPARTMENT_ID AS 부서코드,
        B.DEPARTMENT_NAME AS 부서명,
        COUNT(*) AS 사원수 
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID , B.DEPARTMENT_NAME
ORDER BY 1;

예) 회원테이블에서 직업별 회원수와 마일리지 합계를 조회하시오
SELECT MEM_JOB AS 직업 ,
    COUNT(*) AS 회원수,
    SUM(MEM)MULEAGE) AS "마일리지 합계",
    ROUND(AVG(MEM_MILEAGE)) AS 평균마일리지
    FROM MEMBER
    GROUP BY MEM_JOB;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    
 문제 ) 사원테이블에서 현재 재직중인 사원수를 부서별로 조회하시오 
 (퇴직처리)
 SELECT DEPARTMENT_ID AS 부서코드,
        COUNT(*) AS 사원수
    FROM EMPLOYEES 
    WHERE RETIRE_DATE IS NULL  --RETIRE_DATE : 퇴직 날짜  NULL 이면 재직중 
    GROUP BY  DEPARTMENT_ID 
    ORDER BY 1;
    
    ROLLBACK;
    
    
    
    
    
    
    
    
    
    
    
    
















