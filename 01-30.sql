SELECT
            A.LEC_CODE AS �����ڵ�,
            B.SUB_DETAIL AS �̼�����,
            B.SUB_NAME AS �����,
            B.SUB_CREDIT AS ���� ,
            C.LTIME_DAY AS ����,
            A.LEC_GRD AS �г�,
            A.LEC_FULL AS ����,
            C.LTIME_START AS ���۽ð�,
            C.LTIME_END AS ���ð�,
            C.ROOM_CODE AS ���ǽ�, 
            D.MEM_NAME AS  ������,
            D.MEM_TEL AS ��ȭ��ȣ,
            D.MEM_MAIL AS �̸���,
            A.LEC_MBK AS �ֱ���,
            A.LEC_SBK AS �α���
FROM LECTURE A,  SUBJECT B, LECTURE_TIME C, MEMBER D
   WHERE A.LEC_CODE = '1000102'
   AND A.SUB_CODE = B.SUB_CODE
    AND A.LEC_CODE = C.LEC_CODE
    AND A.MEM_ID = D.MEM_ID
    ; 