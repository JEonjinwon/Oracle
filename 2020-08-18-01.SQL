2020-08-18-01)
2. NVL
(사용형식)
NVL(c, r1, r2)
    - c의 값이 NULL이면 r2를 반환하고 NULL이 아니면 r1의 값을 반환한다.
 예) 회원 테이블에서 회원의 성씨가 '이'씨인 회원들의 마일리지를 NULL로 바꾸시오.   
UPDATE MEMBER 
    SET MEM_MILEAGE = NULL
WHERE MEM_NAME LIKE '이%';

SELECT * FROM MEMBER;

SELECT MEM_NAME, MEM_MILEAGE
FROM MEMBER
WHERE MEM_NAME LIKE '이%';

ROLLBACK;

예) 회원테이블에서 회원의 마일리지가 NULL인 회원과 NULL이 아닌 회원을 판별하여 NULL인 회원은 비고란에 '휴면회원'
    NULL이 아닌 회원의 비고란에 '활동회원'을 출력하시오
    Alias는 회원명, 마일리지, 비고 , 회원명 순으로 출력
SELECT  MEM_NAME  AS 회원명,
            MEM_MILEAGE AS 마일리지, 
            NVL2(MEM_MILEAGE, '활동회원' ,'휴면회원')  AS 비고 
FROM MEMBER
ORDER BY 1;

예) 사원테이블에서 COMMISSION_PCT를 조사하여 NULL이면 영업실적난에 0을 NULL이 아니면 영업실적난에
    %로 환전된 영업실적을 출력하시오
    단, NVL2를 사용할 것 
    Alias는 사원명, 부서코드, 직책코드, 영업실적이며 ,영업실적이 많은 사원부터 출력
SELECT EMP_NAME AS 사원명, 
           DEPARTMENT_ID  AS 부서코드,
           JOB_ID AS 직책코드,
           NVL2(COMMISSION_PCT, COMMISSION_PCT*100||'%', 0||'%') AS 영업실적
FROM EMPLOYEES
ORDER BY 4 DESC  ;   
    
    
    
    
    