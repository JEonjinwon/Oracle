2020-08-27-02)
**���� ���ǿ� �´� ������� ���̺��� �����Ͻÿ�.
    - ���̺��� : REMAIN
    
     �÷���                 ������Ÿ��              NULLABLE           ������� 
    ------------------------------------------------------------------------------
    REMAIN_YEAR         CHAR(4)                 NOT NULL            PK
    REMAIN_PROD        VARCHAR2(10)        NOT NULL            PK, FK
    REMAIN_J_00          NUMBER(5)
    REMAIN_I              NUMBER(5) 
    REMAIN_O             NUMBER(5)
    REMAIN_J_99          NUMBER(5)
    REMAIN_DATE         DATE
    ------------------------------------------------------------------------------
     REMAIN_J_99 = REMAIN_J_00  +  REMAIN_I - REMAIN_O  
     �⸻���� = �������� + �԰� - ��� 
     
CREATE TABLE REMAIN(
    REMAIN_YEAR         CHAR(4),                
    REMAIN_PROD        VARCHAR2(10),       
    REMAIN_J_00          NUMBER(5),
    REMAIN_I              NUMBER(5),
    REMAIN_O             NUMBER(5),
    REMAIN_J_99          NUMBER(5),
    REMAIN_DATE         DATE,
    CONSTRAINT PK_REMAIN
         PRIMARY KEY(REMAIN_YEAR, REMAIN_PROD),
    CONSTRAINT FK_REMAIN FOREIGN KEY(REMAIN_PROD) REFERENCES PROD(PROD_ID));
    
**REMAIN ���̺��� ���� ���ǿ� �µ��� �ڷḦ PROD ���̺��� ���� �Է��Ͻÿ�
    -���������� ���� INSERT������ �ϰ��Է�
    **���������� INSERT��ų�� 'VALUES'�� '()'�� ����
 INSERT INTO REMAIN(REMAIN_YEAR, REMAIN_PROD, REMAIN_J_00,
                    REMAIN_I, REMAIN_O, REMAIN_J_99, REMAIN_DATE)
      SELECT '2005', PROD_ID, PROD_PROPERSTOCK, 0,0,PROD_PROPERSTOCK, '20050103'
        FROM PROD;

SELECT * FROM REMAIN;
    
**���̺� ���� 
CREATE TABLE REMAIN1  AS SELECT

2.UPDATE
    �����÷� UPDATE - �Ѱ��� ������ UPDATE 
      UPDATE ���̺��� 
     SET �÷��� = ��[,
         �÷��� = ��,
            :
         �÷��� = ��]
[WHERE ����];
    
 OR 
 
 UPDATE ���̺��� 
        SET (�÷���1, �÷���2, .......,�÷���n) = (��1, ��2 ��3,.......,��n)
    [WHERE ����];
    
2)�ϰ� UPDATE ó�� -> �������� ��� 
UPDATE ���̺��� 
        SET(�÷���1,...) = (��������)
- '(�÷���1,....)'�� �÷��� ���� �� ������ ���������� SELECT���� �÷��� ���� �� ������ ��ġ �ؾ� �Ѵ�.        

��) 2005�� 1�� �԰���ǰ����ȸ�Ͽ� ������� ���̺� ���� �����Ͻÿ�. 
     SELECT BUY_PROD, SUM(BUY_QTY)
     FROM BUYPROD
     WHERE BUY_DATE BETWEEN TO_DATE('20050101','YYYY/MM/DD') AND TO_DATE('20050131','YYYY/MM/DD')
     GROUP BY BUY_PROD;
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    