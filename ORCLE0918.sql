--1
CREATE TABLE EMP(
    EMPNO       NUMBER(4)       NOT NULL,
    ENAME        VARCHAR2(10),
    JOB            VARCHAR2(9),
    MGR           NUMBER(4),
    HIREDATE     DATE,
    SAL             NUMBER(7,2),
    COMM           NUMBER(7,2),
    DEPTNO          NUMBER(2),

CONSTRAINT PK_EMP PRIMARY KEY(EMPNO),
CONSTRAINT FK_EMP FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO));

CREATE TABLE DEPT (
    DEPTNO      NUMBER(2)   NOT NULL,
    DNAME       VARCHAR2(14),
    LOC             VARCHAR2(13),
CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO));


INSERT INTO Dept VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO Dept VALUES(20,'RESEARCH','DALLAS');
INSERT INTO Dept VALUES(30,'SALES','CHICAGO');
INSERT INTO Dept VALUES(40,'OPERATIONS','BOSTON');

INSERT INTO Emp  VALUES(7369,'SMITH','CLERK',    7902,'1980-12-17',800,NULL,20);
INSERT INTO Emp  VALUES(7499,'ALLEN','SALESMAN', 7698,'1981-02-20',1600,300, 30);
INSERT INTO Emp  VALUES(7521,'WARD','SALESMAN',  7698,'1981-02-22',1250,500, 30);
INSERT INTO Emp  VALUES(7566,'JONES','MANAGER',  7839,'1981-04-02',2975,NULL,20);
INSERT INTO Emp  VALUES(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO Emp  VALUES(7698,'BLAKE','MANAGER',  7839,'1981-05-01',2850,NULL,30);
INSERT INTO Emp  VALUES(7782,'CLARK','MANAGER',  7839,'1981-06-09',2450,NULL,10);
INSERT INTO Emp  VALUES(7788,'SCOTT','ANALYST',  7566,'1987-07-13',3000,NULL,20);
INSERT INTO Emp  VALUES(7839,'KING','PRESIDENT', NULL,'1981-11-17',5000,NULL,10);
INSERT INTO Emp  VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,   30);
INSERT INTO Emp  VALUES(7876,'ADAMS','CLERK',    7788,'1987-07-13',1100,NULL,20);
INSERT INTO Emp  VALUES(7900,'JAMES','CLERK',    7698,'1981-12-03',950,NULL,30);
INSERT INTO Emp  VALUES(7902,'FORD','ANALYST',   7566,'1981-12-03',3000,NULL,20);
INSERT INTO Emp  VALUES(7934,'MILLER','CLERK',   7782,'1982-01-23',1300,NULL,10);

--2
SELECT ENAME, HIREDATE
        FROM EMP
    WHERE HIREDATE >'19820101'
        AND HIREDATE <'19830101';
--3
SELECT EMPNO,  ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
        FROM EMP
    WHERE HIREDATE >'19810601'    
        AND JOB = 'SALESMAN';
--4
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
        FROM EMP
   WHERE HIREDATE >'19810601'
    AND DEPTNO !=10;
--5
SELECT  ROWNUM, EMPNO,ENAME
    FROM EMP;

--6
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
        WHERE (DEPTNO = 10 OR DEPTNO = 30)
            AND SAL >'1500'
            ORDER BY ENAME DESC  ;
--7            
SELECT  DEPTNO,
            MAX(SAL) AS MAX_SAL,
            MIN(SAL) AS MIN_SAL,
            ROUND(AVG((SAL)),2) AS AVG_SAL
     FROM EMP
    GROUP BY DEPTNO;

--8  
SELECT A.EMPNO, A.ENAME, A.SAL, A.DEPTNO, B.DNAME
        FROM EMP A, DEPT B
    WHERE A.DEPTNO = B.DEPTNO
         AND A.SAL >'2500'
         AND A.EMPNO>'7600'
         AND B.DNAME = 'RESEARCH';


--9 
SELECT A.EMPNO, A.ENAME, A.DEPTNO, B.DNAME
        FROM EMP A, DEPT B
    WHERE A.DEPTNO = B.DEPTNO
        AND (A.DEPTNO = 10
        OR A.DEPTNO = 30);


--10      
 SELECT A.ENAME, B.ENAME AS MGR
 FROM EMP A, EMP B  
 WHERE A.MGR = B.EMPNO(+);   

 
 
