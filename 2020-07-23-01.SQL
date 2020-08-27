z2020-07-23-01)
2.UPDATE
    -저장된 데이터의 내용을 변경
    (사용형식) 
    UPDATE 테이블명 
        SET 컬럼명 = 값[ ,
              컬럼명 = 값, ......]
        [WHERE 조건] ;
        
        -[WHERE 조건] 절이 생략되면 테이블의 모든 행에 존재하는 컬럼의 새로운 값을 변경.
        
예)사원테이블 (EMPLOTEES)테이블에서 사원들의 급여를15000으로 변경하세요



SELECT EMP_NAME AS 사원명,
            DEPARTMENT_ID 부서코드,
            SALARY AS 급여 
        FROM EMPLOYEES;
    
UPDATE EMPLOYEES
    SET SALARY = 15000;
    
    ROLLBACK;
    COMMIT;
    
    
예) 사원테이블 (EMPLOYEES)테이블에서 부서코드가 50번인 사원들의 급여를 15000으로 변경하세요
    SELECT EMP_NAME AS 사원명,
            DEPARTMENT_ID 부서코드,
            SALARY AS 급여 
        FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;
UPDATE EMPLOYEES
SET SALARY = 15000
WHERE DEPARTMENT_ID = 50;

예) 회원테이블(MEMBER)에서 회원들의 마일리지를 20% 추가지급 하시오.
    SELECT MEM_NAME, MEM_MILEAGE
    FROM MEMBER;
    
    UPDATE MEMBER
    SET MEM_MILEAGE = MEM_MILEAGE *1.2;
      
3. DELETE
    - 저장된 테이블내의 행(들)을 삭제
    (사용형식)
    DELETE 테이블명
    [WHERE 조건];
    
     [WHERE 조건] 절이 생략 되면 '테이블' 내의 모든 행을 삭제 
     
예) 장바구니 테이블 (CART) 내의 자료를 모두 삭제하시오
delete cart;
select * from cart;

예) 장바구니 테이블(cart)에서 2005년 5월 이전 자료를 모두 삭제하시오.
delete cart
where substr(cart_no,1,8)< '20050601' 
-- cart_no의 값 1자리부터 8자리까지 조건에 맞으면 지워라 
--java는 0부터 시작 오라클은 1부터 시작

