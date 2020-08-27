2020-07-29-02)조회문(SELECT)
    -테이블 내의 자료를 조회할 때 사용
(사용형식)
SELECT  * | [DISTINCT] 컬럼명 |expr [AS] ["] 컬럼별칭 ["] ,
            컬럼명 |expr [AS] ["] 컬럼별칭 ["] ,
            ......
            컬럼명 |expr [AS] ["] 컬럼별칭 ["] 
            --컬럼별칭이 ORCLE에서 사용되어지거나 공백을 포함 하면 ""로 묶어주어야 한다.
            --DISTINCT : 중복된 자료를 제외시킨 결과
            --SELECT 절에 '*' 를 사용하면 해당 테이블에 있는 모든 컬럼 전체를 결과로 출려
            --WHERE 절이 생략되면 해당 테이블의 모든 행이 결과로 출력
            --'컬럼인덱스'는 SELECT 절에 사용된 컬럼의 순번(1부터 사용)
            --'[ASC|DESC]' 정렬방법 , ASC는 오름차순, DESC는 내림차순, default는 ASC이다.
            
FROM 테이블명 [별칭]
[WHERE 조건]
[GROUP BY 컬럼명 [, 컬럼명, ......]]
[HAVING 조건] --5개의 조건이 주어지면 HAVING
[ORDER BY 컬럼명|컬럼인덱스 [ACS|DESC],....]

SELECT 50*12345 AS "첫번째 컬럼", --공백이 있으면 ""
         50*12345 AS 두번째컬럼, --가장 많이 사용 
          50*12345 세번째컬럼,  -- AS 생략가능
          MEM_NAME AS 회원번호 -- 없어도 오류 안남  위에 3개가 회원 수만큼 찍힌다.
FROM MEMBER; --컬럼이 하나도 포함 않되면 시스템에서 주어준 DUAL을 쓰면된다.

예) 회원 테이블 (MEMBER)에서 회원들의 주소지(광역시) 종류를 조회하시오
SELECT  DISTINCT SUBSTR(MEM_ADD1,1,2) AS 주소지 
FROM MEMBER;

예)장바구니 테이블(CART)에서 2005년 6월에 판매된 상품의 종류를 조회하시오.
SELECT DISTINCT 
(판매 상품 전체조회)
SELECT COUNT(DISTINCT CART_PROD) AS 상품코드
         --  CART_QTY   AS 판매수량
  FROM CART
  WHERE CART_NO LIKE '200506%'
  ORDER BY CART_PROD ASC; --ASC는 않써도된다.

SELECT COUNT(*) FROM PROD;

예)사원테이블 (EMPLOTEES)에서 사용되는 부서코드를 죄하시오 

SELECT EMPLOYEES.DEPARTMENT_ID AS 부서코드,
            DEPARTMENT_NAME AS 부서명
    FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID= DEPARTMENT.DEPARTMENT_ID --앞뒤가 같을 때 소속을 알려줘야한다 => TABLE 명 .
 ORDER BY 1; --컬럼 순번



SELECT DISTINCT A.DEPARTMENT_ID AS 부서코드,
            DEPARTMENT_NAME AS 부서명
    FROM EMPLOYEES A, DEPARTMENTS B --EMPLOYEES이름이 A로 DEPARTMENTS이름이 B로 테이블 별칭 정해줌
WHERE A.DEPARTMENT_ID= B.DEPARTMENT_ID 
 ORDER BY 1; 



1)WHERE 절 
    -조건을 기술하는 절 
    -일반조인이나 조인 조건을 기술하는 절
    -관계연산자 (<, >, =, >=, <=, != ) : 크기비교
                        --  !=대신에 <>도 가능
    -논리연산자 ( NOT, AND, OR) --우선순위 순서다
    -IN, SOME, ANY, ALL, EXISTS 사용가능