--11
 SELECT SUBSTR(HIREDATE,1,7) AS HIRE_YYYYMM,
         COUNT(EMPNO)         AS CNT
    FROM EMP
    GROUP BY SUBSTR(HIREDATE,1,7)
    ORDER BY 1;
 
--12
--(��������)
    SELECT *
        FROM EMP;
  --(��������)
SELECT DEPTNO
    FROM EMP 
        WHERE ENAME = 'SMITH'
           OR ENAME = 'WARD';
--(��ġ��)
    SELECT *
        FROM EMP A
        WHERE A.DEPTNO IN  (SELECT B.DEPTNO
                                 FROM EMP B 
                              WHERE  (B.ENAME = 'SMITH'
                                         OR B.ENAME = 'WARD'));

--13
--(��������)
SELECT*
    FROM EMP  
--(��������)    
    SELECT avg(SAL)
        FROM EMP;
--(��ġ��)
SELECT *
    FROM EMP A
    WHERE A.SAL >( SELECT avg(SAL)
                        FROM EMP);


--14
INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES (99, 'DDIT', '����');

--15
UPDATE DEPT SET DNAME = 'DDIT_MODI', LOC ='����_MODI'
    WHERE DEPTNO = 99;

--16
DELETE FROM DEPT 
WHERE DEPTNO=99;

--17
CREATE TABLE EMP(
    EMPNO       NUMBER(4)       NOT NULL,
    ENAME        VARCHAR2(10),
    JOB            VARCHAR2(9),
    MGR           NUMBER(4),
    HIREDATE     DATE,
    SAL             NUMBER(7,2),
    COMM           NUMBER(7,2),
    DEPTNO          NUMBER(2),

CONSTRAINT PK_EMP PRIMARY KEY(EMPNO),
CONSTRAINT FK_EMP FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO));

CREATE TABLE DEPT (
    DEPTNO      NUMBER(2)   NOT NULL,
    DNAME       VARCHAR2(14),
    LOC             VARCHAR2(13),
CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO));

--18
SELECT  DEPTNO ,
        SUM(SAL) AS SAL
    FROM EMP
    GROUP BY ROLLUP(DEPTNO);

--19
CREATE TABLE CUSTOMER(
        CID       NUMBER(4)  NOT NULL,
        CNM    VARCHAR2(50) NOT NULL,

CONSTRAINT PK_CUSTOMER PRIMARY KEY(CID));


CREATE TABLE PRODUCT(
    PID NUMBER(5)   NOT NULL,
    PNM  VARCHAR2(50) NOT NULL,
CONSTRAINT PK_PRODUCT PRIMARY KEY(PID));



CREATE TABLE CYCLE(
    CID NUMBER(5)   NOT NULL,
    PID  NUMBER(5) NOT NULL,
    DAY NUMBER(5) NOT NULL,
    CNT NUMBER(5) NOT NULL,
CONSTRAINT PK_CYCLE PRIMARY KEY(DAY),
CONSTRAINT FK_CYCLE FOREIGN KEY(CID) REFERENCES CUSTOMER(CID),
CONSTRAINT FK_CYCLE2 FOREIGN KEY(PID) REFERENCES PRODUCT(PID));


CREATE TABLE DAILY(
    CID NUMBER(5)   NOT NULL,
    PID  NUMBER(5) NOT NULL,
    DT VARCHAR2(8) NOT NULL,
    CNT NUMBER(5) NOT NULL,
CONSTRAINT PK_DAILY PRIMARY KEY(DT),
CONSTRAINT FK_DAILY FOREIGN KEY(CID) REFERENCES CUSTOMER(CID),
CONSTRAINT FK_DAILY2 FOREIGN KEY(PID) REFERENCES PRODUCT(PID));



INSERT INTO CUSTOMER (CID, CNM)  VALUES(1, '�����');
INSERT INTO CUSTOMER (CID, CNM)  VALUES(2, '�̼���');
INSERT INTO CUSTOMER (CID, CNM)  VALUES(3, 'ȫ�浿');
INSERT INTO CUSTOMER (CID, CNM)  VALUES(4, '������');
INSERT INTO CUSTOMER (CID, CNM)  VALUES(5, '������');

INSERT INTO PRODUCT (PID, PNM) VALUES(100, '����ũ�帵ŷ����');
INSERT INTO PRODUCT (PID, PNM) VALUES(101, '���ν�Ÿ��');
INSERT INTO PRODUCT (PID, PNM) VALUES(102, '�Ľ���'); 
INSERT INTO PRODUCT (PID, PNM) VALUES(103, '�Ұ�����');
INSERT INTO PRODUCT (PID, PNM) VALUES(104, '���Ǵ���');
INSERT INTO PRODUCT (PID, PNM) VALUES(105, '������');

