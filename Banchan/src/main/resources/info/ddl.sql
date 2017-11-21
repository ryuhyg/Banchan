
/*
*권한 생성
*/

CREATE TABLE AUTH
(
   AUTH_NO NUMBER  PRIMARY KEY ,
   AUTH_NAME VARCHAR2(100)  NOT NULL 
);
select * from auth;
/*
 *주소 생성 
 */
CREATE TABLE ADDRESS
(
   ADDRESS_NO NUMBER  PRIMARY KEY ,
   ADDRESS_API VARCHAR2(500)  NOT NULL ,
   LATITUDE BINARY_DOUBLE  NOT NULL ,
   LONGITUDE BINARY_DOUBLE  NOT NULL 
);

/*
 * 비밀번호 찾기 질문 생성
 */

CREATE TABLE PW_QNA
(
   PW_QNA_NO NUMBER  PRIMARY KEY ,
   PW_QUEST VARCHAR2(300)  NOT NULL 
);

/*
 * 회원 상태 생성
 */

CREATE TABLE ENABLE
(
   ENABLE_NO NUMBER   PRIMARY KEY ,
   ENABLE_NAME VARCHAR2(100)  NOT NULL 
);

/*
 * 회원 생성
 */

CREATE TABLE BAN_MEM
(
   MEM_ID VARCHAR2(100)  PRIMARY KEY ,
   PW VARCHAR2(500)  NOT NULL ,
   BIRTH DATE  NOT NULL ,
   TEL VARCHAR2(100)  NOT NULL ,
   ADDRESS_NO NUMBER  NOT NULL ,
   constraint FK_BAN_MEM_ADDRESS_NO foreign key(ADDRESS_NO) references ADDRESS(ADDRESS_NO) ON DELETE CASCADE,
   ADDRESS_DE VARCHAR2(300)  NOT NULL ,
   PW_QNA_NO NUMBER  NOT NULL ,
   ENABLE_NO NUMBER  NOT NULL ,
   constraint FK_BAN_MEM_ENABLE_NO foreign key(ENABLE_NO) references ENABLE(ENABLE_NO) ON DELETE CASCADE,
   MEM_NAME VARCHAR2(100)  NOT NULL ,
   PW_ANSWER VARCHAR2(500)  NOT NULL ,
   constraint FK_BAN_MEM_PW_ANSWER foreign key(PW_QNA_NO) references PW_QNA(PW_QNA_NO)
);

/*
 * 회원 권한
 */

CREATE TABLE MEM_AUTH
(
   MEM_AUTH_NO NUMBER  PRIMARY KEY,
   MEM_ID VARCHAR2(100)  NOT NULL ,
   constraint FK_MEM_AUTH_MEM_ID foreign key(MEM_ID) references BAN_MEM(MEM_ID) ON DELETE CASCADE,
   AUTH_NO NUMBER NOT NULL ,
   constraint FK_MEM_AUTH_AUTH_NO foreign key(AUTH_NO) references AUTH(AUTH_NO) ON DELETE CASCADE
);
select * from mem_auth;
/*
 * 판매자 정보
 */

CREATE TABLE SELLER
(
   MEM_ID VARCHAR2(100)  PRIMARY KEY ,
   constraint FK_SELLER foreign key(MEM_ID) references BAN_MEM(MEM_ID),
   SELLER_IMG VARCHAR2(300)  NOT NULL ,
   SELLER_INFO CLOB  NOT NULL ,
   SELLER_SCORE FLOAT  NULL 
);

/*
 *카테고리 
 */
CREATE TABLE CATEGORY
(
   CATEGORY_NO NUMBER  PRIMARY KEY ,
   CATEGORY_NAME VARCHAR2(100)  NOT NULL 
);
/*
 * 거래상태
 */

CREATE TABLE TR_STATUS
(
   TR_STATUS_NO NUMBER  PRIMARY KEY ,
   TR_STATUS VARCHAR2(100)  NOT NULL 
);


/*
 * 음식 정보
 */

CREATE TABLE FOOD
(
   FOOD_NO NUMBER  PRIMARY KEY ,
   FOOD_NAME VARCHAR2(100)  NOT NULL ,
   MEM_ID VARCHAR2(100)  NOT NULL,
    constraint FOOD_FK_ID foreign key(MEM_ID) references BAN_MEM(MEM_ID),
   FOOD_DE CLOB  NOT NULL ,
   FOOD_SCORE FLOAT  NULL ,
   CATEGORY_NO NUMBER  NOT NULL ,
    constraint FOOD_FK_CATEGORY foreign key(CATEGORY_NO) references CATEGORY(CATEGORY_NO) ,
   FOOD_MAIN_IMG VARCHAR2(300)  NOT NULL ,
   FOOD_POSTDATE DATE  NOT NULL 
);

