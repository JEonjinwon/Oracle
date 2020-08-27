2020-08-21-01)
예) 메입테이블에서 2005년 3월 거래처별 매입현황을 종료하시오
    Alias는 거래처, 거래처명, 매입금액합계
    (일반조인)
    SELECT B.BUYER_ID AS 거래처코드,
               B.BUYER_NAME AS 거래처명,
               SUM(A.BUY_QTY*A.BUY_COST) AS 매입금액합계
          FROM BUYPROD A, BUYER B, PROD C
         WHERE BUY_DATE BETWEEN TO_DATE('20050301') 
               AND TO_DATE('20050331')
               AND A.BUY_PROD = C.PROD_ID
               AND C.PROD_BUYER = B.BUYER_ID
      GROUP BY B.BUYER_ID, B.BUYER_NAME
      ORDER BY 1;
    
    
    SELECT B.BUYER_ID AS 거래처,
            B.BUYER_NAME AS 거래처명, 
             SUM(A.BUY_COST*A.BUY_QTY) AS 매입금액 합계
    FROM BUYPROD A
    INNER JOIN PROD C ON(A.BUY_PROD = C.PROD_ID)
    INNER JOIN BUYER B ON(C.PROD_BUYER = B.BUYER_ID)
    WHERE B.BUY_DATE BETWEEN TO_DATE('20050301') AND TO_DATE('20050331')
    GROUP BY B.BUYER_ID, B.BUYER_NAME
    ORDER BY 1 ;    
    
예) 2005년 5월 상품별 매입/ 매출 정보를 조회하시오 
    Alias는 상품코드, 상품명, 매입수량, 매출수량
    SELECT  C.PROD_ID   AS 상품코드, 
                C.PROD_NAME  AS 상품명, 
                SUM(B.BUY_QTY)  AS 매입수량, 
                SUM(A.CART_QTY)  AS 매출수량
    FROM CART A, BUYPROD B, PROD C
    WHERE B.BUY_PROD = C.PROD_ID 
               AND C.PROD_ID = A.CART_PROD
               AND A.CART_NO LIKE '200505%'
               AND B.BUY_DATE BETWEEN TO_DATE('20050301') 
               AND TO_DATE('20050331')
    GROUP BY C.PRPD_ID, C.PROD_NAME
    ORDER BY 1;
    
SELECT A.PROD_ID AS 상품코드,
        A.PROD_NAME AS 상품명,
        NVL(B.INAMT,0) AS 매입수량,
        NVL(C.OUTAMT,0) AS 매출수량
   FROM PROD A,
        (SELECT BUY_PROD AS BID, -- 별칭은 이제 위 셀렉트에서 사용 가능
                SUM(BUY_QTY) AS INAMT
           FROM BUYPROD
          WHERE BUY_DATE BETWEEN '20050501' AND '20050531'
          GROUP BY BUY_PROD) B,
        (SELECT CART_PROD AS CID, -- 별칭은 이제 위 셀렉트에서 사용 가능
                SUM(CART_QTY) AS OUTAMT
           FROM CART
          WHERE CART_NO LIKE '200505%'
          GROUP BY CART_PROD) C
   WHERE A.PROD_ID=B.BID(+)
     AND A.PROD_ID=C.CID(+)
   ORDER BY 1;    
    
    
    
SEMI 조인
    - 세미조인은 서브쿼리를 사용하여 서브쿼리에 존재하는 데이터만 메인쿼리에서 추출하는 조인 
    - EXISTS 연산자가 사용됨 
    예) 사원테이블에서 급여가 8000이상인 사원이 있는 부서를 조회하시오
    Alias는 부서코드, 부서명, 상위부서코드
    SELECT  A.DEPARTMENT_ID AS 부서코드, 
        A.DEPARTMENT_NAME AS 부서명, 
        A.PARENT_ID AS 상위부서코드
    FROM  DEPARTMENTS A
  WHERE DEPARTMENT_ID IN(SELECT B.DEPARTMENT_ID
                         FROM EMPLOYEES B
                       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                       AND B.SALARY>8000)
  ORDER BY 1;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    