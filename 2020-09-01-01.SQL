2020-09-01)
3-2 for ���� �̿��� cursor
    (�������)
    
    for ���ڵ�� in(subquery) loop
        ó����;
    end loop;
    - subquery : Ŀ����Ȱ�� �ϴ� sql
��) Ű����� ������ �Է� �޾� �ش� ������ ���� ȸ���� �̸�, ����, ���ϸ����� ����ϴ� Ŀ���� for���� �̿��Ͽ� �ۼ� 
ACCEPT P_JOB PROMPT '���� : '
DECLARE
 V_JOB MEMBER.MEM_JOB%TYPE;
 
 CURSOR CUR_MEM_JOB IS 
    SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
      FROM MEMBER
     WHERE MEM_JOB ='&P_JOB';
BEGIN
  FOR REC_MEM IN CUR_MEM_JOB LOOP
    DBMS_OUTPUT.PUT_LINE('ȸ���� : '||REC_MEM.MEM_NAME);
    DBMS_OUTPUT.PUT_LINE('���� : '||REC_MEM.MEM_JOB);
    DBMS_OUTPUT.PUT_LINE('���ϸ��� : '||REC_MEM.MEM_MILEAGE);
    END LOOP;
END;



** INLINE_FOR

ACCEPT P_JOB PROMPT '���� : '
DECLARE
 
 CURSOR CUR_MEM_JOB IS 
    SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
      FROM MEMBER
     WHERE MEM_JOB ='&P_JOB';
BEGIN
  FOR REC_MEM IN
                ( SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
                    FROM MEMBER
                    WHERE MEM_JOB ='&P_JOB')
    LOOP
    DBMS_OUTPUT.PUT_LINE('ȸ���� : '||REC_MEM.MEM_NAME);
    DBMS_OUTPUT.PUT_LINE('���� : '||REC_MEM.MEM_JOB);
    DBMS_OUTPUT.PUT_LINE('���ϸ��� : '||REC_MEM.MEM_MILEAGE);
    END LOOP;
END;

