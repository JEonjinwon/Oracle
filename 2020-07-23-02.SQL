2020-07-23-02)자료형
    -오라클에서 사용되는 자료형에는 숫자, 문자열, 날짜, 기타 등으로 구분
    
1. 문자열 자료타입
    -오라클의 문자열 자료는 ' '로 묶어 표현
    -문자열 자료형에는 char, varchar, varchar2, long, clob, nvarchar2, nclob 등이 있다.
    --가변길이 앞에는 var이 붙는다. 
    --long 2G짜리 데이터를 처리할 때 사용 제약 사항이 많아 요즘 안씀 -> clob 사용 4G 사용 
    --n 붙은것은 국제 표준
    -- 주로 char varchar2 clob 가 사용된다.
    1) CHAR
    -고정길이 문자열, 주식별자에 주로 사용한다 예) 학번 주민번호 등 길이가 전부 같을때
    -기본킹 컬럼의 데이터 타입으로 사용.
    -왼쪽부터 저장되고 남는 공간은 공백으로 padding
    
    (사용형식) 
    컬럼명 char (크기 [byte]char);
    - 2000 byte까지 사용 가능
    - [byte|char] : default는 byte이고 char을 사용하는 경우 '크기'는 글자수를 의미 단, 
        char을 기술해도 2000byte를 초과할 수 없다.
        
create table temp01(
    col1 char(10),
    col2 char(10 byte),
    col3 char(10 char));
    
insert into Temp01(col1, col2, col3)
values('대한민', 'abcdef', '대전시대흥동성모');
--'대한민국'하면 기억공간이 모자라 실행이 안된다. 한글 1글자 3byte , 영어 1글자 1byte, byte는 생략가능

select * from temp01;

select lengthb(col1),lengthb(col1),lengthb(col1)
from temp01;

insert into temp01(col1,col2,col3)
values('대한민', 'abcdef', '1l postion');

2) varchar2
    -가변 길이 문자열 저장에 사용
    -400byte 까지 사용 가능 
    
    (사용형식)
    컬럼명 varchar2(크기 [byte | char]); --default는 byte
    
예)
create table temp02(
col1 varchar2(4000),
co12 varchar2 (4000 byte),
col3 varchar2 (4000 char));

insert into temp02 
values('대한민국', 'korea', 'adsjajajajajaajaja');

select *from temp02;

insert into temp02
values('Oracle', 'IL postino', 'persimon');

select *from temp02 where col1='Oracle';

select lengthb(col1),
        lengthb(co12),
        lengthb(col3)
from temp02;


3) varchar
    -  varchar와 동일 기능 제공
    - Oracle 사에서는 varchar2 사용을 권고
    -다른 DBMS에서는 기본 문자열 타입(가변길이)
    
4) nvarchar2
    -국제표준 코드(다국적 언어)를 사용하여 문자열 저장
    -UTF-8과 UTF-16 형식으로 처리
    
5)LONG
    -가변길이 문자열을 저장하는 데이터 타입
    -2gb까지 처리 가능 
    -한 테이블에 하나의 컬럼만 사용 가능
    -clob 타입으로 대체

(사용형식)
컬럼명 long;
    -select 문의 select절, update문의 set절, insert문의 values절에서 사용가능
예) 
create table temp03(
col1 long,
col2 varchar2(100));
--col3 long()); 하나의 테이블에 하나의 컬럼만 사용 가능

insert into temp03 
values('전진원전진원전진원전진원전진원저닞ㄴ원전진원전진원전지누언','가나다라');

select * from temp03;


6) CLOB 
    -가변길이 문자열 저장을 위한 데이터 타입
    -최대 4Gb까지 처리가 가능
    -long과 다르게 여러개 사용해도 가능하다.
    -일부 기능들은 DBMS_LOB API의 지원을 받아야 된다.
    
 (사용형식)
 컬럼명 clob;
 
 예) 
 create table temp04(
 col1 clob,
 col2 clob,
 col3 clob,
 col4 varchar2(50));
 
 insert into temp04
 values('대한민국은 민주 공화국이다','대전','오라클','vavava');
 
 select * from temp04;
 
 select dbms_lob.substr(col1, 10,2), 
        dbms_lob.getlength(col2),
        length(col3),
        --lengthb(col3) 지원되지 않는 기능 
        substr(col4,2,4)
    from temp04;
    
    
    
    