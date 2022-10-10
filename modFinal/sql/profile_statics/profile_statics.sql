/**
 *  PROFILE_STATICS 스키마
 */

CREATE TABLE PROFILE_STATICS(
            PROFILEID NUMBER PRIMARY KEY
           ,ACCOUNTID VARCHAR2(50)
           ,VISITED   VARCHAR2(1) CHECK(VISITED IN('Y','N'))
           ,LATEST_VISITED_DATE DATE
           ,CONSTRAINT PROFILE_STATICS_ACCOUNTID_FK FOREIGN KEY(ACCOUNTID) REFERENCES ACCOUNT(ACCOUNTID) ON DELETE CASCADE
);

CREATE SEQUENCE PROFILE_STATICS_SEQ NOCACHE;


SELECT * FROM PROFILE_STATICS; 
DROP TABLE PROFILE_STATICS;

-- 테이블을 다시 만들지 않고 해당 제약조건만 수정하는 쿼리

-- 1. 아래 쿼리로 해당 제약조건을 삭제한 후
ALTER TABLE PROFILE_STATICS DROP CONSTRAINT PROFILE_STATICS_ACCOUNTID_FK;

-- 2. ON DELETE CASCADE를 적용시킨 제약조건을 다시 설정

ALTER TABLE PROFILE_STATICS 
ADD CONSTRAINT PROFILE_STATICS_ACCOUNTID_FK
FOREIGN KEY (ACCOUNTID) 
REFERENCES ACCOUNT (ACCOUNTID) 
ON DELETE CASCADE;

-- 3. 잘 설정되었는지 확인
SELECT *
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'PROFILE_STATICS';