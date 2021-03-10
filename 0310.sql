SELECT A.CODE 
FROM CODE A, ISSUED B
WHERE A.CODE_NAME = B.ISS_NAME;




SELECT NVL(MAX(ISS_NO),0)
FROM ISSUED
;


SELECT Y.*
FROM(
    SELECT ROWNUM AS RNUM,
        X.*
        FROM(        
	          SELECT
	             A.ISS_NO,
	             A.MEM_ID,
	             B.MEM_NAME,
	             A.ISS_NAME,
	             TO_CHAR(ISS_DATE,'YYYY-MM-DD') AS ISS_DATE,
	             C.CODE 
	            FROM ISSUED A, MEMBER B, CODE C
	            WHERE A.MEM_ID = B.MEM_ID
	             AND C.CODE_NAME= A.ISS_NAME
	             ORDER BY 1 DESC
              )X)Y;
              
              
              commit