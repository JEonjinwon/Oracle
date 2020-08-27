2020-07-24-01)자료형
2.숫자 자료형
    -숫자(정수 및 실수) 자료를 저장 
    -number 타입이 제공
    
(사용형식)
컬럼명 number([정밀도 | * [ ,스케일]])
    -정수와 실수 자료를 저장 
    -저장범위: 1.0 x E-130 ~~9.999.......x E125(9의 갯수가 38개)
    -정밀도 > 스케일 인 경우
        -정밀도는 전체 자리수 스케일은 소숫점 이하의 자리수
        -정밀도는1~38 사이의 수 
        -스케일은 ! -80~127 사이의 수로 표현
        - *sms\는 전체 허용 범위내에서는 사용자가 입력한 자료에 맞추어 기억공간을 확보
        ex) 
        칼럼명 number : --정수 실수 모두 저장
        컬럼명 number (정밀도 ,스케일) --실수
        컬럼명 number (정밀도 ) --정수
        컬럼명 number (*,스케일 ) --정수 실수 
        
예)
-------------------------------------------------------------
입력값             선언          기억되는 값
-------------------------------------------------------------
1,234,567.897  number      1,234,567.897
1,234,567.897  number(*,1) 1,234,567.9 -- 소숫점 2번째 자리에서 반올림된디.
1,234,567.897  number()     1,234,568 --number(*,0)과 같다  --java에서 int로 형변환 같은 느낌
1,234,567.897  number(9,2) 1,234,567.90
1,234,567.897  number(6)    오류    --number(6,0)과 같다 --기억공간 부족으로 오류
1,234,567.897  number(7,-2) 1,234,600      -- 스케일이 -로 음수인 경우 정수부분에서 반올림

정밀도 << 스케일 인 경우 
    -정밀도는 0가 아님 유효숫자의 갯수(소숫점 이하)
    -(스케일 - 정밀도) : 소숫점 이하에서 맨 앞에 존재해야할 0의 갯수
    
사용예)
---------------------------------------------------------------------
입력값                 선언                  기억되는값
---------------------------------------------------------------------
1.234                   number(4,5)              오류
1.23                     number(3,5)             오류
0.0123                  number(3,4)             0.0123
0.01234                number(4,5)              0.01234
0.001234               number(3,5)             0.00123 
---------------------------------------------------------------------



3. 날짜형
    -날짜자료(년 월 일 시 분 초 )를 저장한 데이터 타입
    -DATE, TIMESTAMP이 제공된다
1)DATE
    -기본 날짜형 
    -덧셈과 뺼셈의 대상
    -크기 지정 않함
    (사용형식)
   컬럼명 DATE 
   
   날짜 함수 중 SYSDATE : 시스템의 날짜 정보 반환
   
사용예);
CREATE TABLE TEMP05(
col1 date,
col2 date,
col3 date);

insert into temp05
    values('20191112',sysdate, sysdate -20);

select *from temp05;
select to_char(col1, 'yyyy-mm-dd hh24:mi:ss'),
        to_char(col2, 'yyyy-mm-dd hh24:mi:ss'),
        to_char(col3, 'yyyy-mm-dd hh24:mi:ss')
from temp05;
                  
                  
2)timestamp  
    -시간대 정보(timezone)와 10억분의 1초 단위의 시간정보 제공
    3가지 데이터 타입 제공
        -timestamp : timezone 정보가 없음
        -timestamp with timezone : timezone 정보가 포함
        -timestamp with loacl timezone : 서버가 위치한 타임존 정보 포함 
        
(사용형식)
컬럼명 timestamp

(사용예);

create table temp06(
col1 timestamp,
col2 timestamp with timezone,
col3 timestamp with loacl timezone);

insert into temp06 values(sysdate,sysdate,sysdate);

select * from temp06;
    










