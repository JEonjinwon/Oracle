2020-08-12-01)
3. LIKE 연산자
    -패턴비교연산
    -'%'와 '_' 와일드 카드 사용
    -'%' : 사용된 위치 이후의 모든 문자열과 대응 
    ex) '김%' -> '김'으로 시작되는 모든 문자열과 대응
    -'_'  : 사용된 위치에서 한글자와 대응
    ex) '홍_동' -> 첫 글자가 '홍'이고 3글자로(가운데가 NULL이면 2글자) 구성되고, 마지막 글자가 '동'인 문자열과 대응
    
    예) 회원 테이블에서 거주지가 '서울'인 회원을 조회하시오
    Alias는 회원번호, 회원명, 성별, 주소, 마일리지, 주소는 상세주소까지 출려
    SELECT MEM_ID AS 회원번호,
               MEM_NAME AS 회원명,
               CASE WHEN SUBSTR(MEM_REGNO2,1,1)='1' THEN
               '남성회원'
                        ELSE '여성회원' END AS 성별, 
                MEM_ADD1 || '  ' ||MEM_ADD2 AS 주소,
                MEM_MILEAGE AS 마일리지
    FROM MEMBER
    -- WHERE MEM_ADD1 LIKE '서울%'; 아래와 같다.
   WHERE SUBSTR(MEM_ADD1,1,2)='서울';
   
   문제1) 메인 테이블(BUYPROD)에서 2005년 5~6월에 매입한 전자제품 (P102)매입 현환을 조회하시오.
    Alias는 날짜, 제품코드, 수량, 단가 ,금액이다
    SELECT BUY_DATE AS 날짜,
               BUY_PROD AS 제품코드,
               BUY_QTY  AS 수량,
               BUY_COST AS 단가,
               BUY_QTY * BUY_COST AS 금액
    FROM BUYPROD
   WHERE SUBSTR(BUY_PROD,1,4) = 'P102' 
   AND SUBSTR(BUY_DATE,1,7)='2005/05' 
   OR SUBSTR(BUY_PROD,1,4) = 'P102'
   AND SUBSTR(BUY_DATE,1,7)='2005/06'
   ORDER BY 3 DESC, 1 DESC;-- BUY_QTY DESC;
   
 4. BETWEEN ~ AND
    -범위를 지정하여 비교하는 경우 사용
    -AND(논리연산자)를  대신하여 사용 가능
    -문자열, 숫자, 날짜 타입 모두에 적용 가능 
   

   
   
   
   
   
   
   
   
   
   
   문제1 사원테이블에서 급여가 5000~12000 사이의 사원정보를 조회하시오
   Aloas는 사원번호, 사원명, 급여, 직무코드
   SELECT EMPLOYEE_ID AS 사원번호,
              EMP_NAME AS 사원명,
              SALARY AS 급여,
              JOB_ID AS 직무코드
   FROM EMPLOYEES
   WHERE SALARY BETWEEN 5000 AND 12000 ;
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    