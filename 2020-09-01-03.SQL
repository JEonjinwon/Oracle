2020-09-01-03)
**OUT �Ű�����
    - ������ BLOCK�� ��� 
��) ȸ����ȣ�� �Է� �޾� �̸��� ������ ����ϴ� ���ν��� �ۼ�
    (��, �̸��� ������ OUT �Ű����� ���)
CREATE OR REPLACE PROCEDURE PROC_MEM03(
    P_MEM_ID IN MEMBER.MEM_ID%TYPE,
    P_NAME OUT MEMBER.MEM_NAME%TYPE,
    P_JOB OUT MEMBER.MEM_JOB%TYPE)
   IS
   BEGIN
SELECT  MEM_NAME, MEM_JOB            --�Ѱ��ٰ�
        INTO  P_NAME, P_JOB                --�Ѱ��ִ°� INTO
FROM MEMBER
 WHERE MEM_ID = P_MEM_ID;
END;

DECLARE 
    V_NAME MEMBER.MEM_NAME%TYPE;
    V_JOB MEMBER.MEM_JOB%TYPE;
BEGIN
    --EXEC PROD_MEM02('g001', :V_NAME,:V_JOB);
    --SQL�� �ڵ����� LINE
    DBMS_OUTPUT.PUT_LINE('ȸ���� : '||V_NAME );
    DBMS_OUTPUT.PUT_LINE('���� : '||V_JOB);
    END;
    
    
    
2020-09-01-04)
����� ���� �Լ� (USER DEFINED FUNCTION)
    - ��ȯ(�ϳ�) ���� ���� 
    - ��ȯ�Ǵ���ġ�� �Լ� ȣ�⹮�� ��ġ
    - ��������� PROCEDURE�� ����
    (�������)
    CREATE [OR REPLACE] FUNCTION �Լ��� [(
    �Ű���� IN|OUT|INOUT Ÿ�Ը� [ := default ��],
                            :
    �Ű���� IN|OUT|INOUT Ÿ�Ը� [ := default ��],
    
    RETURN Ÿ�Ը�   --������ �ƴϰ� Ÿ�Ը�
    
    IS| AS 
    BEGIN 
        RETURN ���� | �� | ���� ;  -- Ÿ�Ը��ϰ� ��ġ�ؾ��Ѵ�.
    END;
    
 ��) ȸ����ȣ�� �Է¹޾� ���̸� ��ȯ�ϴ� �Լ��� �ۼ��Ͻÿ� 
CREATE OR REPLACE FUNCTION FN_MEM01(
    P_MEM_ID MEMBER.MEM_ID%TYPE)
    RETURN NUMBER   --Ÿ�Ը��� ���� ũ���������� �ʰ� 
 IS 
    V_AGE NUMBER :=0; --�ʱ�ȭ �ݵ�� �ؾ��Ѵ� ���ϸ� ����
BEGIN
    SELECT EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM MEM_BIR) 
            INTO V_AGE
        FROM MEMBER
      WHERE MEM_ID = P_MEM_ID; 
    EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('�����߻� : ' || SQLERRM);
        RETURN NULL;     --EXCEPTION ���� ��ߵȴ� FUNCTION����
RETURN V_AGE;    
END;
    
(����)
SELECT MEM_ID AS ȸ����,
        FM_MEM_01(MEM_ID) AS ����,
        MEM_JOB AS ���� ,
        MEM_MILEAGE AS ���ϸ���
    FROM MEMBER
 WHERE    FM_MEM_01(MEM_ID) >=50;
 

    
    
    
    
    
    
    
    
    