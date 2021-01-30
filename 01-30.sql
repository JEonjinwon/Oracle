SELECT
            A.LEC_CODE AS 과목코드,
            B.SUB_DETAIL AS 이수구분,
            B.SUB_NAME AS 과목명,
            B.SUB_CREDIT AS 학점 ,
            C.LTIME_DAY AS 요일,
            A.LEC_GRD AS 학년,
            A.LEC_FULL AS 정원,
            C.LTIME_START AS 시작시간,
            C.LTIME_END AS 끝시간,
            C.ROOM_CODE AS 강의실, 
            D.MEM_NAME AS  교수명,
            D.MEM_TEL AS 전화번호,
            D.MEM_MAIL AS 이메일,
            A.LEC_MBK AS 주교재,
            A.LEC_SBK AS 부교재
FROM LECTURE A,  SUBJECT B, LECTURE_TIME C, MEMBER D
   WHERE A.LEC_CODE = '1000102'
   AND A.SUB_CODE = B.SUB_CODE
    AND A.LEC_CODE = C.LEC_CODE
    AND A.MEM_ID = D.MEM_ID
    ; 