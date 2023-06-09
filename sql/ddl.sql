begin
    for rec in (select table_name from user_tables)
        loop
            execute immediate 'DROP TABLE ' || rec.table_name || ' CASCADE CONSTRAINTS';
        end loop;
end;

begin
    for rec in (select SEQUENCE_NAME from USER_SEQUENCES)
        loop
            execute immediate 'DROP SEQUENCE ' || rec.sequence_name;
        end loop;
end;

CREATE TABLE users
(
    id                      NUMBER               NOT NULL,
    user_email              VARCHAR2(45)         NULL,
    user_login_id           VARCHAR2(36)         NULL,
    user_password           CHAR(64)             NULL,
    user_password_salt      CHAR(36)             NULL,
    user_nickname           VARCHAR2(24)         NULL,
    user_role               VARCHAR2(10)         NULL,
    user_birthday           DATE                 NULL,
    user_createdate         DATE DEFAULT SYSDATE NULL,
    user_email_agreement    CHAR(1)              NULL,
    block_date              DATE                 NULL,
    block_reason            VARCHAR2(45)         NULL,
    user_security_question  VARCHAR2(50)         NULL,
    user_security_answer    VARCHAR2(50)         NULL
);


CREATE TABLE sentence
(
    id                       NUMBER                  NOT NULL,
    learning_id              NUMBER                  NOT NULL,
    flashcard_id             NUMBER                  NULL,
    sentence_question        CLOB                    NOT NULL,
    sentence_answer          CLOB                    NOT NULL,
    sentence_corrected       CLOB                    NULL,
    sentence_explanation     CLOB                    NULL,
    sentence_like            CHAR(1)     DEFAULT 0   NOT NULL,
    sentence_accuracy        NUMBER                  NULL,
    sentence_next_repetition DATE                    NULL,
    sentence_repetition_step SMALLINT    DEFAULT 0   NULL,
    sentence_interval        NUMBER(3)   DEFAULT 1   NULL,
    sentence_ease_factor     NUMBER(2,1) DEFAULT 2.5 NULL
);


CREATE TABLE community_post
(
    id                       NUMBER                 NOT NULL,
    user_id                  NUMBER                 NOT NULL,
    sentence_id              NUMBER                 NULL,
    community_post_category  VARCHAR2(20)           NOT NULL,
    community_post_title     VARCHAR2(100)          NOT NULL,
    community_post_content   CLOB                   NOT NULL,
    community_post_hit       NUMBER DEFAULT 0       NULL,
    community_post_writedate DATE   DEFAULT SYSDATE NULL,
    community_post_like      NUMBER DEFAULT 0       NULL
);


CREATE TABLE board_notice
(
    id               NUMBER                 NOT NULL,
    user_id          NUMBER                 NOT NULL,
    notice_title     VARCHAR2(100)          NOT NULL,
    notice_content   CLOB                   NOT NULL,
    notice_hit       NUMBER DEFAULT 0       NULL,
    notice_writedate DATE   DEFAULT SYSDATE NULL,
    notice_like      NUMBER DEFAULT 0       NULL
);


CREATE TABLE community_reply
(
    id                         NUMBER               NOT NULL,
    community_post_id          NUMBER               NOT NULL,
    user_id                    NUMBER               NOT NULL,
    community_reply_writedate  DATE DEFAULT SYSDATE NULL,
    community_reply_content    VARCHAR2(300)        NOT NULL,
    community_reply_parents_id NUMBER               NOT NULL
);


CREATE TABLE learning
(
    id                 NUMBER        NOT NULL,
    user_id            NUMBER        NOT NULL,
    learning_type      VARCHAR2(10)  NULL,
    learning_test_type VARCHAR2(10)  NULL,
    learning_topic     CLOB NOT NULL,
    learning_date      DATE          NULL,
    learning_like      CHAR(1)       NULL
);


CREATE TABLE board_question
(
    id                 NUMBER                  NOT NULL,
    user_id            NUMBER                  NOT NULL,
    question_category  VARCHAR2(20)            NOT NULL,
    question_title     VARCHAR2(100)           NOT NULL,
    question_content   CLOB                    NOT NULL,
    question_hit       NUMBER  DEFAULT 0       NULL,
    question_writedate DATE    DEFAULT SYSDATE NULL,
    question_status    CHAR(1)                 NULL
);




