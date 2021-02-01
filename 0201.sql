SELECT COUNT(DISTINCT(B.SUB_NAME))
					FROM LECTURE A, SUBJECT B 
					WHERE INSTR(B.SUB_NAME, '한') > 0;
    
    SELECT COUNT(*)
			FROM LECTURE ;
            
            
            
            SELECT COUNT(LEC_GRD)
					FROM LECTURE 
					WHERE INSTR(LEC_GRD, '3') > 0;
                    
                    
                SELECT LEC_CODE FROM LECTURE WHERE LEC_GRD='3';
                
                
                
               SELECT COUNT()
					FROM LECTURE A, SUBJECT B 
                    WHERE 1=1 
					AND( INSTR(B.SUB_NAME, '3') > 0
                    OR INSTR(A.LEC_GRD, '3') > 0
                    );
                    
                    
                    
                    
                    
                    
                    
                    
                    
SELECT MEM_NAME 
FROM MEMBER 
WHERE MEM_TYPE = 'ROLE_PROFESSOR'
AND DEP_NO = (SELECT DEP_NO FROM MEMBER WHERE MEM_ID = '2151004' );




ProfileVO(depName=null, memId=1911005,국어국문학과, depNo=null, memType=null, memName=전진원3, memReg1=000505, memTel=010-5014-0707,
memMail=asda@naver.com, memAddr1=대흥동, memAddr2=영민빌딩, memAcn=453817-56-055426, memBank=농협, memGrd=6)
;
UPDATE member
    SET
        MEM_ID = #{memId},
        MEM_NAME =#{memName},
        MEM_REG1 = #{memReg1}
        MEM_TEL= #{memTel},
        MEM_MAIL= #{memMail},
        MEM_ADDR1=#{memAddr1},
        MEM_ADDR2=#{memAddr2},
        MEM_ACN=#{memAcn},
        MEM_BANK=#{memBank},
        MEM_GRD =#{memGrd},
        
WHERE
    mem_id ='1911005'
    
    
    
SELECT  A.MEM_ID AS 학번,
            A.MEM_NAME AS 이름,
            B.DEP_NAME AS 학과,
            A.MEM_GRD AS 학년,
            A.MEM_REG1 AS 생년월일 ,
            A.MEM_TEL AS 전화번호,
            A.MEM_MAIL AS 이메일,
            A.MEM_ADDR1  AS 주소,
            A.MEM_ADDR2 AS 상세주소,
            A.MEM_BANK AS 은행,
            A.MEM_ACN AS 계좌번호
            
            
FROM  MEMBER A, DEPARTMENT B
WHERE A.MEM_ID ='1911005'
AND A.DEP_NO = B.DEP_NO

; 










                    
                    
                    
                    
                    
                    
                
                