2020-08-31-01)
1. IF�� 
    - �ٸ� ���� ���α׷������ IF���� ���� ���
    (�������) 
    IF ���� THEN 
        ����1;
    [ELSE 
        ���� 2;]
    END IF; 
    
(������ IF)
    IF ����1 THEN
        ����1;
    ELSE ����2 THEN
        ����2;
    ELSIF ����3 THEN
        ����3;
    ELSE
        ����4;
    END IF;
(��ø IF)    
    IF ����1 THEN
        IF ����2 THEN
            ����1;
         ELSE 
            ����2;
        END IF;
   ELSE 
        ����3;
   END IF;     
  
 ��) ������ �μ��ڵ�(10~110)�� �ϳ� �����Ͽ� �ش�μ��� ���� ��� ������ ��ȸ�ϰ� 
      ù��° �˻��� ����� �޿��� 
      3000�̸��̸� '�����ӱ�',
      3000~6000 �̸� '�߰��ӱ�'
      �� �̻��̸� '�����ӱ�'�� ����Ͻÿ�.
      ����� �����ʹ� �����, �μ���, �޿�, ����̴�.
DECLARE --���� �����
    V_NAME EMPLOYEES.EMP_NAME%TYPE;
    V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    V_SAL EMPLOYEES.SALARY%TYPE;
    V_REMAK VARCHAR2(50);
    V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE;
BEGIN     
  V_DEPT_ID := ROUND(DBMS_RANDOM.VALUE(10,110),-1); --10���� 100���̿� �ִ� ������ ���� �߻� ,-1�ؼ� �����ڸ��� ���� 0
SELECT  A.EMP_NAME, B.DEPARTMENT_NAME, A.SALARY INTO V_NAME, V_DEPT_NAME, V_SAL        --INTO : ������ �Ѱ��ִ� ��
    FROM EMPLOYEES A, DEPARTMENTS B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
    AND A.DEPARTMENT_ID = V_DEPT_ID
    AND ROWNUM =1;
    
 IF V_SAL BETWEEN 1 AND 2999 THEN 
    V_REMAK :='�����ӱ�';
 ELSIF V_SAL BETWEEN 3000 AND 6000 THEN
    V_REMAK :='�����ӱ�';
 ELSE
    V_REMAK :='�����ӱ�';
 END IF;   
  
 DBMS_OUTPUT.PUT_LINE(V_NAME||', '||V_DEPT_NAME ||', '||V_SAL|| '=>'||V_REMAK);  
 
 END;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   