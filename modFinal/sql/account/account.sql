/**
 *  ACCOUNT 스키마
 */

-- 09.13 FILENAME, LOCATION, URL 제거
-- 09.19 BIRTH 제거
 CREATE TABLE ACCOUNT (
              ACCOUNTID VARCHAR2(50) PRIMARY KEY
             ,PASSWORD  VARCHAR2(50) NOT NULL
             ,NAME      VARCHAR2(50) NOT NULL
             ,EMAIL     VARCHAR2(50) NOT NULL
             ,ADDRESS1   VARCHAR2(100)
             ,ADDRESS2   VARCHAR2(100)
             ,ADDRESS3   VARCHAR2(100)
             ,ADDRESS4   VARCHAR2(100)
             ,PHONE     VARCHAR2(15)
             ,ADMIN     VARCHAR2(1) CHECK(ADMIN IN('Y', 'N'))
             ,VISITCNT NUMBER DEFAULT(0)
             ,REGISTERDATE DATE DEFAULT(SYSDATE)

 );
     
SELECT * FROM ACCOUNT;
DROP TABLE ACCOUNT;