CREATE TABLE TMEMBER2(
ID VARCHAR2(50),
PW CHAR(15) NOT NULL);

ALTER TABLE TMEMBER2 ADD(Detail VARCHAR2(200));

SELECT DETAIL
FROM TMEMBER2
WHERE ID = 'a003'
    AND PW = 'asd';