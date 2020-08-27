2020-08-17-01)
3. MONTHS_BETWEEN
    - 두 날짜데이터 사이의 개월수를 반환 
    (사용형식)
    MONTHS_BETWEEN(d1,d2)
    - d2가 d1보다 빠른 날짜가 와야함 
예) 
SELECT MONTHS_BETWEEN('20201001', SYSDATE)
FROM DUAL;
    
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'19960707')) AS 개월수,
    ROUND(SYSDATE  -TO_DATE( '19960707')) AS 일수
    FROM DUAL;
    
 5. NEXT_DAY
 (사용형식)
 NEXT_DAY(d1,c2)
    - d1 이후 c1(요일)이 지칭하는 요일의 날짜 반환
    
변환함수 
    -데이터의 형을 변환 할때 사용
 1. TO_CHAR
 (사용형식)
 TO_CHAR(d, [,fmt]_
    - d는 숫자 또는 날짜 자료형
    - fmt는 형식지정 문자열
(날짜변환형식)
----------------------------------------------------------
    fmt                      설명
----------------------------------------------------------
    AM, FM                오전, 오후 표시
    A.M., F.M.             
    YYYY, YYY,            년도 표시
    YY, Y
    MM                    월(01~12)
    D                       주중의 일 (1~7)
    DD                     월중의 일 (1~31)
    DDD                   년중의 일 (1~365)
    DAY           주중의 일을 요일로 표시
  DL            날짜와 요일 표시
-------------------------------------
  HH,HH12       시간
  HH24
-------------------------------------
  MI            분
  SS            초
  SSSSS         오늘 전체 경과된 시간
  WW            년중 주차를 나타냄(1~53주)
-------------------------------------
SELECT TO_CHAR(TO_DATE('19801026'),'DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
------------------------------------------------
(숫자변환형식)
    FMT         설명
------------------------------------------------
 .(DOT),        소숫점과 자리점(3자리 구분)
 ,(COMMA)
 9, 0           9는 무효의 0을 공백으로 대치
                0은 무효의 0을 '0'으로 반환
 PR             음수인 경우 -부호 대신 '< >'로 묶어 표시
 RN, M          숫자 자료 를 로마자로 변환하여 표시
** 사용자 지정 문자열 : " " 안에 기술

예) 오늘 날짜를 'YYY년 MM월 DD일' 형식으로 표시

SELECT TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일"')
FROM DUAL;

2. TO_NUMBER
  - 문자나 다른 유형의 숫자를 NUMBER타입으로 변환
  (사용형식)
  TO_NUMBER(c [,fmt])
  
예) 회원테이블에서 주민번호 앞자리를 이용하여 나이를 계산하여 출력하시오
    Alias는 회원이름, 출생년도(2자리), 나이
    
    SELECT MEM_NAME AS 회원이름,
           SUBSTR(MEM_REGNO1,1,2)||'년' AS 출생년도,
           2020-TO_NUMBER(SUBSTR(MEM_REGNO1,1,2)+1900) AS 나이
    FROM    MEMBER;  
------------------------------------------------
예)사원테이블에서 부서번호 70번부서의 사원을 조회하시오.
    ALIAS는 사원명, 직책,급여이며 급여는 다음 형식으로 출력하시오.(123,456.0)
    SELECT EMP_NAME AS 사원명,
           JOB_ID AS 직책,
           TO_CHAR(ROUND(SALARY,1),'999,999.0') AS 급여
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 70;
예)상품테이블에서 매입가에서 판매가를 차감하여 출력하시오.
    ALIAS는 상품코드, 상품명, 분류코드,매입가격,판매가격,차감가격
SELECT PROD_ID AS 상품코드,
       PROD_NAME AS 상품명,
       PROD_LGU AS 분류코드,
       TO_CHAR(PROD_COST,'99,999,999') AS 매입가격,
       TO_CHAR(PROD_PRICE,'99,999,999') AS 판매가격,
       TO_CHAR(PROD_COST-PROD_PRICE,'99,999,999PR') AS 차감가격
    FROM PROD;
예)제품분류테이블(LPROD)의 LPROD_ID(순차적으로 부여된 숫자)를
    로마표기로 바꾸어 출력하시오.
 SELECT LPROD_ID AS 순번,
        TRIM(TO_CHAR(LPROD_ID,'rm'))AS "순번(로마숫자)",
        LPROD_GU AS 구분코드,
        LPROD_NM AS 구분명
    FROM LPROD;
    
 NULL 처리함수
    1. NVL
    - 주어진 자료가 NULL인지 판별하여 NULL인 경우 다른 값을 반환
    (사용형식)
    NVL(col, val)
        - 'col'의 값이 NULL이면 'val' 값을 변환하고 'col'이 NULL이 아니면 'col' 값을 반환 
        
SELECT PROD_NAME AS 상품명,
PROD_LGU AS 분류코드,
PROD_COLOR,
NVL(PROD_COLOR,'색상정보없음') AS 색상정보
FROM PROD;
    
    
    
    
    
    