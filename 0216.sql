SELECT A.DEP_NAME
FROM MEMBER B, DEPARTMENT A
WHERE A.DEP_NO = B.DEP_NO
AND B.MEM_ID='1911005'

;


SELECT 
			A.PAY_EXCPECT,
			B.SFUND_VALUE,
			A.PAY_CHECK,
			A.PAY_DIVISION 
		FROM PAY_TUITION A, SCHAR_FUND B
		WHERE A.MEM_ID = #{memId}
		  AND A.PAY_NUMBER ='1'
		  AND B.SFUND_STUDENT =A.MEM_ID 
		  AND A.SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
		  AND A.SMST = B.SFUND_SMST
          ;
          
          
          SELECT PAY_EXCPECT,	
                PAY_CHECK,
                PAY_DIVISION 
          FROM PAY_TUITION
          WHERE MEM_ID ='2111005'
          AND PAY_NUMBER ='1'
            AND SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
          ;
          
          
          SELECT A.SFUND_VALUE,A.SFUND_GETDATE, B.SCH_NAME
          FROM SCHAR_FUND A, SCHOLARSHIP B
          WHERE A.SFUND_STUDENT ='1811003'
          AND A.CODE_RESULT ='PAYED'
          AND A.SFUND_SMST =(SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')
          AND A.SCHAR_CODE =B.SCH_CODE
          
          ;
          
          
                SELECT B.MEM_ID ,B.MEM_NAME
          FROM TAKE_LEC A, MEMBER B
          WHERE A.LEC_CODE='1000102'
          AND A.MEM_ID = B.MEM_ID

          ;
          
          
          
          
          SELECT B.mem_id ,B.MEM_NAME
          FROM TAKE_LEC A, MEMBER B
          WHERE LEC_CODE='1000102'
          AND A.MEM_ID = B.MEM_ID
          
          
          
          
          
          ;
          
          
          SELECT WEEK, ATTEN_CODE
          FROM ATTENDANCE
          WHERE LTIME_NO='1000102'
          AND MEM_ID ='1811001'
            order by 1
          
          ;
          SELECT DISTINCT(A.WEEK), B.AINFO_CODE
          FROM ATTENDANCE A, ATTENDANCE_DETAIL B
          WHERE 
                  A.ATTEN_NO = B.ATTEN_NO
          AND A.LTIME_NO='1000102'
          AND A.MEM_ID ='1811001'
            order by 1
          
          ;
          
          
          
          
          
          
          
          
          
          
UPDATE attendance
    SET
       atten_code = b
WHERE
              ltime_no =:v1
    AND   mem_id =:v2
    AND   week =:v3

          ;;
          
          
          
          UPDATE ATTENDANCE
          SET 
          ATTEN_CODE ='1000102' 
          WHERE LTIME_NO = '1811001'
          AND MEM_ID = '1811001' 
          AND WEEK =1;
          
          
          
          
          
          
          
          