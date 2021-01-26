SELECT Y.*
FROM(
    SELECT ROWNUM RNUM,
        X.*
        FROM(
                SELECT 
                        A.LEC_CODE  ,
                        B.SUB_NAME  ,
                        C.MEM_NAME ,
                        A.LEC_FULL  ,
                        A.LEC_NMT ,
                        A.LEC_GRD ,
                        A.ROOM_CODE ,
                        B.SUB_DETAIL ,
                        B.SUB_CREDIT 
                       
                        
                FROM LECTURE A , SUBJECT B, MEMBER C
                WHERE 1=1
                
                AND A.SUB_CODE = B.SUB_CODE
                AND C.MEM_TYPE ='P'
                AND C.MEM_ID = A.MEM_ID
        )X)Y
WHERE RNUM  BETWEEN 1 AND 5









SELECT Y.* FROM( SELECT ROWNUM RNUM, X.* FROM( SELECT A.LEC_CODE , B.SUB_NAME , C.MEM_NAME 
, A.LEC_FULL , A.LEC_NMT , A.LEC_GRD , A.ROOM_CODE , B.SUB_DETAIL , B.SUB_CREDIT FROM LECTURE 
A , SUBJECT B, MEMBER C WHERE 1=1 AND A.SUB_CODE = B.SUB_CODE AND C.MEM_TYPE ='ROLE_PROFESSOR' AND C.MEM_ID 
= A.MEM_ID )X)Y WHERE RNUM BETWEEN 1 AND 5










SELECT Y.*
FROM(
                SELECT 
                        D.TLEC_NO ,
                        B.SUB_NAME  ,
                        C.MEM_NAME ,
                        A.LEC_FULL  ,
                        A.LEC_NMT ,
                        A.LEC_GRD ,
                        A.ROOM_CODE ,
                        B.SUB_DETAIL ,
                        B.SUB_CREDIT
                FROM LECTURE A , SUBJECT B, MEMBER C, TAKE_LEC D
                WHERE 1=1
                AND A.SUB_CODE = B.SUB_CODE
                AND C.MEM_TYPE ='ROLE_PROFESSOR'
                AND  D.MEM_ID= '1841010'
       )Y


        

수강코드	과목명	담당교수	정원	수강인원	개설학년	강의실	이수구분	학점



SELECT DISTINCT(A.LEC_CODE ), 
        C.SUB_NAME  AS 과목명,
        (
                    
                    ) X AS 교수명
        
            
FROM TAKE_LEC A, LECTURE B, SUBJECT C, MEMBER D
    WHERE A.MEM_ID ='1841010'
    AND A.LEC_CODE = B.LEC_CODE    
    AND B.SUB_CODE = C.SUB_CODE
    AND A.MEM_ID = D.MEM_ID
   









SELECT C.LEC_CODE 
    , B.SUB_NAME 
    , A.MEM_ID
    , C.LEC_FULL
    , C.LEC_NMT 
    , C.LEC_GRD 
    , C.ROOM_CODE 
    , B.SUB_DETAIL
    , B.SUB_CREDIT
FROM MEMBER A, SUBJECT B, LECTURE C, TAKE_LEC D
where D.mem_id = '1841010'
AND D.MEM_ID = A.MEM_ID
AND D.LEC_CODE = C.LEC_CODE
AND C.SUB_CODE = B.SUB_CODE





select CASE WHEN NULLABLE='N' AND (DATA_TYPE='VARCHAR2' OR DATA_TYPE='CHAR')
        THEN '@NotBlank'
        WHEN NULLABLE='N' AND DATA_TYPE = 'NUMBER' THEN '@NotNull @Min(0)'
        ELSE '' END
   || DECODE(DATA_TYPE, 'NUMBER', '', '@Size(max='||DATA_LENGTH||')')     
   ||  ' private '||
   DECODE( DATA_TYPE , 'NUMBER', 'Integer ', 'String ' )||
   LOWER(SUBSTR(  REPLACE(initcap(COLUMN_NAME),'_'),1,1))||
   SUBSTR(  REPLACE(initcap(COLUMN_NAME),'_'),2)||
  
  ';'
 ||'   //' || (SELECT comments FROM ALL_COL_COMMENTS
                                                        WHERE TABLE_NAME = 'TAKE_LEC'
                                                        AND COLUMN_NAME = A.COLUMN_NAME
                                                        )
from cols A
WHERE TABLE_NAME = 'TAKE_LEC'
ORDER BY COLUMN_ID;







DELETE FROM take_lec
WHERE mem_id ='1841010'
    AND   lec_code ='1000701'
  




commit