/*
 * 음식 사진
 */

CREATE TABLE FOOD_IMG
(
   FOOD_IMG_NO NUMBER PRIMARY KEY ,
   FOOD_NO NUMBER  NOT NULL  ,
    constraint FOOD_NO_FK foreign key(FOOD_NO) references FOOD(FOOD_NO) ON DELETE  CASCADE,
   FOOD_IMG_PATH VARCHAR2(300)  NOT NULL 
);

/*
 * 판매정보
 */

CREATE TABLE FOOD_SELL
(
   FOOD_SELL_NO NUMBER  PRIMARY KEY ,
   FOOD_NO NUMBER  NOT NULL ,
    constraint FOOD_SELL_FK foreign key(FOOD_NO) references FOOD(FOOD_NO) ON DELETE  CASCADE, 
   TR_DATE DATE  NOT NULL ,
   CLOSE_DATE DATE  NOT NULL ,
   LOC VARCHAR2(100) NOT NULL ,
   PRICE NUMBER  NOT NULL ,
   PRE_QUANTITY NUMBER  NOT NULL ,
   SELL_POSTDATE DATE  NOT NULL ,
   UNIT VARCHAR2(100)  NOT NULL ,
   SELL_DETAIL CLOB  NOT NULL 
);

/*
 * 거래내역
 */
CREATE TABLE TRADE
(
   TR_NO NUMBER  PRIMARY KEY,
   MEM_ID VARCHAR2(100)  NOT NULL ,
    constraint TRADE_FK_ID  foreign key(MEM_ID) references BAN_MEM(MEM_ID),
   FOOD_SELL_NO NUMBER  NOT NULL ,
    constraint TRADE_FK_SELL  foreign key(FOOD_SELL_NO) references FOOD_SELL(FOOD_SELL_NO) ON DELETE  CASCADE,
   TR_QUANTITY NUMBER  NOT NULL ,
   TR_STATUS_NO NUMBER  NOT NULL ,
    constraint TRADE_FK_STATUS  foreign key(TR_STATUS_NO) references TR_STATUS(TR_STATUS_NO),
   TR_FIN_DATE DATE  NOT NULL ,
   TR_REQ_DATE DATE  NOT NULL 
);

/*
 * 후기
 */

CREATE TABLE REVIEW
(
   REV_NO NUMBER  PRIMARY KEY,
   SCORE NUMBER  NULL ,
   REV_CONTENT CLOB  NOT NULL ,
   REV_POSTDATE DATE  NOT NULL ,
   TR_NO NUMBER  NOT NULL,
    constraint REVIEW_FK foreign key(TR_NO) references TRADE(TR_NO)
);

/*
 * 질문
 */
CREATE TABLE QUESTION
(
    QUEST_NO NUMBER  PRIMARY KEY,
   FOOD_SELL_NO NUMBER  NOT NULL ,
    constraint QUESTION_SELL_FK foreign key(FOOD_SELL_NO) references FOOD_SELL(FOOD_SELL_NO) ON DELETE  CASCADE,
   MEM_ID VARCHAR2(100)  NOT NULL ,
    constraint QUESTION_ID_FK foreign key(MEM_ID) references BAN_MEM(MEM_ID),
   QUEST_CONTENT CLOB  NOT NULL ,
   QUEST_POSTDATE DATE  NOT NULL 
);

/*
 * 답변
 */
CREATE TABLE ANSWER
(
   ANS_NO NUMBER  PRIMARY KEY ,
   MEM_ID VARCHAR2(100)  NOT NULL ,
    constraint ANSWER_ID_FK foreign key(MEM_ID) references BAN_MEM(MEM_ID) ON DELETE  CASCADE,
   ANS_CONTENT CLOB  NOT NULL ,
   ANS_POSTDATE DATE  NOT NULL ,
   QUEST_NO NUMBER  NOT NULL, 
    constraint ANSWER_NO_FK foreign key(QUEST_NO) references QUESTION(QUEST_NO) ON DELETE  CASCADE   
);



drop table ANSWER;
drop table QUESTION;
drop table Review;
drop table TRADE;
drop table FOOD_SELL;
drop table FOOD_IMG;
drop table FOOD;
drop table TR_STATUS;
drop table CATEGORY;
drop table SELLER;
drop table MEM_AUTH;
drop table BAN_MEM;
drop table ENABLE;
drop table PW_QNA;
drop table ADDRESS;
drop table AUTH;