CREATE TABLE board_faq
(
    id           NUMBER        NOT NULL,
    user_id      NUMBER        NOT NULL,
    faq_category VARCHAR2(20)  NOT NULL,
    faq_title    VARCHAR2(100) NOT NULL,
    faq_content  CLOB          NOT NULL
);


CREATE TABLE FLASHCARD
(
    id             NUMBER       NOT NULL,
    user_id        NUMBER       NOT NULL,
    flashcard_name VARCHAR2(30) NOT NULL
);



CREATE TABLE question_reply
(
    id                       NUMBER               NOT NULL,
    question_id              NUMBER               NOT NULL,
    user_id                  NUMBER               NULL,
    question_reply_writedate DATE DEFAULT SYSDATE NULL,
    question_reply_content   VARCHAR2(300)        NOT NULL,
    question_reply_parent_id NUMBER               NULL
);


CREATE TABLE report
(
    id                  NUMBER               NOT NULL,
    user_id             NUMBER               NOT NULL,
    report_subject      VARCHAR2(20)         NULL,
    report_subject_id   NUMBER               NULL,
    report_reason       VARCHAR2(45)         NOT NULL,
    report_date         DATE DEFAULT SYSDATE NULL
);


CREATE TABLE bookmark
(
    community_post_id NUMBER NOT NULL,
    user_id           NUMBER NOT NULL
);


CREATE TABLE likes
(
    user_id             NUMBER NOT NULL,
    community_post_id   NUMBER NOT NULL
);


CREATE TABLE topic (
    id	NUMBER		    NOT NULL,
    learning_type	    VARCHAR2(10) NOT NULL,
    learning_test_type	VARCHAR2(10) NULL,
    learning_topic      CLOB NOT NULL
);

ALTER TABLE USERS ADD CONSTRAINT PK_USERS PRIMARY KEY (id);
ALTER TABLE SENTENCE ADD CONSTRAINT PK_SENTENCE PRIMARY KEY (id);
ALTER TABLE COMMUNITY_POST ADD CONSTRAINT PK_COMMUNITY_POST PRIMARY KEY (id);
ALTER TABLE BOARD_NOTICE ADD CONSTRAINT PK_BOARD_NOTICE PRIMARY KEY (id);
ALTER TABLE COMMUNITY_REPLY ADD CONSTRAINT PK_COMMUNITY_REPLY PRIMARY KEY (id);
ALTER TABLE LEARNING ADD CONSTRAINT PK_LEARNING PRIMARY KEY (id);
ALTER TABLE BOARD_QUESTION ADD CONSTRAINT PK_BOARD_QUESTION PRIMARY KEY (id);
ALTER TABLE BOARD_FAQ ADD CONSTRAINT PK_BOARD_FAQ PRIMARY KEY (id);
ALTER TABLE FLASHCARD ADD CONSTRAINT PK_FLASHCARD PRIMARY KEY (id);
ALTER TABLE QUESTION_REPLY ADD CONSTRAINT PK_QUESTION_REPLY PRIMARY KEY (id);
ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (id);
ALTER TABLE TOPIC ADD CONSTRAINT PK_TOPIC PRIMARY KEY (id);

CREATE SEQUENCE BOARD_FAQ_ID_SEQ;
CREATE SEQUENCE BOARD_NOTICE_ID_SEQ;
CREATE SEQUENCE BOARD_QUESTION_ID_SEQ;
CREATE SEQUENCE COMMUNITY_POST_ID_SEQ;

CREATE SEQUENCE COMMUNITY_REPLY_ID_SEQ;
CREATE SEQUENCE FLASHCARD_ID_SEQ;
CREATE SEQUENCE LEARNING_ID_SEQ;
CREATE SEQUENCE QUESTION_REPLY_ID_SEQ;
CREATE SEQUENCE REPORT_ID_SEQ;

CREATE SEQUENCE SENTENCE_ID_SEQ;
CREATE SEQUENCE USERS_ID_SEQ;
CREATE SEQUENCE TOPIC_ID_SEQ;

commit;