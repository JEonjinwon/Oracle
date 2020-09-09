2020-09-02-01)
TRIGGER
    -  � �̺�Ʈ�� �߻��ϸ� �ڵ������� ����Ǵ� ���ν����� ����
    (�������)
    CREATR [OR REPLACE] TRIGGER Ʈ���Ÿ� 
        BEFORE | AFTER    INSERT | UPDATE | DELETE
        ON ���̺���
        [FOR EACH ROW]
        [WHERE ����]  
    BEGIN
        ���ɹ�(��);
    END;
    
    1) Ʈ���� ����
         (1) ���� ���� Ʈ���� : �̺�Ʈ�� �߻��Ǿ��� �� �ѹ��� Ʈ���� �߻� .
            'FOR EACH ROW'���� :NEW, :OLD�� ���� �ǻ� ���ڵ�(���� ���ڵ�) ��� �Ұ� 
         (2) ����� Ʈ���� : �̺�Ʈ�� ���� ���� ���� ���� �޴� ��� �� �ึ�� Ʈ���� �߻�.
            'FOR EACH ROW' ����ؾ� �ϰ�,  :NEW, :OLD�� ���� �ǻ� ���ڵ�(���� ���ڵ�) ��� ����.
            **�ϳ��� Ʈ���Ű� ������� ���� ���¿��� �ٸ� Ʈ���� ȣ�� �Ұ� 
            --� Ư�� ���ɿ� ���� ���� ���� ����� ���� -> Ŀ�� 
            
    2)Ʈ���� ���� 
        - ����� Ʈ���ſ����� ��� ���� 
        - �̺�Ʈ�� �߻��� �� ���� ��ü���� ������ �˻� ���� �ο��� �� ��� 
        --WHEN Ʈ���� ���� 
        
��) �з����̺��� ���ο� �з��� �Է� �϶�. 
    �Էµ� �� '���ο� �з��ڵ尡 �Էµ�'�� ����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�.
(���ο� �з��ڵ�)
    LPROD_ID : 10;
    LPROD_GU : 'P501'
    LPROD_NM : '��깰'
(event)
INSERT INTO LPROD VALUES(10,'P501','��깰');
SELECT * FROM LPROD;
(trigger)
    CREATE OR REPLACE TRIGGER TG_LPROD01
    AFTER  INSERT  ON LPROD
    BEGIN
    DBMS_OUTPUT.PUT_LINE('���ο� �з��ڵ尡 �Էµ�');
    END;


**������ ������ �����ϴ� ���̺��� �����Ͻÿ� 
 ���̺��� : RETIRE
 �Ӽ� 
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
  
 
 
        
    
    
    
��) �����ȣ 105�� ����� ���� ó���Ͻÿ�.    
    �� �����ڴ� ������̺����� �����а� ������ ������ ���������̺� (RETIRE)�� �����Ͻÿ�.
    CREATE OR REPLACE TRIGGER TG_RETIRE01
    BEFORE DELETE ON  EMPLOYEES 
    FOR EACH ROW
   BEGIN 
    INSERT INTO RETIRE (EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID, JOB_ID, R_DATE)
    VALUES (:OLD.EMPLOYEE_ID, :OLE.EMP_NAME, :OLD.DEPARTMENT_ID, :OLD.JOB_ID, SYSDATE);
    --:OLE �ѷ��ڵ带 ��Ī 
END;
(�̺�Ʈ)

DELETE EMPLOYEES
    WHERE EMPLOYEE_ID = 105;
    SELECT * FROM RETIRE;
    
    
�� ) ������ 2005�� 9�� 1�� �̶�� �����ϰ� ��ǰ�ڵ�'P201000007'�� ��ǰ�� ȸ����ȣ�� 'r001'�� 
   ȸ���� 5�� ���� �ߴٰ� ���� CART���̺��� �ش� �����͸� �߰��ϰ� ��� ���� ���̺��� �����Ͻÿ�.
   (Ʈ���� ����)
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
(�̺�Ʈ)
INSERT INTO CART
    VALUES('r001', '20050801000001', 'P201000007', 5)
    
SELECT * FROM REMAIN
WHERE REMAIN_PROD ='P201000007'
    AND REMAIN_YEAR = '2005';
    
    
 **�ǻ�(pseudo) ���ڵ�
 -����� Ʈ����
 :NEW    INSERT, UPDATE���� ���.
            �����Ͱ� ����(����)�� �� ���ε��� �� DELETE���� ��� ���� NULL�̴�.
 :OLD     DELETE, UPDATE���� ���
            �����Ͱ� ����(����)�� �� �����ϰ� �ִ� �� DELETE���� ��� ���� NULL�̴�.
    
 **Ʈ���� �Լ� 
1) INSERTING : Ʈ���� ������(�̺�Ʈ) INSERT�̸� �� 
2) UPDATING : Ʈ���� ������(�̺�Ʈ) UPDATE�̸� �� 
3) DELETING : Ʈ���� ������(�̺�Ʈ) DELETE�̸� ��   
    
    
    
    
    
    
    
    
    
    