2020-07-22-01) 테이블 생성 
2)사업장 테이블을 생성하시오
    테이블 명 : SITE
    속성명          데이터 타입 (크기 )      NULL허용      키
    -------------------------------------------------------------------
    S_SITE_NO      CHAR(4)                   N.N             P.K
    S_SITE_NAME   VARCHAR2(30)          N.N             
    S_SITE_ADDR    VARCHAR2(50)         N.N
    S_SITE_TEL       VARCHAR2(15)
    S_SITE_AMT       NUMBER(8)             N.N
    S_INPUT_PER    NUMBER(4)
    S_SITE_REMARK VARCHAR2(100)
    
    
    CREATE TABLE SITE(
     S_SITE_NO      CHAR(4)                  NOT NULL,
     S_SITE_NAME   VARCHAR2(30)         NOT NULL,            
    S_SITE_ADDR    VARCHAR2(50)         NOT NULL,
    S_SITE_TEL       VARCHAR2(15),
    S_SITE_AMT       NUMBER(8)             NOT NULL,
    S_INPUT_PER    NUMBER(4),
    S_SITE_REMARK VARCHAR2(100),
    
    CONSTRAINT pk_site PRIMARY KEY(S_SITE_NO));
 
 
 
3) 사업장 자재 테이블을 생성하시오
    테이블명 : SITE_ITEM
     속성명          데이터 타입 (크기 )      NULL허용      키
    -------------------------------------------------------------------
    SI_SITE_NO      CHAR(4)                   N.N             P.K
    SI_SITE_NAME   VARCHAR2(30)                      
    SI_AMOUNT   NUMBER(3)               N.N
    SI_PRICE        NUMBER(12)               N.N
    SI_BUY_DATE   DATE                        N.N
    S_SITE_NO    CHAR(4)                       N.N              F.K
    ------------------------------------------------------------------
    
CREATE TABLE SITE_ITEM (
SI_ITEM_NO CHAR(4) NOT NULL,  
SI_ITEM_NAME VARCHAR(30) NOT NULL, 
SI_AMOUNT NUMBER(3) NOT NULL,   
SI_PRICE  NUMBER(12) NOT NULL,  
SI_BUY_DATE DATE  NOT NULL,   
S_SITE_NO CHAR(4) NOT NULL,  
CONSTRAINT pk_site_item PRIMARY KEY (SI_ITEM_NO),
CONSTRAINT fk_site_item_site FOREIGN KEY (S_SITE_NO)
    REFERENCES SITE(S_SITE_NO)
);



4)근무 테이블을 생성하시오 
테이블명 : WORK
     속성명          데이터 타입 (크기 )      NULL허용      키
    -------------------------------------------------------------------
    E_EMP_NO        CHAR(4)             N.N                 P.K/F,K
    S_SITE_NO        CHAR(4)            N.N                      P.K/F,K
    ES_INSERT_DATE  DATA                N.N
    -------------------------------------------------------------------------
    
CREATE TABLE WORK(
E_EMP_NO CHAR(4) NOT NULL,
S_SITE_NO CHAR(4) NOT NULL,
ES_INSERT_DATE  DATE NOT NULL,
CONSTRAINT pk_work PRIMARY KEY(E_EMP_NO,S_SITE_NO),
CONSTRAINT fk_emp_work FOREIGN KEY(E_EMP_NO)
REFERENCES EMP(E_EMP_NO),
CONSTRAINT fk_site_wokr FOREIGN KEY(S_SITE_NO)
REFERENCES SITE(S_SITE_NO));
    
    
 2.  테이블 삭제    
    -DROP 명령 사용
    -ROLLBACK의 대상
    (사용형식)
    DROP TABLE 테이블명;
    
예) EMP 테이블을 사제해보시오
DROP TABLE EMP;   
-- EMP의 테이블을 참조하는 WORK 테이블이 있어서 바로 삭제가 안된다.
--관계를 삭제하던, 하위 테이블을 삭제한다.
DROP TABLE WORK;

    
    
    
    
    
    
    
    
    
    