2020-09-03-01)
오라클 객체 
    - view, sequence, synonym, index등이 제공됨
1.view 객체
    - 가상의 테이블
    - 검색명령의 결과 집합
    - 필요한 정보가 다수의 테이블에 존재하는 경우
    - 특정 자료에 대한 접근제한(보안성 확보)
    (사용형식)
CAREATE [OR REPLACE] [FORCE | NOFORCE] VIEW
    뷰이름 [컬럼 LIST]
AS
    SELECT 명령;
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    - FORCE : 기준 테이블이 없어도 VIEW 생성, default는 NOFORCE이다.
    - '컬럼LIST' : 생성되는 뷰의 컬럼명 , 생성되면 기준 테이블의 컬럼명이 사용
    - 'WITH CHECK OPTION' : SELECT문에서 조건을 부여하여 VIEW가 생성된 경우 그 조건에 맞지 않는 VIEW의 수정(UPDATE)나 INSERT는 제한 
예)회원 테이블에서 마일리지가 3000DLTKDDLS 회원의 회원명, 직업, 마일리지를 조회하고 결과를 VIEW로 생성
CREATE OR REPLACE VIEW V_MEN
 AS 
    SELECT MEM_NAME AS 회원명,
            MEM_JOB AS 직업,
            MEM_MILEAGE AS 마일리지
    FROM MEMBER 
    WHERE MEM_MILEAGE>=1000;


SELECT * FROM V_MEN;

UPDATE V_MEM
    SET 마일리지 =4700
WHERE 회원명 = '오철희';

예)2005년 7월 회원별 구매정보를 조회하시오.
    Alias는 회원명, 구매수량합계, 구매금액합계, 단, 결과를 뷰로 생성하시오
SELECT    B.MEM_NAME AS 회원명,
                    SUM(A.CART_QTY) AS 구매수량합계, 
                  SUM(A.CART_QTY*C.PROD_PRICE) AS 구매금액합계
    FROM CART A, MEMBER B, PROD C
    WHERE A.CART_MEMBER = B.MEM_ID
        AND A.CART_PROD = C.PROD_ID
        AND A.CART_NO LIKE '200507%'
    GROUP BY B.MEM_NAME;
    
 (뷰생성)
 CREATE OR REPLACE VIEW V_CART01(
    MNAME, SUM_CNT, SUM_MONEY) --VIEW 로 생성되는 것의 컬럼명
    AS 
        SELECT    B.MEM_NAME AS 회원명,
                      SUM(A.CART_QTY) AS 구매수량합계, 
                      SUM(A.CART_QTY*C.PROD_PRICE) AS 구매금액합계
        FROM CART A, MEMBER B, PROD C
         WHERE A.CART_MEMBER = B.MEM_ID
            AND A.CART_PROD = C.PROD_ID
          AND A.CART_NO LIKE '200507%'
        GROUP BY B.MEM_NAME;
    
 SELECT * FROM V_CART01;   
    
    
SELECT MEM_ID,MEM_NAME, MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_MILEAGE <= 1000;
  
  
  
회원테이블에서 마일리지가 1000 이하인 회원들에게 3000씩 추가마일리지를 지급하시오 

UPDATE MEMBER
   SET MEM_MILEAGE = MEM_MILEAGE + 3000 
 WHERE MEM_MILEAGE <= 1000;
  
  
SELECT *FROM V_MEM;


UPDATE V_MEM
   SET 마일리지 = 2500
 WHERE 회원명 = '신용환';
 
 
 
 
UPDATE V_MEM
   SET 마일리지 = 2500
 WHERE 회원명 = '김은대'; --오류 ORA-01402: view WITH CHECK OPTION where-clause violation
                        --조건이 3천 이상인 사람들만 뷰를 만드는데, 2500으로 바꾸면 그 뷰에 소속되어 있지 않음 
                        
                        
                        
** 주의 사항
  - 제약조건(WITH 절 포함)이 있는 VIEW에서 ORDER BY절 사용금지
  - 뷰가 GROUP BY, DISTINCT 를 사용하여 생성된 경우 INSERT,UPDATE,DELETE 를 사용할 수 없음
  - 표현식 또는 함수(일반)를 사용하여 뷰가 생성된 경우 해당 컬럼을 수정할 수 없다.
  - CREATE , NEXTNVL 등의 의사레코드는 사용할 ㅅ ㅜ없ㅇ,ㅁ
  - ROWINM ROWNUM 등은 별침컬링 사용    
    
    
    
SEQUENCE
    - 연속적으로 증가 또는 감소하는 값을 생성하는 객체
    - 테이블의 기본키 항목을 설정할 컬럼이없는경우 주로 사용
    (사용형식)
    CREATE [OR REPLACE] SEQUENCE 시퀀스명 
    [SEQUENCE WITH 값]
    [INCREMENT BY 값]
    [MAXVALUE 값 | NOMAXVALUE]
    [MINVALUE 값 | NOMINVALUE]
    [CYCLE | NOCYCLE]
    [CACHE | NOCACHE]
    [ORDER | NOORDER];
    



SYNONYM(동의어)
    - 오라클에 사용되는 객체에 부여하는 별칭
    (사용형식)
    CREATE [OR REPLACE] SYNONYM 별칭
    FOR 객채명;
    
INDEX    
    - 검색을 효율적으로 수행하기 위한 객체
    1) 인덱스가 필요한 컬럼
        - 자주 검색하야하는 컬럼
        - WHERE 절에서 동등연산자('=')을 사용하는 컬럼
        - 기본키와 외래키
        - 조인(조인조건에 사용)이나 정렬(ORDER BY)에 사용되는 컬럼
        
    2) 인덱스의 종류
        (1)Unique/Non-Unique
            - 중복값을 허용하는지 여부에 따른 분류
            - Non-Unique는 중복 값 허용
            - NULL도 사용가능하나 (기본키와 외래키 인덱스는 제외) 한번만 사용
        (2)자동 index
            - 테이블 생서시 pk, Unique 조건부여시 생성 
        (3)Normal Index (B-Tree Index)
            - Default Index
            - 트리구조 사용
            - ROWID(물리적 주소)와 컬럼 값을 조합하여 산출된 주소 사용
        (4)Bitmap Index
            - 관계차수가 적은 경우 효율적
            - 자료변동(추가, 변경, 삭제)가 많은 경우 비효율 
            - ROWID와 컬럼 값을 이진으로 조합한 주소 사용
        (5)Function-Based Index
            - 함수가 사용된 컬럼을 인덱스컬럼으로 선택 한경우 
            -  조건절에 함수사용이 많은 경우 효율적
      (사용형식)
      CREATE [UNIQUE | BITMAP] INDEX 인덱스명 
        ON 테이블명 (컬럼명[, 컬럼명, ....][ASC | DESC];
        
































