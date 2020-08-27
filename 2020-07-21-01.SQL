2020-07-21-01)
1)사용자 생성
   사용자 계정 생성 -> 권한 부여 -> 접속메뉴에 추가
2)사용자 계정 생성 
  - 사용자 계정명과 암호(java) 지정 
  
  (사용형식)
  CREATE USER 계정명 IDENTIFIED BY 암호(java);
  
  CREATE USER JEON IDENTIFIED BY java;
  
  3) 권한설정
  (사용형식)
  GRANT 권한명, 권한명,........ TO 계정명;
  
  GRANT CONNECT, RESOURCE, DBA   TO JEON;