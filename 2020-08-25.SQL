2020-08-25-01) 서브쿼리
    - SQL문장 안에서 보조로 사용되는 또 다른 쿼리
    - '()' 안에 기술
    - 분류
        1)연관성 여부에 따라
            - 연관성 없는 서브쿼리, 연관성 있는 서브쿼리
        2)형태에 따라 
            - 일반 서브쿼리(SELECT절)
            - 인라인 서브쿼리(FROM 절)
            - 중첩 서브쿼리(WHERE 절)
        3) 반환값의 갯수에 따라
            - 단일행 / 단일열 , 단일행/단중열, 단중행/단일열. 다중행/다중열
1. 연관성 없는 서브쿼리
    - 메인 쿼리와 서브쿼리에 사용된 테이블이 조인으로 연결되지 않는 서브쿼리
 예) 회원테이블에서 평균마일리지보다 많은 마일리지를 보유한 회원의 회원번호, 회원명, 직업, 마일리지를 조회
 (1) 메인쿼리 : 회원테이블에서 회원의 회원번호, 회원명, 직업, 마일리지를 출려 
    SELECT MEM_ID AS 회원번호,
            mem_name as 회원명,
            mem_job as 직업,
            mem_mileage as 마일리지
    from MEMBER 
    where mem_mileage > (평균 마일리지);
(2) 서브쿼리 : 평균마일리지 
select avg(mem_mileage)
    from MEMBER;
    
예) 부서테이블에서 상위부서코드가 NULL인 부서에 소속된 사원수를 조회하시오
    메인쿼리 : 사원테이블에서 사원수 조회 -- 최종적으로 출력되는 것이 메인쿼리
        SELECT COUNT(*) AS 사원수 
            FROM EMPLOYEES
        WHERE DEPARTMENT_ID =(상위부서코드가 NULL인 부서코드) -- =을 사용하면 양쪽의 개수가 같아야 한다 =말고 IN 같은거 쓴다..
    
    
    서브쿼리 :  (상위부서코드가 NULL인 부서코드)
    SELECT DEPARTMENT_ID
        FROM DEPARTMENTS
    WHERE PARENT_ID IS NULL; -- = NULL은 =로 못찾음 IS NULL 사용
    
    (메인쿼리, 서브쿼리 결합)
       SELECT COUNT(*) AS 사원수 
            FROM EMPLOYEES
        WHERE DEPARTMENT_ID =  (SELECT DEPARTMENT_ID
                                               FROM DEPARTMENTS
                                                WHERE PARENT_ID IS NULL);
    
 2. 연관성 있는 서브쿼리 
    - 메인쿼리와 서브쿼리에 사용된 테이블이 조인으로 연결된 서브쿼리
   
예) 각 부서의 평균급여를 계산하고 각 부서에서 자기 부서의 평균급여보다 많은 급여를 지급받는 직원이 있는 부서코드와 부서명을 출력
(메인쿼리) : 부서코드와 부서명 출력
SELECT   A.DEPARTMENT_ID AS 부서코드,
             A.DEPARTMENT_NAME AS 부서명  
    FROM DEPARTMENTS A
WHERE A.DEPARTMENT_ID IN(서브쿼리);

(서브쿼리) : 자기부서의 평균급여보다 많은 급여를 지급받는 직원이 있는 부서의 부서코드
SELECT B. DEPARTMENT_ID
    FROM EMPLOYEES  B
WHERE B.SALARY > (자기부서의 평균급여)

(Subquery of Subquery) : 자기부서의 평균 급여 -- 서브쿼리의 서브쿼리
SELECT C.DEPARTMENT_ID,
        ROUND(AVG(C.SALARY))
FROM EMPLOYEES C 
GROUP BY C.DEPARTMENT_ID;

    
(결합)
SELECT   A.DEPARTMENT_ID AS 부서코드,
             A.DEPARTMENT_NAME AS 부서명  
    FROM DEPARTMENTS A
WHERE A.DEPARTMENT_ID IN(SELECT B. DEPARTMENT_ID
                                 FROM EMPLOYEES  B
                            WHERE B.SALARY > (SELECT C.DEPARTMENT_ID,
                                                         ROUND(AVG(C.SALARY))
                                                        FROM EMPLOYEES C 
                                                        GROUP BY C.DEPARTMENT_ID));

    
  예 ) 장바구니테이블에서 회원별 최고구매수량을 가진 자료의
회원번호, 장바구니번호, 상품번호, 구매수량을 조회하시오

매인쿼리 : 장바구니 테이블에서 회원별 회원번호,
장바구니번호, 상품번호 구매수량
SELECT A.CART_MEMVER AS 회원번호,
       A.CART_NO AS 장바구니번호, 
       A.CART_PROD AS 상품번호,
       A.CART_QTY AS 구매수량
   FROM CART A
 WHERE A.CART_QTY = (서브쿼리:회원별최대구매수량)
 
 (회원별최대구매수량) =
 SELECT MAX(B.CART_QTY)
  FROM CART B
WHERE A.CART_MEMBER= B.CART_MEMBER


SELECT A.CART_MEMBER AS 회원번호,
       A.CART_NO AS 장바구니번호, 
       A.CART_PROD AS 상품번호,
       A.CART_QTY AS 구매수량
   FROM CART A
 WHERE A.CART_QTY = 
 (SELECT MAX(B.CART_QTY)
   FROM CART B
 WHERE A.CART_MEMBER= B.CART_MEMBER);
 
 
 
   예) 사원테이블의 사원급여를 아래 조건대로 변경(update)하시오
    [조건]
    1. 사원이 소속된 부서의 상위부서가 90번인 부서 
    2. 상위부서가 90에 속한 부서의 각 부서의 평균급여 계산
    3. 상위부서가 90에 속한 부서에 속한 사원의 급여를 자신의 부서 평균 급여로 변경
    
    (상위부서가 90번인 부서에 속한 사원)
    
    SELECT A.EMPLOYEE_ID,
           A.EMP_NAME,
           A.DEPARTMENT_ID,
           B.PARENT_ID
      FROM EMPLOYEES A, DEPARTMENTS B
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
       AND B. PARENT_ID=90;
      





 UPDATE EMPLOYEES D
       SET SALARY = (SELECT C.SAL
                     FROM (SELECT A.DEPARTMENT_ID AS DID,
                                  ROUND(AVG(A.SALARY)) AS SAL
                             FROM EMPLOYEES A, DEPARTMENTS B
                            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                              AND B.PARENT_ID = 90
                         GROUP BY A.DEPARTMENT_ID) C
    WHERE D.DEPARTMENT_ID = C.DID);
    
    ROLLBACK;
    
    
    
    