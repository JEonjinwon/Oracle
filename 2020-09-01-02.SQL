2020-09-01-02)
�������ν���(Stored Procedure)
    - �����Ͻ� ������ ó���ϴ� ����� �ۼ��Ͽ� �������ϰ� �ش� ����� �ο��Ѱ����� �Լ�ó�� ȣ�� �� �� �ִ� ���� 
    - �����ϵ� ���ν����� ĳ�ø޸𸮿� ����Ǿ� ó�� �ӵ��� ������, ��Ʈ��ũ�� Ʈ���� ���� ȿ��
    - ����ڿ��� ���� ����� ���߱� ������ ����Ȯ��
    - ���ν����� ��ȯ���� ����.
    (�������) 
    CREATE [OR REPLACE] PROCEDURE ���ν�����[(
        ������ [���] Ÿ�Ը� [ := DEFAULT ��], -- Ÿ���� ũ�⸦ ���� ����, VARCHAR2(50) ��ȣ ���� ���� 
        ������ [���] Ÿ�Ը� [ := DEFAULT ��],
                                :
        ������ [���] Ÿ�Ը� [ := DEFAULT ��])]
    IS | AS
        ����;
    BEGIN
        ó����;��
        [EXCEPTION
            ����ó����;
     END;
    -  '������' : �Ű����������� ���� P_�� ����
    - ��� : IN -> �Է¿�, OUT -> ��¿�, INOUT -> ��/��� ����
                default�� IN�̴�, �����ϸ� IN���� ����
    - Ÿ�Ը� : �Ű������� Ÿ������ ũ�� ���� ���� 
    
    (���๮ �������)
    EXEC | EXECUTE ���ν�����[(�Ű�����|��, .....)];
    - PL/SQL���� ���ν��� ����� 'EXEC|EXECUTE'�� ����
 ��) ȸ�����̺����� 'd001'ȸ���� ȸ����ȣ�� �Է� �޾� ȸ����, �ּ�, ������ ����ϴ� ���ν��� �ۼ�
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
 
 ��) ��ǰ���̺����� �з��ڵ� 'P301'�� ���� ��ǰ�� ��ǰ��, �з��ڵ�, ���԰���, ���Ⱑ����
    ����ϴ� ���ν����� �ۼ��Ͻÿ�,.
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
 
 
��) 2005�� 6�� ���� ���� �Ǹŵ� ��ǰ�� ��ǰ�ڵ�� ������ �Է¹޾� 
    ������� ���̺��� �ش���ǰ������ ������ �����Ͻÿ�.
    (2005�� 6�� ���� �Ǹŵ� ��ǰ�� ��ǰ�ڵ�� ����)
SELECT CART_PROD,
        MAX(CART_QTY)
    FROM CART
    WHERE CART_NO LIKE '200506%'
    GROUP BY CART_PROD;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
    
        