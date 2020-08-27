2020-07-29-01) 기타자료형
1)BFILE
-이진 데이터 저장
-대상이 되는 이진 데이터를 데이터베이스 외부에 저장하고 
-경로 정보(DIRECTORY 객체)만 데이터베이스에 저장
-4GB 까지 처리 가능
(사용형식)
컬럼명 BFILE;
    -디렉토리 별칭(Alias)은 30 BYTE, 파일명은 256 BYTE 까지 허용
        -디랙토리 별칭 : 디렉토리가 길면 별칭으로 만들어준다.
예)
-원본자료(그림)이 저장된 디렉토리 객체 생성
create directory test_dir as 'D:\A_TeachingMaterial\2.Oracle';

create Table temp_08(
col1 bfile
);

insert into temp_08
    values(bfilename('test_dir', 'sample.jpg'));
    
select *from temp_08;    



2)blob
-이진 데이터 저장
-대상이 되는 이진 데이터를 데이터베이스 내부에 저장
-4GB 까지 처리 가능
(사용형식)
컬럼명 blob;
예)
create table temp09(
col1 Blob
);

--익명 블록으로 저장 쿼리를 작성
DECLARE
    L_DIR VARCHAR2(20) := 'test_dir';
    L_FILE VARCHAR2(30) :='sample.jpg';
    L_BFILE BFILE;
    L_BLOB BLOB;
    
BEGIN
INSERT INTO TEMP09 VALUES(EMPTY_BLOB());
RETURN COL1 INTO L_BLOB;

L_BFILE := BFILENAME(L_DIR, L_FILE);
DBMS_LOB.FILEOPEN(L_BFILE,DBMS_LOB.READONLY);
DBMS_LOB.LOADFROMFILE(L_BLOB, L_BFILE, DBMS_LOB.GETLENGTH(L_BFILE));
DBMS_LOB.FILECLOSE(L_BFILE));

COMMIT;

END;

select *from temp09;  


















