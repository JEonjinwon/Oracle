2020-09-03-01)
����Ŭ ��ü 
    - view, sequence, synonym, index���� ������
1.view ��ü
    - ������ ���̺�
    - �˻������� ��� ����
    - �ʿ��� ������ �ټ��� ���̺��� �����ϴ� ���
    - Ư�� �ڷῡ ���� ��������(���ȼ� Ȯ��)
    (�������)
CAREATE [OR REPLACE] [FORCE | NOFORCE] VIEW
    ���̸� [�÷� LIST]
AS
    SELECT ����;
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    - FORCE : ���� ���̺��� ��� VIEW ����, default�� NOFORCE�̴�.
    - '�÷�LIST' : �����Ǵ� ���� �÷��� , �����Ǹ� ���� ���̺��� �÷����� ���
    - 'WITH CHECK OPTION' : SELECT������ ������ �ο��Ͽ� VIEW�� ������ ��� �� ���ǿ� ���� �ʴ� VIEW�� ����(UPDATE)�� INSERT�� ���� 
��)ȸ�� ���̺����� ���ϸ����� 3000DLTKDDLS ȸ���� ȸ����, ����, ���ϸ����� ��ȸ�ϰ� ����� VIEW�� ����
CREATE OR REPLACE VIEW V_MEN
 AS 
    SELECT MEM_NAME AS ȸ����,
            MEM_JOB AS ����,
            MEM_MILEAGE AS ���ϸ���
    FROM MEMBER 
    WHERE MEM_MILEAGE>=1000;


SELECT * FROM V_MEN;

UPDATE V_MEM
    SET ���ϸ��� =4700
WHERE ȸ���� = '��ö��';

��)2005�� 7�� ȸ���� ���������� ��ȸ�Ͻÿ�.
    Alias�� ȸ����, ���ż����հ�, ���űݾ��հ�, ��, ����� ��� �����Ͻÿ�
SELECT    B.MEM_NAME AS ȸ����,
                    SUM(A.CART_QTY) AS ���ż����հ�, 
                  SUM(A.CART_QTY*C.PROD_PRICE) AS ���űݾ��հ�
    FROM CART A, MEMBER B, PROD C
    WHERE A.CART_MEMBER = B.MEM_ID
        AND A.CART_PROD = C.PROD_ID
        AND A.CART_NO LIKE '200507%'
    GROUP BY B.MEM_NAME;
    
 (�����)
 CREATE OR REPLACE VIEW V_CART01(
    MNAME, SUM_CNT, SUM_MONEY) --VIEW �� �����Ǵ� ���� �÷���
    AS 
        SELECT    B.MEM_NAME AS ȸ����,
                      SUM(A.CART_QTY) AS ���ż����հ�, 
                      SUM(A.CART_QTY*C.PROD_PRICE) AS ���űݾ��հ�
        FROM CART A, MEMBER B, PROD C
         WHERE A.CART_MEMBER = B.MEM_ID
            AND A.CART_PROD = C.PROD_ID
          AND A.CART_NO LIKE '200507%'
        GROUP BY B.MEM_NAME;
    
 SELECT * FROM V_CART01;   
    
    
SELECT MEM_ID,MEM_NAME, MEM_MILEAGE
  FROM MEMBER
 WHERE MEM_MILEAGE <= 1000;
  
  
  
ȸ�����̺����� ���ϸ����� 1000 ������ ȸ���鿡�� 3000�� �߰����ϸ����� �����Ͻÿ� 

UPDATE MEMBER
   SET MEM_MILEAGE = MEM_MILEAGE + 3000 
 WHERE MEM_MILEAGE <= 1000;
  
  
SELECT *FROM V_MEM;


UPDATE V_MEM
   SET ���ϸ��� = 2500
 WHERE ȸ���� = '�ſ�ȯ';
 
 
 
 
UPDATE V_MEM
   SET ���ϸ��� = 2500
 WHERE ȸ���� = '������'; --���� ORA-01402: view WITH CHECK OPTION where-clause violation
                        --������ 3õ �̻��� ����鸸 �並 ����µ�, 2500���� �ٲٸ� �� �信 �ҼӵǾ� ���� ���� 
                        
                        
                        
** ���� ����
  - ��������(WITH �� ����)�� �ִ� VIEW���� ORDER BY�� ������
  - �䰡 GROUP BY, DISTINCT �� ����Ͽ� ������ ��� INSERT,UPDATE,DELETE �� ����� �� ����
  - ǥ���� �Ǵ� �Լ�(�Ϲ�)�� ����Ͽ� �䰡 ������ ��� �ش� �÷��� ������ �� ����.
  - CREATE , NEXTNVL ���� �ǻ緹�ڵ�� ����� �� �̾���,��
  - ROWINM ROWNUM ���� ��ħ�ø� ���    
    
    
    
SEQUENCE
    - ���������� ���� �Ǵ� �����ϴ� ���� �����ϴ� ��ü
    - ���̺��� �⺻Ű �׸��� ������ �÷��̾��°�� �ַ� ���
    (�������)
    CREATE [OR REPLACE] SEQUENCE �������� 
    [SEQUENCE WITH ��]
    [INCREMENT BY ��]
    [MAXVALUE �� | NOMAXVALUE]
    [MINVALUE �� | NOMINVALUE]
    [CYCLE | NOCYCLE]
    [CACHE | NOCACHE]
    [ORDER | NOORDER];
    



SYNONYM(���Ǿ�)
    - ����Ŭ�� ���Ǵ� ��ü�� �ο��ϴ� ��Ī
    (�������)
    CREATE [OR REPLACE] SYNONYM ��Ī
    FOR ��ä��;
    
INDEX    
    - �˻��� ȿ�������� �����ϱ� ���� ��ü
    1) �ε����� �ʿ��� �÷�
        - ���� �˻��Ͼ��ϴ� �÷�
        - WHERE ������ �������('=')�� ����ϴ� �÷�
        - �⺻Ű�� �ܷ�Ű
        - ����(�������ǿ� ���)�̳� ����(ORDER BY)�� ���Ǵ� �÷�
        
    2) �ε����� ����
        (1)Unique/Non-Unique
            - �ߺ����� ����ϴ��� ���ο� ���� �з�
            - Non-Unique�� �ߺ� �� ���
            - NULL�� ��밡���ϳ� (�⺻Ű�� �ܷ�Ű �ε����� ����) �ѹ��� ���
        (2)�ڵ� index
            - ���̺� ������ pk, Unique ���Ǻο��� ���� 
        (3)Normal Index (B-Tree Index)
            - Default Index
            - Ʈ������ ���
            - ROWID(������ �ּ�)�� �÷� ���� �����Ͽ� ����� �ּ� ���
        (4)Bitmap Index
            - ���������� ���� ��� ȿ����
            - �ڷắ��(�߰�, ����, ����)�� ���� ��� ��ȿ�� 
            - ROWID�� �÷� ���� �������� ������ �ּ� ���
        (5)Function-Based Index
            - �Լ��� ���� �÷��� �ε����÷����� ���� �Ѱ�� 
            -  �������� �Լ������ ���� ��� ȿ����
      (�������)
      CREATE [UNIQUE | BITMAP] INDEX �ε����� 
        ON ���̺��� (�÷���[, �÷���, ....][ASC | DESC];
        































