2051001 
    510001 
    
    
    
SELECT PAY_EXCPECT, 
        PAY_CHECK, 
        PAY_DIVISION 
FROM PAY_TUITION 
WHERE MEM_ID ='2051001' 
AND PAY_NUMBER ='1' 
AND SMST = (SELECT CODE_NAME FROM CODE WHERE GROUP_CODE = 'A00')