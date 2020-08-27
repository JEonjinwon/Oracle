2020-08-26-02)집합연산자
    - 여러개의 SELECT문을 연결하여 하나의 쿼리문으로 만드는 역할을 수행
    - UNION, UNION ALL, INTERSECT, MINUS
    (제약사항)
    - 집합연산자로 연결되는 각 SELECT문의 SELECT절에 사용되는 컬럼의 갯수와 DATA TYPE은 일치해야한다.
    - ORDER BY 절은 맨 마지막 SELECT문에서만 사용 가능하다.
    - BLOB, CLOB, BFILE 타입의 컬럼에 대하여 집합연산자 사용이 금지 
    - UNION, INTERSECT, MINUS 연산자는 LONG형 컬럼에는 사용될 수 없다.
    - 출력되는 컬럼은 첫번째 SELECT문 기준이다.

1. UNION 
    - 합집합의 결과를 반환
(사용형식)
SELECT 컬럼 list
    FROM 테이블명
WHERE 조건;

예) 회원테이블에서 직업이 자영업이고 또는 마일리지가 4000이상인 회원의 회원번호, 회원명 직업, 마일리지를 조회
SELECT MEM_ID AS 회원번호,
    MEM_NAME AS 회원명,
    MEM_JOB AS 직업,
    MEM_MILEAGE AS 마일리지
FROM MEMBER    
WHERE MEM_JOB ='자영업'


예) 매입테이블에서 2005년 5월 제품별 매입수량과 매출 수량을 조회하시오.
    Alias는 제품코드, 제품명, 매입/매출 수량
(집합연산자)






























































