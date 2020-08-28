2020-08-27-02)
**다음 조건에 맞는 재고수불 테이블을 생성하시오.
    - 테이블명 : REMAIN
    
     컬럼명                 데이터타입              NULLABLE           제약사항 
    ------------------------------------------------------------------------------
    REMAIN_YEAR         CHAR(4)                 NOT NULL            PK
    REMAIN_PROD        VARCHAR2(10)        NOT NULL            PK, FK
    REMAIN_J_00          NUMBER(5)
    REMAIN_I              NUMBER(5) 
    REMAIN_O             NUMBER(5)
    REMAIN_J_99          NUMBER(5)
    REMAIN_DATE         DATE
    ------------------------------------------------------------------------------
     REMAIN_J_99 = REMAIN_J_00  +  REMAIN_I - REMAIN_O  
     기말제고 = 기초제고 + 입고 - 출고 
     
CREATE TABLE REMAIN(
    REMAIN_YEAR         CHAR(4),                
    REMAIN_PROD        VARCHAR2(10),       
    REMAIN_J_00          NUMBER(5),
    REMAIN_I              NUMBER(5),
    REMAIN_O             NUMBER(5),
    REMAIN_J_99          NUMBER(5),
    REMAIN_DATE         DATE,
    CONSTRAINT PK_REMAIN
         PRIMARY KEY(REMAIN_YEAR, REMAIN_PROD),
    CONSTRAINT FK_REMAIN FOREIGN KEY(REMAIN_PROD) REFERENCES PROD(PROD_ID));
    
**REMAIN 테이블에 다음 조건에 맞도록 자료를 PROD 테이블로 부터 입력하시오
    -서브쿼리가 사용된 INSERT문으로 일괄입력
    **서브쿼리로 INSERT시킬때 'VALUES'와 '()'가 생략
 INSERT INTO REMAIN(REMAIN_YEAR, REMAIN_PROD, REMAIN_J_00,
                    REMAIN_I, REMAIN_O, REMAIN_J_99, REMAIN_DATE)
      SELECT '2005', PROD_ID, PROD_PROPERSTOCK, 0,0,PROD_PROPERSTOCK, '20050103'
        FROM PROD;

SELECT * FROM REMAIN;
    
**테이블 복사 
CREATE TABLE REMAIN1  AS SELECT

2.UPDATE
    단일컬럼 UPDATE - 한개의 데이터 UPDATE 
      UPDATE 테이블명 
     SET 컬럼명 = 값[,
         컬럼명 = 값,
            :
         컬럼명 = 값]
[WHERE 조건];
    
 OR 
 
 UPDATE 테이블명 
        SET (컬럼명1, 컬럼명2, .......,컬럼명n) = (값1, 갑2 값3,.......,값n)
    [WHERE 조건];
    
2)일괄 UPDATE 처리 -> 서브쿼리 사용 
UPDATE 테이블명 
        SET(컬럼명1,...) = (서브쿼리)
- '(컬럼명1,....)'의 컬럼의 갯수 및 순서와 서비쿼리의 SELECT절의 컬럼의 갯수 및 순서가 일치 해야 한다.        

예) 2005년 1월 입고상품을조회하여 재고수불 테이블 값을 변경하시오. 
     SELECT BUY_PROD, SUM(BUY_QTY)
     FROM BUYPROD
     WHERE BUY_DATE BETWEEN TO_DATE('20050101','YYYY/MM/DD') AND TO_DATE('20050131','YYYY/MM/DD')
     GROUP BY BUY_PROD;
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    