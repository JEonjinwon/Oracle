2020-08-14-02) 날짜 함수
1)SYSDATE, SYSTIMESTAMP
    - 시스템이 제공하는 날짜 함수 
    - '+'와 '-' 연산가능 
2. ADD_MONTHS
(사용형식)
    ADD_MONTHS(d,n)
        -주어진 날짜 데이터 d에 정수 n만큼의 월을 더한 날짜를 반환
        
예)회원테이블에서 회원들의 생일 문자를 보내려고 한다. 다음달 생일이 있는 
    회원을 찾아 생일 2일전에 문자를 발송할 수 있도록 회원정보를 조회하시오.
    Alias는 회원번호, 회원명, 이메일주소, 핸드폰번호, 문자 발송일이다.
    
SELECT MEM_ID AS 회원번호,
           MEM_NAME AS 회원명, 
           MEM_MAIL AS 이메일주소,
           MEM_HP AS 핸드폰번호,
           EXTRACT (MONTH FROM MEM_BIR||'월'||
            EXTRACT(DAY FROM MEM_BIR)|| '일' AS 생일,
           TO_DATE('202009' ||  
            TO_CHAR(EXTRACT(DAY FROM MEM_BIR)-2,'00'))  AS 문자 발송일 
 FROM  MEMBER
 WHERE EXTRACT (MONTH FROM SYSDATE) +1 = EXTRACT(MONTH FROM MEM_BIR);
    
    
    
    
    
    
                                      ∧
                                    /   ＼
                                   │   │
               ┌──────┘    └───────┐
               /                   ＼＼                  ⊙    ＼ 
              (                        > >                        >
              ＼                    / /                          <  
                └──────┓    ┏───────┘
                                    │    │
                                    ＼    /
                                       ∨
                  
        
         ＼              ＼
           ＼              ＼              ┌─────┐
             ＼              ＼            │       ㆎ    ├─
              ├─────┼────│  │         ├─
             /                /             │       ㆎ    ├─
           /                /               └─────┘
         /                /             
                        └─────<＠              
                  
                  
                  