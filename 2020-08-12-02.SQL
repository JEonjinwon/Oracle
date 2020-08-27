2020-08-12-02)함수(FUNCTION)
1.숫자함수
1)ABS
    -매개변수로 전달 받은 값의 절대값을 반환 
    (사용형식)
    ABS(n)
    
예)
SELECT ABS(100), ABS(-100), ABS('-20')
    FROM DUAL; 
    
 2)CEIL과 FLOOR 
    -CELL : 주어진 매개변수와 같거나 가장 큰 정수를 반환 
    (사용형식) 
    CEIL(n)
    ex)
    SELECT CEIL(10),CEIL(10.67),CEIL(-10.67)
    FROM DUAL;
    
  3)ROUND와 TRUNC
  (사용형식)
  ROUND(n,i) => 반올림
    - 주어진 수 n을 i가 양수인 경우 소숫점 이하 i+1번째 자리에서 반올림 하여 i번째 자리까지 반환 
    - i가 생략되면 0으로 간주
    - i가 음수이면 정수부분의 i 번째 자리에서 반올림
    
예) 사원 테이블의 급여가 연봉이고 매달 급여가 13으로 나눈 값을 지급한다고 할때 부서번호 50번 부서의 
    직원들의한달 급여액을 계산하시오. 
    Alias는 사원번호, 사원명, 연봉, 월급여액
    단, 월급여액은 소수2 자리에서 반올림하시오,
    SELECT EMPLOYEE_ID AS 사원번호,
                EMP_NAME AS 사원명,
                SALARY AS 연봉,
                ROUND(SALARY/13,1) AS 월급여액
    FROM EMPLOYEES
    WHERE  DEPARTMENT_ID = 50;
    
    
    
    
    
    
    
    
    
    
    
    