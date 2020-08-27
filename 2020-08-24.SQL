2020-08-24-01
3. 안티조인(anti join)
    - 서브쿼리가 사용되는 조인
    - 서브쿼리의 결과에는 없고 메인쿼리에만 존재하는 데이터만 추출하는 조인
    - NOT IN, NOT EXISTS연산자 사용
예) 부서테이블에서 관리사원번호(MANAGER_ID)가 NULL이 아닌 부서에 속한 사원의
    사원번호, 사원명, 부서코드, 부서명을 출력
SELECT A.EMPLOYEE_ID AS 사원번호,
       A.EMP_NAME AS 사원명,
       B.DEPARTMENT_ID AS 부서코드,
       B.DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES A, DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.DEPARTMENT_ID NOT IN
       (SELECT DEPARTMENT_ID
        FROM DEPARTMENTS
        WHERE MANAGER_ID IS NOT NULL);
4. 셀프조인(SELF JOIN)
    - 하나의 테이블을 마치 다른 테이블인것처럼 별도의 별칭을 부여하여 조인하는 형식

    
예) 회원테이블에서 회원번호 'c001'회원의 마일리지보다 많은 마일리지를 보유한 회원정보를 조회하시오.    
    Alias 회원번호, 회원명, 마일리지     --LOWER : 소문자, UPPER : 대문자
    SELECT B.MEM_ID, 
            B.MEM_NAME, 
            B.MEM_MILEAGE
    FROM MEMBER A, MEMBER B
    WHERE A.MEM_ID='c001'   
        AND A.MEM_MILEAGE< B.MEM_MILEAGE;
        
외부조인(OUTER JOIN)
    - 내부조인에서는 조인조건에 일치하지 않는 자료는 무시함
    - 외부조인은 부족한 테이블에 NULL값을 채워 조인 수행
    - 일반 외부조인형식에서는 외부 조인연산자는 '(+)'이다.
    - 조인조건에서 자료의 종류가 부족한쪽에 외부조인연산자 사용
    (주의사항)
    - 외부조인 조건에 해당하는 조인조건 모두에 '(+)'을 사용해야 한다.
    - 한번에 한테이블에서만 외부조인을 할 수 있다. 
        즉, A,B,C테이블이 있고 A를 기준으로 B테이블을 외부조인한 경우 동시에 C를 기준으로
        B테이블을 외부조인 할 수 없다.
        WHERE A.COL=B.COL(+)
            AND C.COL=B.COL(+)은 허용되지 않음
    - (+)연산자가 사용된 조건과  OR연산자 IN연산자는 함께 사용할 수 없다.            
    - 일반 외부조인연산자와 일반조건이 함께 사용되면 정확한 결과를 얻을 수 없다. --서브쿼리나 ANISI 외부조인을 사용해야함.    
    (일반외부조인 사용형식)
    SELECT 컬럼LIST
        FROM 테이블명 [별칭], 테이블명 [별칭],..............
       WHERE [별칭.] 컬럼명 [(+)] = [별칭.] 컬럼명 [(+)] 
        AND [별칭.] 컬럼명 [(+)] = [별칭.] 컬럼명 [(+)] 
    (ANSI외부조인 사용형식)
     SELECT 컬럼LIST
        FROM 테이블명 [별칭]
        FULL|RIGHT|LEFT [OUTER] JOIN 테이블명 [별칭]
                ON(조인조건[AND 일반조건])
        [WHERE 일반조건]        
       
 예) 모든 상품분류별 상품의 가지수를 조회하시오
    분류코드, 분류명, 상품수
    (분류테이블) 
    SELECT * FROM LPROD;
    (상품테이블에서 사용된 분류코드를 중복없이 검색)
    SELECT DISTINCT PROD_LGU
    FROM PROD
    ORDER BY 1;
       
       
 SELECT B.LPROD_GU AS 분류코드,
        B.LPROD_NM AS 분류명,
        NVL(COUNT(A.PROD_ID),0) AS 삼품수
  FROM PROD A, LPROD B      
  WHERE A.PROD_LGU(+) = B.LPROD_GU
  GROUP BY B.LPROD_GU , B.LPROD_NM;     
       
 SELECT B.LPROD_GU AS 분류코드,
        B.LPROD_NM AS 분류명,
        NVL(COUNT(A.PROD_ID),0) AS 삼품수
  FROM PROD A
  RIGHT OUTER JOIN LPROD B
    ON(A.PROD_LGU = B.LPROD_GU)
    GROUP BY B.LPROD_GU, B.LPROD_NM
    ORDER BY 1;
       
       
 예) 메입테이블에서 2005년 1~3월에 매입정보를 이용하여 전체 상품에 대한 매입정보를 조회하시오
    Alias는 상품코드, 상품명, 매입수량, 매입금액
 SELECT B.BUY_PROD AS 상품코드, 
            A.PROD_NAME AS 상품명,
            SUM(B.BUY_QTY) AS 매입수량,
            SUM(B.BUY_QTY*B.BUY_COST) AS 매입금액
 FROM PROD A, BUYPROD B         
 WHERE A. PROD_ID(+) = B.BUY_PROD
    AND B.BUY_DATE BETWEEN '20050501' AND '20050630' 
 GROUP BY B.BUY_PROD, A.PROD_NAME
 ORDER BY 1;
       
