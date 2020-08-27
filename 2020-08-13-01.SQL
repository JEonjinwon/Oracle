2020-08-13- 01)
2)TRUNC(절삭)
(사용형식)
    TRUNC(n,i)
    -주어진 데이터 n에서 i가 양수인 경우 i+1번째 자리에서 절삭
    -i가 음수인 경우 정수부분 i 번재 자리에서 절삭
    
    예) 
    SELECT TRUNC(12345.9999,-2),
             TRUNC(12345.9999,2),
             TRUNC(12345.9999,0),
              TRUNC(12345.9999)
    FROM DUAL;
    
4. POWER와 SQRT
    -거듭제곱값과 평반근의 값을 반환
    1)POWER(n1,n2)
        -n1을 n2번 거듭제곱한 결과 반환
예)
SELECT POWER(2,10) FROM DUAL;

    2)SQRT(n)
        -n의 평방근(제곱근)의 값을 변환
    SELECT ROUND(SQRT(23),3) FROM DUAL;
    
 5. MOD와 REMAINDER
    -나머지 값을 반환
    (사용형식)
    MOD(n2, n1), REMAINDER(n2,n1)
        -n2를 n1으로 나눈 나머지
        -MOD와 REMAINDER는 내부 처리 방식이 다름
        -MOD : n2 - n1 *FLOOR(n2/n1)
        -REMAINDER : n2 - n1 *ROUND(n2/n1) -- 거의 사용 안한다.
예) MOD(15,4) : 15-4*FLOOR(15/4)   --FLOOR : 작은 쪽으로 가장 가까운 정수
                    15-4*FLOOR(3.75)  
                    15-12 =>3
    REMAINDER(15,4) : 15-4*ROUND(15/4)
                              15-4*ROUND(3.75) --ROUND : 반올림   
                              15-16 =>-1
    REMAINDER(15,7) : 15-7*ROUND(15/7)
                              15-7*ROUND(2.14...) --ROUND : 반올림   
                              15-14 =>1
    REMAINDER(17,7) : 17-7*ROUND(17/7)
                              17-7*ROUND(2.42....) --ROUND : 반올림   
                              17-14 =>3
    REMAINDER(18,7) : 18-7*ROUND(18/7)
                              18-7*ROUND(2.57....) --ROUND : 반올림   
                              18-21 =>-3      -- 다음거의 몫이 되기 위해 더해주는 것                                                 

