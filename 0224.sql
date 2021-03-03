
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
                                                        WHERE TABLE_NAME = 'ISSUED'
                                                        AND COLUMN_NAME = A.COLUMN_NAME
                                                        )
from cols A
WHERE TABLE_NAME = 'ISSUED'
ORDER BY COLUMN_ID;





select count(*) from issued



;





SELECT Y.*
FROM(
    SELECT ROWNUM AS boNo,
        X.*
        FROM(        
                SELECT
                 ISS_NO,
                    MEM_ID,
                    ISS_NAME,
                    TO_CHAR(ISS_DATE,'YYYY-MM-DD') 
            FROM ISSUED 
            WHERE ISS_NAME='»ﬁ«–Ω≈√ªº≠'
              )X)Y
	WHERE boNo  BETWEEN 1 AND 5
    
    
    ;
    
    
    
    
    
    
    
    SELECT Y.* FROM( SELECT ROWNUM AS RNUM, X.* FROM( SELECT ISS_NO, MEM_ID, ISS_NAME, TO_CHAR(ISS_DATE,'YYYY-MM-DD') 
AS ISS_DATE FROM ISSUED WHERE ISS_NAME='»ﬁ«–Ω≈√ªº≠' )X)Y WHERE RNUM BETWEEN 1 AND 10 ;









SELECT Y.* FROM(    
SELECT ROWNUM AS RNUM,         X.*         FROM(     
SELECT               A.ISS_NO,               A.MEM_ID,               B.MEM_NAME               A.ISS_NAME,               TO_CHAR(ISS_DATE,'YYYY-MM-DD') AS A.ISS_DATE              FROM ISSUED A, MEMBER B               WHERE A.MEM_ID = B.MEM_ID               )X)Y  
WHERE RNUM  BETWEEN ? AND ?;







	SELECT 
		MEM_ID,
		DEP_NO,
		MEM_TYPE,
		MEM_PASS,
		MEM_NAME,
		MEM_REG1,
		MEM_REG2,
		MEM_TEL,
		MEM_MAIL,
		MEM_ZIP,
		MEM_ADDR1,
		MEM_ADDR2,
		MEM_ACN,
		MEM_BANK,
		MEM_GRD,
		MEM_STATE,
		MEM_POSITION,
		MEM_ADMISSION,
		MEM_GRADUATION,
		MEM_IMG
	FROM MEMBER 
	WHERE MEM_ID ='2051001'


                SELECT
	             A.ISS_NO,
	             A.MEM_ID,
	             B.MEM_NAME,
	             A.ISS_NAME,
	             TO_CHAR(ISS_DATE,'YYYY-MM-DD') AS ISS_DATE
	            FROM ISSUED A, MEMBER B 
	            WHERE A.MEM_ID = B.MEM_ID;
                
                
                
                
SELECT *
from member 
where mem_img ='55105a6c-c5d0-4256-a70b-cf74648feae5'
                
                
                
                
                
                