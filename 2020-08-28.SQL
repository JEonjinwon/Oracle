2020-08-28-01)PL/SQL 
    - Procedual language SQL�� ����
    - ������ ����� Ư¡�� ����, �б⹮, �ݺ���, ����ó�� ���� ����� ������ SQL
    - ��� �ڵ尡 DB���ο� �����ǰ� �����ϵǾ� ����Ǳ� ������ ���� �ӵ��� ������.
    - ��Ʈ��ũ�� Ʈ���� ����
    - ǥ�� ������ ����
    - Anonymous Block, Stored Procedure, User Defined Function, package
1. �͸� ���� 
    - �⺻���� PL/SQL�� ������ ����
    - �̸��� ���� ����
    (�⺻����)
    DECLARE
        �����(����, ���, Ŀ��)
    BEGIN
        �����(sql ������ �����Ͽ� �����Ͻ� ����ó��)
        [EXCEPTION ����ó��]
        
    END;
    
    
    
��) ������ ������ ���� �����ϰ� ¦������ Ȧ������ �����Ͽ� ����ϴ� �͸� ������ �ۼ��Ͻÿ�. 

    ACCEPT NUM1 PROMPT '���� �Է� :' -- ACCEPT(�Է� ����) ������ PROMPT �Է� �ȳ��� -> ���ڿ�Ÿ������ �޾ƿ�
  DECLARE
    V_NUM NUMBER := 0; -- �� �� ������ NUMBER�� �ʱ�ȭ�ض�. ����ڰ� �ʱ�ȭ���� ������ NULL�� �ʱ�ȭ�ȴ�. -> DATE, CHAR, VARCHARŸ�Ե� ����.
    V_MESSAGE VARCHAR2(100); -- �μ��� ����
  BEGIN
    V_NUM :=  TO_NUMBER('&NUM1'); -- ���ڿ� Ÿ���̹Ƿ� �ѹ�Ÿ������ ����ȯ
    IF MOD(V_NUM,2) = 0 -- ¦�����ϱ� 2�� ���� ������ ������ �Լ� MOD
    THEN V_MESSAGE := V_NUM || '�� ¦�� ��';
    ELSE V_MESSAGE := V_NUM || '�� Ȧ�� ��';
    END IF; -- IF���� ������ �˸�
    
    DBMS_OUTPUT.PUT_LINE(V_MESSAGE); -- �ڹ��� ��¹��� ���
    
    EXCEPTION WHEN OTHERS THEN -- ����ó��
        DBMS_OUTPUT.PUT_LINE('���ܹ߻�'||
            SQLERRM); -- SQL ERROR MESSAGE�� ����� ���� �������� �˷��ش�.
  END;
    
    
 ��) ȸ�����̺����� ȸ���� �۾��� �Է� �޾� ȸ�� ��ȣ, ȸ����, ���ϸ����� ����ϴ� �͸������ۼ�
 
ACCEPT A_JOB PROMPT '���� : '
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
    
    
2) ��� 
    - �ٸ� ���� ���α׷� ����� ��� ����� ����
3) Ŀ��    
    - SQL ������ ��� ����
    - ���� ����� �аų� �����ϰų� ������ �۾��� �����ϱ� ���� Ŀ�� ��� 
    ex) Ŀ���� ȸ�� ID, �̸�, ���ϸ����� ������Ű�� �ش� ȸ���� �������� ����Ͻÿ�.
    - Ŀ�� ��� �ܰ�
         ���� (DECLARE) -> OPEN -> FETCH -> CLOSE(BEGIN)
    - Ŀ�� ���� ����
        CURSOR Ŀ���� [(�Ű����� Ÿ��)]
        IS
            SELECT ��;
            - '�Ű�����'�� ���� �����ϴ� ���� OPEN ������ ���� 
    - ���� �������� �������
    (1) OPEN Ŀ���� (�� [,��,......]);
    (2) FETCH : Ŀ���� �����ϴ� �����͸� ������� �о� ������ ����
                    FETCH Ŀ���� INTO ������[,������,....];
                    - '����'�� ����ο��� ����� ����
                    - Ŀ���� ���� SELECT ���� SELECT���� ����� �÷��� ������ ����, Ÿ���� ��ġ
                    - FETCH���� �ݺ��� �ȿ� ���
    (3) CLOSE Ŀ����; 
        - ����� ����� Ŀ���� �ݾ���
        - �ѹ� CLOSE�Ǹ� �� �̻� OPEN ���� ����
    
    (4) Ŀ�� �Ӽ�     
----------------------------------------------------------------------------------------------------
    Ŀ����%ISOPEN -> Ŀ���� OPEN�Ǿ����� ����
    Ŀ����%FOUND -> Ŀ���� �о�� �ڷᰡ ������ (����� �����̶� �����ϸ�) ��, ������ ��ȯ
    Ŀ����%NOTFOUND -> Ŀ����%FOUND �ݴ�
    Ŀ����%ROWCOUNT -> Ŀ�� ��� ���տ� �����ϴ� ���� �� 
---------------------------------------------------------------------------------------------------
    ������ Ŀ���� �Ӽ��� 'Ŀ����'��� 'SQL'�� ���    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    