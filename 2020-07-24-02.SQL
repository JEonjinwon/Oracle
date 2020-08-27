2020-07-24-02)기타 자료형
    -이전 자료 저장을 위한 자료 타입
    -BLOB, RAW, LONG, BFILE
    
1)RAW
    -상대적으로 작은 양의 이진 자료를 저장 
    -인덱스 처리가 가능
    -데이터베이스에서는 해석이나 변화 작업은 수행하지 않음
    -최대 2000 BYTE 까지 저장 가능  
    
    (사용형식)
    컬럼명 RAW(크기)
    ;
CREATE TABLE TEMP07(
COL1 RAW(1000),
COL2 RAW(200));

INSERT INTO TEMP07
    VALUES(HEXTORAW('6ADC'),  HEXTORAW('FF'));
    
    SELECT * FROM TEMP07;