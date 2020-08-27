2020-07-21-03)DDL
표현규칙
(1)'한글' : 사용자 정의어
(2) [  ]  : 선택사용(생략가능)
(3) ident1 | ident2 : ident1 또는 ident2를 사용해야 한다. 
(4) ...... : 앞의 기술 내용이 반복 적용 될 수 있음

1)테이블 생성
(사용형식)
CREATE TABLE 테이블명(
    컬럼명 데이터타입[크기] [NOT NULL | NULL] [DEFAULT 값],
    컬럼명 데이터타입[크기] [NOT NULL | NULL] [DEFAULT 값],
    ......
    컬럼명 데이터타입[크기] [NOT NULL | NULL] [DEFAULT 값],
    [CONSTRAINT 기본키설정명 PRIMARY KEY (컬럼명[,컬럼명, ........])],
    [CONSTRAINT 왜래키설정명 FOREIGN KEY (컬럼명[,컬럼명, ........])
        REFERENCES 외부테이블명(컬럼명))];

예) 다음 조건에 맞는 테이블을 생성하시오
    테이블명 : EMP
    컴럼명        데이터타입(크기)   NULLABLE   PK
    --------------------------------------------------------------
    E_EMP_NO   CHAR(4)            N.N            P.K
    E_NAME      VARCHAR2(10)   N.N     
    E_ADDRESS  VARCHAR2(50)    N.N
    E_TEI_NO     VARCHAR2(15)   
    E_POSITION  VARCHAR2(20)    N.N
    E_DEPT        VARCHAR2(20)    N.N
    --------------------------------------------------------------

CREATE TABLE EMP(
    E_EMP_NO   CHAR(4)  NOT NULL,
    E_NAME      VARCHAR2(10)   NOT NULL,
    E_ADDRESS  VARCHAR2(50)    NOT NULL,
    E_TEI_NO     VARCHAR2(15)   ,
    E_POSITION  VARCHAR2(20)   NOT NULL,
    E_DEPT        VARCHAR2(20)    NOT NULL,
    
    CONSTRAINT pk_emp PRIMARY KEY (E_EMP_NO));





