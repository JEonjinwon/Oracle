2020-08-28-01)PL/SQL 
    - Procedual language SQL의 약자
    - 절차적 언어의 특징인 변수, 분기문, 반복문, 예외처리 등의 기능이 지원된 SQL
    - 모든 코드가 DB내부에 생성되고 컴파일되어 저장되기 때문에 실행 속도가 빠르다.
    - 네트워크의 트래픽 감소
    - 표준 문법이 없음
    - Anonymous Block, Stored Procedure, User Defined Function, package
1. 익명 블록 
    - 기본적인 PL/SQL의 구조를 정의
    - 이름이 없는 블록
    (기본구조)
    DECLARE
        선언부(변수, 상수, 커서)
    BEGIN
        실행부(sql 문으로 구성하여 비지니스 로직처리)
        [EXCEPTION 예외처리]
        
    END;
    
    
    
예) 정수형 변수에 값을 배정하고 짝수인지 홀수인지 구분하여 출력하는 익명 블록을 작성하시오. 

    ACCEPT NUM1 PROMPT '정수 입력 :' -- ACCEPT(입력 명령) 변수명 PROMPT 입력 안내문 -> 문자열타입으로 받아옴
  DECLARE
    V_NUM NUMBER := 0; -- 될 수 있으면 NUMBER는 초기화해라. 사용자가 초기화하지 않으면 NULL로 초기화된다. -> DATE, CHAR, VARCHAR타입도 같음.
    V_MESSAGE VARCHAR2(100); -- 인쇄할 내용
  BEGIN
    V_NUM :=  TO_NUMBER('&NUM1'); -- 문자열 타입이므로 넘버타입으로 형변환
    IF MOD(V_NUM,2) = 0 -- 짝수구하기 2로 나눈 나머지 연산자 함수 MOD
    THEN V_MESSAGE := V_NUM || '은 짝수 임';
    ELSE V_MESSAGE := V_NUM || '은 홀수 임';
    END IF; -- IF문의 끝임을 알림
    
    DBMS_OUTPUT.PUT_LINE(V_MESSAGE); -- 자바의 출력문과 비슷
    
    EXCEPTION WHEN OTHERS THEN -- 예외처리
        DBMS_OUTPUT.PUT_LINE('예외발생'||
            SQLERRM); -- SQL ERROR MESSAGE를 출력해 무슨 에러인지 알려준다.
  END;
    
    
 예) 회원테이블에서 회원의 작업을 입력 받아 회원 번호, 회원명, 마일리지를 출려하는 익명블록작성
 
ACCEPT A_JOB PROMPT '직업 : '
DECLARE
    V_NAME MEMBER.MEM_NAME%TYPE;
    V_ID MEMBER.MEM_ID%TYPE;
    V_MILE MEMBER.MEM_MILEAGE%TYPE;
    
    CURSOR CUR_MEM(V_JOB MEMBER.MEM_JOB%TYPE:)
    IS
      SELECT MEM_ID, MEM_NAME, MEM_MILEAGE
        FROM MEMBER
       WHERE MEM_JOB = V_JOB);
BEGIN
  OPEN CUR_MEM('&A_JOB');
  LOOP
     FETCH CUR_MEM INTO V_ID, V_NAME, V_MILE;
     EXIT WHEN CUR_MEM%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(V_ID||', '||V_NAME||', '||V_MAILE);
     END LOOP;
  CLOSE CUR_MEM;
END;  
    
    
2) 상수 
    - 다른 응용 프로그램 언어의 상수 개념과 동일
3) 커서    
    - SQL 명령의 결과 집합
    - 쿼리 결과를 읽거나 수정하거나 별도의 작업을 수행하기 위해 커서 사용 
    ex) 커서로 회원 ID, 이름, 마일리지를 생성시키고 해당 회원의 성별까지 출력하시오.
    - 커서 사용 단계
         생성 (DECLARE) -> OPEN -> FETCH -> CLOSE(BEGIN)
    - 커서 선언 형식
        CURSOR 커서명 [(매개변수 타입)]
        IS
            SELECT 문;
            - '매개변수'에 값을 배정하는 곳은 OPEN 문에서 수행 
    - 실행 영역에서 사용형식
    (1) OPEN 커서명 (값 [,값,......]);
    (2) FETCH : 커서에 존재하는 데이터를 행단위로 읽어 변수에 저장
                    FETCH 커서명 INTO 변수명[,변수명,....];
                    - '변수'는 선언부에서 선언된 변수
                    - 커서문 내의 SELECT 문의 SELECT절에 기술된 컬럼의 순서와 갯수, 타입이 일치
                    - FETCH문은 반복문 안에 기술
    (3) CLOSE 커서명; 
        - 사용이 종료된 커서를 닫아줌
        - 한번 CLOSE되면 더 이상 OPEN 되지 않음
    
    (4) 커서 속성     
----------------------------------------------------------------------------------------------------
    커서명%ISOPEN -> 커서가 OPEN되었는지 여부
    커서명%FOUND -> 커서에 읽어올 자료가 있으면 (결과에 한행이라도 존재하면) 참, 없으면 반환
    커서명%NOTFOUND -> 커서명%FOUND 반대
    커서명%ROWCOUNT -> 커서 결과 집합에 존재하는 행의 수 
---------------------------------------------------------------------------------------------------
    묵시적 커서의 속성은 '커서명'대신 'SQL'이 사용    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    