INSERT INTO CYCLE(CID, PID, DAY, CNT) 
VALUES ((SELECT CID FROM CUSTOMER WHERE CID=1), (SELECT PID FROM PRODUCT  WHERE PID =100), 3, 4);
INSERT INTO CYCLE(CID, PID, DAY, CNT) 
VALUES ((SELECT CID FROM CUSTOMER WHERE CID=2), (SELECT PID FROM PRODUCT  WHERE PID =101), 4, 2);
INSERT INTO CYCLE(CID, PID, DAY, CNT) 
VALUES ((SELECT CID FROM CUSTOMER WHERE CID=3), (SELECT PID FROM PRODUCT  WHERE PID =102), 2, 2);
INSERT INTO CYCLE(CID, PID, DAY, CNT) 
VALUES ((SELECT CID FROM CUSTOMER WHERE CID=4), (SELECT PID FROM PRODUCT  WHERE PID =103), 1, 2);
INSERT INTO CYCLE(CID, PID, DAY, CNT) 
VALUES ((SELECT CID FROM CUSTOMER WHERE CID=5), (SELECT PID FROM PRODUCT  WHERE PID =104), 5, 1)


CREATE OR REPLACE PROCEDURE PROC_DAILY01(
    P_DAILY IN DUSTOMER.CID%TYPE,
        P_PID IN PRODUCT.PID%TYPE)
    IS
    V_DT VARCHAR2(8);
    V_CNT NUMBER;
    BEGIN
        INSERT INTO DAILY (CID, PID, DT, CNT ) VALUE((SELECT CID FROM CUSTOMER WHERE CID=1),(SELECT PID FROM PRODUCT  WHERE PID=100),'20190805',1);        
        INSERT INTO DAILY (CID, PID, DT, CNT ) VALUE((SELECT CID FROM CUSTOMER WHERE CID=1),(SELECT PID FROM PRODUCT  WHERE PID=100),'20190812',1);  
        INSERT INTO DAILY (CID, PID, DT, CNT ) VALUE((SELECT CID FROM CUSTOMER WHERE CID=1),(SELECT PID FROM PRODUCT  WHERE PID=100),'20190819',1);  
        INSERT INTO DAILY (CID, PID, DT, CNT ) VALUE((SELECT CID FROM CUSTOMER WHERE CID=1),(SELECT PID FROM PRODUCT  WHERE PID=100),'20190826',1);     
    END;


SET SERVEROUTPUT ON;


    
 CREATE OR REPLACE PROCEDURE PROC_DAILY02(
      P_DT IN DAILY.DT%TYPE)
    IS
    V_CID CYCLE.CID%TYPE;
    V_PID CYCLE.PID%TYPE;
    V_DAY CYCLE.DAY%TYPE;
    V_CNT CYCLE.CNT%TYPE;
    V_DT DAILY.DT%TYPE;
   CURSOR CSOR 
   IS 
       SELECT CID, PID, DAY, CNT 
       FROM CYCLE;
    BEGIN
        OPEN CSOR;
        LOOP
           V_DT := TO_CHAR(LAST_DAY(TO_CHAR(ADD_MONTHS(P_DT||'01', -1))), 'YYYYMMDD');
        FETCH CSOR INTO V_CID, V_PID, V_DAY, V_CNT;
        EXIT WHEN CSOR%NOTFOUND;  
        LOOP
        EXIT WHEN V_DT > TO_CHAR(LAST_DAY(TO_CHAR(P_DT||'01')), 'YYYYMMDD')-7;
         V_DT := TO_CHAR(NEXT_DAY(V_DT, CASE V_DAY 
                    WHEN 1 THEN '�Ͽ���'
                    WHEN 2 THEN '������'
                   WHEN 3 THEN 'ȭ����'
                   WHEN 4 THEN '������'
                   WHEN 5 THEN '�����'
                   WHEN 6 THEN '�ݿ���'
                   WHEN 7 THEN '�����'
                   END), 'YYYYMMDD');
        INSERT INTO DAILY VALUES(V_CID, V_PID, V_DT, V_CNT);
          END LOOP;
    END LOOP;
    CLOSE CSOR;
    COMMIT;
    END;
    
--20
 EXEC PROC_DAILY02 ('201908');   
    
    
    