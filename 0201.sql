SELECT COUNT(DISTINCT(B.SUB_NAME))
					FROM LECTURE A, SUBJECT B 
					WHERE INSTR(B.SUB_NAME, '��') > 0;
    
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




ProfileVO(depName=null, memId=1911005,������а�, depNo=null, memType=null, memName=������3, memReg1=000505, memTel=010-5014-0707,
memMail=asda@naver.com, memAddr1=���ﵿ, memAddr2=���κ���, memAcn=453817-56-055426, memBank=����, memGrd=6)
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
    
    
    
SELECT  A.MEM_ID AS �й�,
            A.MEM_NAME AS �̸�,
            B.DEP_NAME AS �а�,
            A.MEM_GRD AS �г�,
            A.MEM_REG1 AS ������� ,
            A.MEM_TEL AS ��ȭ��ȣ,
            A.MEM_MAIL AS �̸���,
            A.MEM_ADDR1  AS �ּ�,
            A.MEM_ADDR2 AS ���ּ�,
            A.MEM_BANK AS ����,
            A.MEM_ACN AS ���¹�ȣ
            
            
FROM  MEMBER A, DEPARTMENT B
WHERE A.MEM_ID ='1911005'
AND A.DEP_NO = B.DEP_NO

; 










                    
                    
                    
                    
                    
                    
                
                