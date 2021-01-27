		SELECT C.LEC_CODE 
		    , B.SUB_NAME 
            ,(SELECT A.MEM_NAME
            FROM MEMBER A , LECTURE B
            WHERE A.MEM_ID = B.MEM_ID
            AND B.LEC_CODE = '1000702')
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






SELECT A.MEM_NAME
    FROM MEMBER A , LECTURE B
    WHERE A.MEM_ID = B.MEM_ID
    AND B.LEC_CODE = '1000702'


SELECT D.TLEC_NO as 수강코드
    , B.SUB_NAME as 과목명
    , (SELECT MEM_NAME FROM MEMBER WHERE MEM_ID = C.MEM_ID) as 교수
    , C.LEC_FULL as 정원
    , C.LEC_NMT as 수강이누언
    , C.LEC_GRD as 개설학년
    , C.ROOM_CODE as 강의실
    , B.SUB_DETAIL as 이수구분
    , B.SUB_CREDIT as 학점
FROM MEMBER A, SUBJECT B, LECTURE C, TAKE_LEC D
where D.mem_id = '1841010'
AND D.MEM_ID = A.MEM_ID
AND D.LEC_CODE = C.LEC_CODE
AND C.SUB_CODE = B.SUB_CODE;






















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
                AND C.MEM_TYPE ='ROLE_PROFESSOR'
                AND C.MEM_ID = A.MEM_ID
                AND A.LEC_CODE IN(
                                SELECT LEC_CODE
                                    FROM LECTURE
                                    WHERE LEC_CODE
                                     NOT IN (SELECT A.LEC_CODE
                                                                    FROM LECTURE A , TAKE_LEC B
                                                                    WHERE B.MEM_ID = '1841010'
                                                                    AND A.LEC_CODE = B.LEC_CODE)
                )
        )X)Y




SELECT LEC_CODE
FROM LECTURE
WHERE LEC_CODE
 NOT IN (SELECT A.LEC_CODE
                                FROM LECTURE A , TAKE_LEC B
                                WHERE B.MEM_ID = '1841010'
                                AND A.LEC_CODE = B.LEC_CODE)









SELECT 






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
                                                        WHERE TABLE_NAME = 'INTEREST_LEC'
                                                        AND COLUMN_NAME = A.COLUMN_NAME
                                                        )
from cols A
WHERE TABLE_NAME = 'INTEREST_LEC'
ORDER BY COLUMN_ID;





INSERT INTO interest_lec (
    lec_code,
    mem_id
) VALUES (
    :v0,
    :v1
);













		SELECT C.LEC_CODE 
		    , B.SUB_NAME 
		    , (SELECT MEM_NAME FROM MEMBER WHERE MEM_ID = C.MEM_ID) AS MEM_NAME
		    , C.LEC_FULL 
		    , C.LEC_NMT 
		    , C.LEC_GRD 
		    , C.ROOM_CODE 
		    , B.SUB_DETAIL 
		    , B.SUB_CREDIT 
		FROM MEMBER A, SUBJECT B, LECTURE C
		WHERE D.MEM_ID = '1841010'
		AND D.MEM_ID = A.MEM_ID
		AND D.LEC_CODE = C.LEC_CODE
		AND C.SUB_CODE = B.SUB_CODE


SELECT * FROM INTEREST_LEC
WHERE MEM_ID ='1841010'




















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
                      
                FROM LECTURE A , SUBJECT B, MEMBER C, INTEREST_LEC D
                WHERE 1=1
                AND A.SUB_CODE = B.SUB_CODE
                AND C.MEM_TYPE ='ROLE_PROFESSOR'
                AND C.MEM_ID = A.MEM_ID
                AND A.LEC_CODE IN(
                                SELECT LEC_CODE
                                  FROM LECTURE
                                  WHERE LEC_CODE
                                   NOT IN (SELECT A.LEC_CODE
                                              FROM LECTURE A , TAKE_LEC B
                                              WHERE B.MEM_ID = '1841010'
                                              AND A.LEC_CODE = B.LEC_CODE)
                )
        )X)Y

  (SELECT LEC_CODE FROM INTEREST_LEC WHERE MEM_ID= '1841010') 
  
  
  
  
  
  
  
  
  
  
  
  
  
  SELECT Y.*
FROM(
    SELECT ROWNUM RNUM,
        X.*
        FROM(
                SELECT 
                        D.LEC_CODE  ,
                        B.SUB_NAME  ,
                        C.MEM_NAME ,
                        A.LEC_FULL  ,
                        A.LEC_NMT ,
                        A.LEC_GRD ,
                        A.ROOM_CODE ,
                        B.SUB_DETAIL ,
                        B.SUB_CREDIT 
                                             
                FROM LECTURE A , SUBJECT B, MEMBER C, INTEREST_LEC D
                WHERE 1=1
                
                AND A.SUB_CODE = B.SUB_CODE
                AND C.MEM_TYPE ='ROLE_PROFESSOR'
                AND C.MEM_ID = A.MEM_ID
                AND A.LEC_CODE = D.LEC_CODE
                AND D.MEM_ID ='1841010'
                AND A.LEC_CODE IN(
                                SELECT LEC_CODE
                                    FROM LECTURE
                                    WHERE LEC_CODE NOT IN (SELECT A.LEC_CODE
                                                                    FROM LECTURE A , TAKE_LEC B
                                                                    WHERE B.MEM_ID = '1841010'
                                                                    AND A.LEC_CODE = B.LEC_CODE)
                )               
        )X)Y
  
  
  
  
  
  
  
  
  
  