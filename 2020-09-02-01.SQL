2020-09-02-01)
TRIGGER
    -  어떤 이벤트가 발생하며 자동적으로 실행되는 프로시져의 일종
    (사용형식)
    CREATR [OR REPLACE] TRIGGER 트리거명 
        BEFORE | AFTER    INSERT | UPDATE | DELETE
        ON 테이블명
        [FOR EACH ROW]
        [WHERE 조건]  
    BEGIN
        명령문(들);
    END;
    
    1) 트리거 유형
         (1) 문장 단위 트리거 : 이벤트가 발생되었을 때 한번만 트리거 발생 .
            'FOR EACH ROW'생략 :NEW, :OLD와 같은 의사 레코드(수도 레코드) 사용 불가 
         (2) 행단위 트리거 : 이벤트에 의해 여러 행이 영향 받는 경우 각 행마다 트리거 발생.
            'FOR EACH ROW' 기술해야 하고,  :NEW, :OLD와 같은 의사 레코드(수도 레코드) 사용 가능.
            **하나의 트리거가 종료되지 않은 상태에서 다른 트리거 호출 불가 
            --어떤 특정 명령에 의해 영향 받은 행들의 집합 -> 커서 
            
    2)트리거 조건 
        - 행단위 트리거에서만 사용 가능 
        - 이벤트가 발생된 때 보다 구체적인 데이터 검색 조건 부여할 때 기술 
        --WHEN 트리거 조건 
        
예) 분류테이블에 새로운 분류를 입력 하라. 
    입력된 후 '새로운 분류코드가 입력됨'을 출력하는 트리거를 작성하시오.
(새로운 분류코드)
    LPROD_ID : 10;
    LPROD_GU : 'P501'
    LPROD_NM : '농산물'
(event)
INSERT INTO LPROD VALUES(10,'P501','농산물');
SELECT * FROM LPROD;
(trigger)
    CREATE OR REPLACE TRIGGER TG_LPROD01
    AFTER  INSERT  ON LPROD
    BEGIN
    DBMS_OUTPUT.PUT_LINE('새로운 분류코드가 입력됨');
    END;


**퇴직자 정보를 저장하는 테이블을 생성하시오 
 테이블명 : RETIRE
 속성 
 EMPLOYEE_ID    NUMBER(6,0)         FK/PF
 EMP_NAME VARCHAR2(80 BYTE)     FK
 DEPARTMENT_ID NUMBER(6,0)        FK
 JOB_ID VARCHAR2(10 BYTE)           FK
 R__DATE    DATE        
 
CREATE TABLE RETIRE(
    EMPLOYEE_ID NUMBER(6,0),
    EMP_NAME VARCHAR2(80),
    DEPARTMENT_ID NUMBER(6,0),
    JOB_ID VARCHAR2(10),
    R_DATE DATE NOT NULL,
  CONSTRAINT PK_RETIRE
                        PRIMARY KEY (EMPLOYEE_ID),
  CONSTRAINT FK_RETIRE 
                        FOREIGN KEY (EMPLOYEE_ID)
  REFERENCES EMPLOYEES ( EMPLOYEE_ID
  
  DROP TABLE RETIRE;
  
  SELECT * FROM RETIRE;
  
 
 
        
    
    
    
예) 사원번호 105번 사원을 퇴직 처리하시오.    
    단 퇴직자는 사원테이블에서 삭제학고 퇴직자 정보를 퇴직자테이블 (RETIRE)에 보관하시오.
    CREATE OR REPLACE TRIGGER TG_RETIRE01
    BEFORE DELETE ON  EMPLOYEES 
    FOR EACH ROW
   BEGIN 
    INSERT INTO RETIRE (EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID, JOB_ID, R_DATE)
    VALUES (:OLD.EMPLOYEE_ID, :OLE.EMP_NAME, :OLD.DEPARTMENT_ID, :OLD.JOB_ID, SYSDATE);
    --:OLE 한레코드를 지칭 
END;
(이벤트)

DELETE EMPLOYEES
    WHERE EMPLOYEE_ID = 105;
    SELECT * FROM RETIRE;
    
    
예 ) 오늘이 2005년 9월 1일 이라고 가정하고 제품코드'P201000007'인 상품을 회원번호가 'r001'인 
   회원이 5개 구매 했다고 하자 CART테이블에 해당 데이터를 추가하고 재고 수불 테이블을 변경하시오.
   (트리거 생성)
CREATE OR REPLACE TRIGGER TG_REMAIN_02
AFTER INSERT ON CART 
FOR EACH ROW
DECLARE
    V_QTY NUMBER :=0;
    V_PROD_ID PROD.PROD_ID%TYPE;

BEGIN
    V_QTY := :NEW.CART_QTY;
    V_PROD_ID := :NEW.CART_PROD;
UPDATE REMAIN
    SET REMAIN_O=REMAIN_O+V_QTY,
        REMAIN_J_99=REMAIN_J_99-V_QTY,
        REMAIN_DATE = TO_DATE('20050801')
    WHERE REMAIN_YEAR ='2005'
    AND REMAIN_PROD = V_PROD_ID;
    
    COMMIT;
    END;
(이벤트)
INSERT INTO CART
    VALUES('r001', '20050801000001', 'P201000007', 5)
    
SELECT * FROM REMAIN
WHERE REMAIN_PROD ='P201000007'
    AND REMAIN_YEAR = '2005';
    
    
 **의사(pseudo) 레코드
 -행단위 트리거
 :NEW    INSERT, UPDATE문에 사용.
            데이터가 삽입(갱신)될 때 새로들어온 값 DELETE에는 모든 값이 NULL이다.
 :OLD     DELETE, UPDATE문에 사용
            데이터가 삭제(갱신)될 때 존재하고 있는 값 DELETE에는 모든 값이 NULL이다.
    
 **트리거 함수 
1) INSERTING : 트리거 문장이(이벤트) INSERT이면 참 
2) UPDATING : 트리거 문장이(이벤트) UPDATE이면 참 
3) DELETING : 트리거 문장이(이벤트) DELETE이면 참   
    
    
    
    
    
    
    
    
    
    