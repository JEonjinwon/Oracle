2020-07-22-02)테이블 수정 
-ALTER 명령으로 수정
-컬럼 추가 /변경/삭제
-테이블명 수정
-제약조건 (기본키, 외래키) 추가, 삭제, 수정 

1)테이블 명 수정
(사용형식)
ALTER TABLE OLD_테이블명
    RENAME TO NEW_테이블명;

예)EMP 테이블 이름을 EMPLOYEE로 변경하시오    
ALTER TABLE EMP RENAME TO EMPLOYEE;
ALTER TABLE EMPLOYEE RENAME TO EMP;


2)컬럼 추가 
(사용형식)
ALTER TABLE 테이블명
    ADD 컬럼명 데이터타입[(크기)] [DEFAULT 값] [NOT NULL | NULL];
    
예) 사업장 테이블 (SITE)에 시공일자 컬럼을 추가하시오.
    시공일자 : S_START_DATE  DATE이고 기본값으로 오늘 날짜입력 
    ALTER TABLE SITE
    ADD S_START_DATE DATE DEFAULT SYSDATE;
    
3) 컬럼 변경
-컬럼 의 데이터 타입, 크기, 기본값을 변경
(사용형식)
ALTER TABLE 테이블명
    MODIFY 컬럼명 데이터타입[(크기)] [DEFAULT 값] [NOT NULL | NULL],
                [컬럼명 데이터타입[(크기)] [DEFAULT 값] [NOT NULL | NULL]];

예) 사업장 자재 테이블(SITE_ITEM)에서 자재이름(SI_ITEM_NAME)의 데이터 타입을 CHAR(70)으로 변경하시오
ALTER TABLE SITE_ITEM
    MODIFY SI_ITEM_NAME CHAR(70);
    
4)컬럼 명 변경 
-컬럼의 이름을 변경 
(사용형식)
ALTER TABLE 테이블명
    RENAME COLUMN OLD_컬럼명 TO NEW_컬럼명;
    
예) 사원테이블 (EMPLOYEE)에서 사원의 주소(E_ADDRESS) 컬럼명을 E_ADDR로 바꾸세요
ALTER TABLE EMPLOYEE 
    RENAME COLUMN E_ADDRESS TO E_ADDR;

5)컬럼 삭제
(사용형식)
ALTER TABLE 테이블명
    DROP COLUMN 컬럼명 ;
    
 예) 사업장 테이블(SITE)에서 시공일자 컬럼(S_START_DATE)을 삭제하시오
 ALTER TABLE SITE
    DROP COLUMN S_START_DATE;
    
6)제약 조건 변경
    -기본키 및 외래키 설정 추가/변경/삭제
(사용형식)   
ALTER TABLE 테이블명 
    ADD CONSTRAINT 기본키 설정명 PRIMARY KEY(컬럼명[,컬럼명,.......]),
        [CONSTRAINT 외래키 설정명 FOREIGN KEY(컬럼명[,컬럼명,.......])
            REFERENCES 외부테이블 (컬럼명)];
    MODIFY CONSTRAINT 기본키 설정명 PRIMARY KEY(컬럼명[,컬럼명,.......]),
        [CONSTRAINT 외래키 설정명 FOREIGN KEY(컬럼명[,컬럼명,...])
            REFERENCES 외부테이블명(컬럼명)];]
        [DROP CONSTRAINT 기본키 설정명 | 외래키 설정명 ;]
    
    
    
    
    