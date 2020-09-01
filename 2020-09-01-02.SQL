2020-09-01-02)
저장프로시저(Stored Procedure)
    - 비지니스 로직을 처리하는 모듈을 작성하여 컴파일하고 해당 기능이 핑요한곳에서 함수처럼 호출 할 수 있는 단위 
    - 컴파일된 프로시져는 캐시메모리에 저장되어 처리 속도가 빠르고, 네트워크의 트래픽 감소 효과
    - 사용자에게 내부 모듈을 감추기 때문에 보안확보
    - 프로시저는 반환값이 없다.
    (사용형식) 
    CREATE [OR REPLACE] PROCEDURE 프로시저명[(
        변수명 [모드] 타입명 [ := DEFAULT 값], -- 타입의 크기를 쓰면 오류, VARCHAR2(50) 괄호 쓰면 오류 
        변수명 [모드] 타입명 [ := DEFAULT 값],
                                :
        변수명 [모드] 타입명 [ := DEFAULT 값])]
    IS | AS
        선언문;
    BEGIN
        처리문;ㄴ
        [EXCEPTION
            예외처리문;
     END;
    -  '변수명' : 매개변수명으로 보통 P_로 시작
    - 모드 : IN -> 입력용, OUT -> 출력용, INOUT -> 입/출력 공용
                default는 IN이다, 생략하면 IN으로 간주
    - 타입명 : 매개변수의 타입으로 크기 설정 안함 
    
    (실행문 사용형식)
    EXEC | EXECUTE 프로시저명[(매개변수|값, .....)];
    - PL/SQL에서 프로시져 실행시 'EXEC|EXECUTE'는 생략
 예) 회원테이블에서 'd001'회원의 회원번호를 입력 받아 회원명, 주소, 직업을 출력하는 프로시져 작성
 CREATE OR REPLACE PROCEDURE PROC_MEM01(
    P_MEM_ID IN MEMBER.MEM_ID%TYPE)
 IS 
    V_NAME MEMBER.MEM_NAME%TYPE;
    V_ADDR VARCHAR2(100);
    V_JOB MEMBER_JOB;
 BEGIN 
    SELECT MEM_NAME.MEM_ADD1||'  '||MEM_ADD2,
             MEM_JOB INTO V_NAME, V_ADDR, V_JOB
    FROM MEMBER
 WHERE MEM_ID = P_MEM_ID;
 DBMS_OUTPUT.PUT_LINE(V_NAME || ', '|| V_ADDR|| ', ' ||V_JOB );
 END;
 
 예) 상품테이블에서 분류코드 'P301'에 속한 상품의 상품명, 분류코드, 매입가격, 매출가격을
    출력하는 프로시져를 작성하시오,.
CREATE OR REPLACE PROCEDURE PROC_POD01(
    P_LGU IN PROD.PROD_LGU%TYPE
IS
    V_PNAME PROD.PROD_NAME%TYPE;
    V_LGU LPROD.LPROD_GU%TYPE;
    V_COST PROD.PROD_COST%TYPE;
    V_PRICE PROD.PROD_PROCE%TYPE;
    V_RES VARCHAR2(100);
 BEGIN 
    SELECT  PROD_NAME, PROD_LGU, PROD_COST, PROD_PRICE
        INTO V_PNAME, V_LGU, V_COST, V_PRICE
        FROM PROD
        WHERE PROD_LGU = P_LGU;
    V_RES:= V_PNAME||' '||V_LGU||' '||V_COST||' ' ||V_PRICE;
   DBMS_OUTPUT.PUT_LINE(V_RES);
    END;
    EXECUTE PROC_POD01 ('P301');
 
 
예) 2005년 6월 가장 많이 판매된 상품의 상품코드와 수량을 입력받아 
    재고수불 테이블에 해당제품에대한 제고를 수정하시오.
    (2005년 6월 많이 판매된 상품의 상품코드와 수량)
SELECT CART_PROD,
        MAX(CART_QTY)
    FROM CART
    WHERE CART_NO LIKE '200506%'
    GROUP BY CART_PROD;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
    
        