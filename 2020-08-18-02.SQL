2020-08-18-02 집계함수 
    - 데이터를 특정 컬름을 기준으로 같은 값을 갖는 것끼리 그룹화 시키고 이를 기준으로 합(SUM) 평균(AVG) 
        갯수(행의수,COUNT) 최대값(MAX) 최소값(MIN)을 구하는 함수
    - GROUP BY 절이 사용 
    - 집계 함수에 조건이 부여될 경우 HAVING 절 사용  
    - SELECT 절에 기술된 그룹함수가 아닌 일반컬럼은 반드시 GROUP BY 절에 기술되어야 함
    -- ~~별 이면 그룹 바이 사용 한다 생각하면된다.
    - 그룹핑 순서는 GROUP BY절에 기술된 컬럼 중 왼쪽 부터 적용됨
    - SELECT 절에 기술되지 않은 컬럼도 GROUP BY절에 사용 가능
    1. SUM 
    (사용형식)
    SUM(column)
        - 해당 컬럼에 저장된 데이터를 그룹별로 합계를 구하여 반환
예) 사원테이블에서 부서별 급여 합계를 구하시오.
SELECT DEPARTMENT_ID AS 부서코드,
SUM(SALARY) AS 합계

FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
    ORDER BY 1;
    
예) 상품테이블에서 분류별 가격의 합계를 구하시오
    Alias는 분류코드, 상품명, 가격합계
SELECT A.PROD_LGU AS 분류코드, 
            B.LPROD_NM AS 분류명, 
           SUM(A.PROD_PRICE) AS 가격합계
    FROM PROD A, LPROD B;
    WHERE A.PROD_LGU=B.LPROD_GU -- 조인조건
    GROUP BY  A.PROD_LGU, B.LPROD_NM
   ORDER BY 1;




예1) 2005년 5월 회원별, 상품별, 판매수량 합계를 구하시오
    Alias는 회원번호, 상품코드, 판매수량합계
SELECT CART_MEMBER AS 회원번호, 
               CART_PROD AS 상품코드, 
               SUM(CART_QTY) AS 판매수량합계
FROM CART
WHERE CART_NO LIKE '200505%'
GROUP BY CART_MEMBER, CART_PROD
ORDER BY 1;

예1-2)2005년 5월 회원별 판매수량 합계를 구하되 판매수량 합계가 20개 이상인 회원만 조회 
    Alias는 회원번호, 판매수향합계
SELECT CART_MEMBER AS 회원번호, 
          SUM(CART_QTY) AS 판매수량합계
FROM CART
WHERE CART_NO LIKE '200505%'
GROUP BY CART_MEMBER
HAVING SUM(CART_QTY)>=20
ORDER BY 1;













    
    
    
    
    
    