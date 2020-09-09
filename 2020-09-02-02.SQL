2020-09-02-03)
PACKAGE
    - ������ �������� �ִ� PL/SQL�� ����, ���, Ŀ��, ����, �Լ�, ���ν��� ���� ���� ���� ��ü 
    - �Լ�, ���ν����� �ٸ���
1) ���ȭ ��� ����
    - ���� �������� �����ϴ� �Լ�, ���ν��� �� �������α׷��� ���� ó���ϱ⶧���� ���ȭ ���� 
    ex) ����鿡 ���Ѿ���(���, ���, �μ��̵� ��)�� ���� ���� �ʿ��� ������ ���������� ó��
2) ���α׷� ���� ���̼� 
    - ��Ű���� ����ο� ����η� ������ ���� 
    - ����ο����� �巡 ����� �Լ�, ���ν���, ���� ���� ���� ���
3) ĸ��ȭ ���� 
    
    1. ��Ű�� �����
        - ��Ű���� ���� ����
        - ����, ���, ���� �� �������α׷��� ���� 
    (�������)
    CREATE [OR REPLACE] PACKAGE ��Ű����
    IS
    ��������;
    �������;
    Ŀ������;
        FUNCTION �Լ���(�Ű����� ����)
            RETURN Ÿ��;
            
       PROCEDURT ���ν�����(�Ű����� ����);
                        :
    END ��Ű���� ;                    
    
 2. ��Ű�� �����  
    - ����ο��� ����� �Լ��� ���ν����� ����
    (�������)
    CREATE [OF REPLACE] PACKAGE BODY ��Ű����
    IS
        ����, ���,  Ŀ������ �ٹ�;
    FUNCTION �Լ���(�Ű����� ����)
    RETURN Ÿ��
    IS
        ����, ���, Ŀ��;
    BEGIN
        SQL ����;
     END GKATNAUD ;
     
    PROCEDURE ���ν����� (�Ű����� ����)
    IS
      ����, ���, Ŀ��;
    BEGIN
        SQL ����;
     END ���ν�����;
   END ��Ű����; 
    **��Ű�� �̸��� ���� pg_�Ǵ� ���̻�� _pkg�� ��� 
 ��) ����� �μ� ���� ���̺��� ����� �����Ͻ� ����
     (�����ȣ�� �̿��� �̸��˻�, �űԻ�� ��α� ������ó��)�� ó���ϴ� ��Ű�� 
  (�����)
  CREATE OR REPLACE PACKAGE em_pkg
  IS
    --�����ȣ�� �̿��� �̸� �˻� �Լ� ����
    FUNCTION fn_get_name(P_ID = EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2 --ũ�� ���� ����
    --�ű� ��� ���
    PROCEDURE new_emp_reg(
        P_EMP_NAME EMPLOYEES.EMP_NAME%TYPE,
        P_DATE IN DATE);
    --���� ó��
    PROCEDURE ret_emp(
    P_EMP_ID IN  EMPLOYEES.EMPLOYEE_ID%TYPE);
    END;
      
(�����)
CREATE OR REPLACE PACKAGE BODY em_pkg
 IS
    FUNCTION fn_get_name( P_ID = EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2
IS
    V_EMP_NAME EMPLOYEES.EMP_NAME%TYPE;
 BEGIN
    SELECT EMP_NAME INTO V_EMP_NAME
        FROM EMPLOYEES 
        WHERE EMPLOYEE_ID = P_ID;
        RETURN NVL(V_EMP_NAME,'�ش� ��� ����');
    END fn_get_name;
    
    PROCEDURE new_emp_reg(
        P_EMP_NAME EMPLOYEES.EMP_NAME%TYPE,
        P_DATE IN DATE);
IS 
    V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    -- ��� ��ȣ ���� 
SELECT MAX(EMPLOYEE_ID) +1 INTO 
         V_EMP_ID
  FROM EMPLOYEES;
   -- ��� ��� 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, EMP_NAME, HIRE_DATE,SALARY)
    VALUES(V_EMP_ID, P_EMP_NAME, P_DATE,3500)
    COMMIT;
END  new_emp_reg;
--������ ó�� 
 PROCEDURE ret_emp(
    P_EMP_ID IN  EMPLOYEES.EMPLOYEE_ID%TYPE)
IS 
    UPDATE EMPLOYEES
        SET RETIRE_DATE = SYSDATE
    WHERE EMPLOYEE_ID = P_EMP_ID;
    COMMIT;
END ret_emp;
END em_pkg;

(����)
1. �����ȣ�� �ش��ϴ� ����� ��� 
SELECT em_pkg.FN_GET_NAME(200)
    FROM DUAL;

2. ��� ����� ����� ��� 
SELECT EMPLOYEE_ID AS �����ȣ,
EM_PKG.FN_GET_NAME(EMPLOYEE_ID) AS ����� 
FROM EMPLOYEES;

3. �űԻ�� ���
EXEC EM_PKG.NEW_emp_reg('ȫ�浿', SYSDATE);
SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE EMP_NAME 'ȫ�浿';