(ANSI OUTER JOIN)
 SELECT B.BUY_PROD AS 상품코드, 
            A.PROD_NAME AS 상품명,
            SUM(B.BUY_QTY) AS 매입수량,
            SUM(B.BUY_QTY*B.BUY_COST) AS 매입금액
 FROM PROD A
 LEFT OUTER JOIN BUYPROD B ON(PROD_ID = B.BUY_PROD
    AND B.BUY_DATE BETWEEN '20050501' AND '20050630'  )         
 GROUP BY B.BUY_PROD, A.PROD_NAME
 ORDER BY 1;
 
 문제) 모든 직무이력테이블(JOB_HISTORY)의 사원번호와 부서코드가 현재 사원테이블의 내용과 같은 사원을 조회하시오
    Alias는 사원번호, 사원명, 직무코드, 부서코드 
    SELECT   A.EMPLOYEE_ID 사원번호, 
                A.EMP_NAME AS 사원명, 
                A.JOB_ID AS 직무코드, 
                A.DEPARTMENT_ID AS 부서코드 
    FROM EMPLOYEES A, JOB_HISTORY B 
       WHERE  B.EMPLOYEE_ID(+) = A.EMPLOYEE_ID
       AND A.DEPARTMENT_ID = B.EMPLOYEE_ID(+)
    ORDER BY 1;
 
 
 문제) 2005년 전체 상품에 대한 상품별 매입금액과 합꼐와 매출금액의 합계를 구하시오
    단, 매입매출실적이 없으면 '0'을 출력학고 상품번호순으로 출력할 것 
    Alias는 상품코드, 상품명, 매출금액, 매입금액
  SELECT A.PROD_ID AS 상품코드, 
         A.PROD_NAME AS 상품명, 
         NVL(SUM(A.PROD_PRICE*C.CART_QTY),0) AS 매출금액, 
         NVL(SUM(B.BUY_COST*B.BUY_QTY),0) AS 매입금액
    FROM PROD A  
    LEFT OUTER JOIN BUYPROD B ON (A.PROD_ID = B.BUY_PROD AND BUY_DATE BETWEEN '20050101' AND '20051231')
    LEFT OUTER JOIN CART C ON (A.PROD_ID = C.CART_PROD AND C.CART_NO LIKE '2005%')
   GROUP BY A.PROD_LGU, A.PROD_NAME
   ORDER BY 1;
    
    
    
    
    
    
    
    
    
 
 
 
 
 
 
       
       
       
       
       
       
       ┌───┐
       │  '(+)'  │
       └───┘
        
        
        
        
        
        
        
        
        
        
        
        