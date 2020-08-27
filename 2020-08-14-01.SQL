2020-08-14-01)
1. LTRIM, RTRIM, TRIM
    - 무효의 공백을 제거하는 함수
    - LTRIM은 왼쪽에 존재하는 무효의 공백제거
    - RTRIM은 오른쪽에 존재하는 무효의 공백제거
    - TRIM은 양쪽에 존재하는 무효의 공백제거
    (사용형식)
    LTRIM(c [,set]),  RTRIM(c [,set]),   TRIM(c),
        -주어진 문자열 c에서 set으로 지정된 문자열을 왼쪽 (LTRIM),
            오른쪽 (RTRIM) 찾아제거
        - set이 생략되면 set은 공백을 의미함
예) 거래처명의 데이터 타입을 CHAR(40)으로 변경하시오.
 ALTER TABLE BUYER
   MODIFY BUYER_NAME CHAR (40)
    
예) 거래처 테이블에서 거래처 명이 '대헌'인 거레처 정보를 조회하시오
 SELECT BUYER_ID AS 거래처코드,
        BUYER_NAME AS 거래처명,
        BUYER_ADD1||' '||BUYER_ADD2 AS 주소
    FROM BUYER
WHERE BUYER_NAME = '대현';

예) 거래처 테이블에서 거래처 기본주소 중 대전에 있는 거래처를 검색하여' 대전'문자열을 제거하시오
SELECT BUYER_ID AS 거래처코드,
       TRIM(BUYER_NAME) AS 거래처명,
       LTRIM (BUYER_ADD1,'대전') AS 기본주소
    FROM BUYER
WHERE BUYER_ADD1 LIKE '대전%';

SELECT RTRIM('운암빌딩대전 ' ,'대전')
    FROM DUAL;


5. LPAD, RPAD 
    -주어진 문자열의 왼쪽(LPAD) 또는 오른쪽에 특정 문자열을 삽입할때 사용 
    RPAD("값", "총 문자길이", "채움문자")
    (사용방법)
    LPAD(c,n,expr), PRAD(c,n,expr)
        - c 문자열에 왼쪽(LPAD)에 n자리만큼 expr문자열을 삽입
        - expr이 생략되면 공백이 삽입
        
예)
SELECT LPAD(MEM_NAME, 11, '성명:')
FROM MEMBER; 

SELECT EMAIL, LPAD(EMAIL, 13)
FROM EMPLOYEES;
    
SELECT LPAD (TO_CHAR(MEM_MILEAGE),5) AS "AD"
FROM MEMBER; 


6. REPLACE 
(사용형식)
REPLACE(c, ser_c, rap_c) --(조작할 원본데이터, 찾을 데이터, 변환시킬 데이터)
    - 문자열 c에서 'ser_c' 문자열을 찾아 'rap_c' 문자열로 대치시킴
    - 단어 내부의 공백제거에 주로 사용  
    
예) 
SELECT REPLACE('IL POSTINO BOY HOOD', ' ', ' ')
FROM DUAL;

거래처테이블의 거래처명의 데이터 타입을 VARCHAR2(40)으로 변경하시오
ALTER TABLE BUYER
    MODIFY BUYER_NAME VARCHAR2(40);
SELECT *FROM BUYER;
UPDATE BUYER
    SET BUYER_NAME=TRIM(BUYER_NAME);
COMMIT;

7. INSTR
(사용형식)
INSTR(c, substr, pos, [occur])     
    - 문자열 c에서 substr문자열을 찾아 그 문자열의 위치 값을 반환 
    - pos는 시작 위치값으로 default는 1이다.
    - occur는 반복 횟수 정의
예) 
SELECT INSTR('무궁화 꽃이 피었을까? 무궁화 꽃은 우리나라 꽃입니다', '꽃',6,2)
FROM DUAL ;
    
8. LENGTH, LENGTHB
(사용형식)
LENGTH(c), LENGTHB(c)
    - 문자열 c의 길이 또는 byte수를 반환










    
    
         ＼              ＼
           ＼              ＼              ┌─────┐
             ＼              ＼            │       ㆎ    ├─
              ├─────┼────│  │         ├─
             /                /             │       ㆎ    ├─
           /                /               └─────┘
         /                /             
                        └─────<＠
                                         
                         