DROP TABLE users;
DROP TABLE sentence;
DROP TABLE community_post;
DROP TABLE board_notice;
DROP TABLE community_reply;
DROP TABLE learning;
DROP TABLE admin_user;
DROP TABLE voice_file;
DROP TABLE board_question;
DROP TABLE board_faq;
DROP TABLE FLASHCARD;
DROP TABLE question_reply;
DROP TABLE report_list;
DROP TABLE bookmark;
DROP TABLE likes;

CREATE TABLE users
(
    id              NUMBER               NOT NULL,
    user_email      VARCHAR2(45)         NULL,
    user_login_id   VARCHAR2(12)         NULL,
    user_password   VARCHAR2(32)         NULL,
    user_nickname   VARCHAR2(24)         NULL,
    user_birthday   DATE                 NULL,
    user_createdate DATE DEFAULT SYSDATE NULL
);


CREATE TABLE sentence
(
    id                       NUMBER            NOT NULL,
    learning_id              NUMBER            NOT NULL,
    flashcard_id             NUMBER            NULL,
    voice_file_id            NUMBER            NULL,
    sentence_question        VARCHAR2(255)     NOT NULL,
    sentence_answer          VARCHAR2(255)     NOT NULL,
    sentence_corrected       VARCHAR2(255)     NULL,
    sentence_explanation     VARCHAR2(255)     NULL,
    sentence_like            CHAR(1) DEFAULT 0 NOT NULL,
    sentence_accuracy        NUMBER            NULL,
    sentence_next_repetition DATE              NULL,
    sentence_repetition_step SMALLINT          NULL
);


CREATE TABLE community_post
(
    id                       NUMBER                 NOT NULL,
    user_id                  NUMBER                 NOT NULL,
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
    admin_id         NUMBER                 NOT NULL,
    notice_title     VARCHAR2(50)           NOT NULL,
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
    learning_test_name VARCHAR2(10)  NULL,
    learning_topic     VARCHAR2(1000) NOT NULL,
    learning_date      DATE          NULL,
    learning_like      CHAR(1)       NULL
);


CREATE TABLE admin_user
(
    id             NUMBER       NOT NULL,
    admin_login_id VARCHAR2(45) NOT NULL,
    admin_password VARCHAR2(45) NOT NULL,
    admin_nickname VARCHAR2(24) NOT NULL
);


CREATE TABLE voice_file
(
    id                   NUMBER        NOT NULL,
    voice_file_name      VARCHAR2(50)  NULL,
    voice_file_byte_size NUMBER        NULL,
    voice_file_directory VARCHAR2(255) NULL
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
    question_status    CHAR(1) DEFAULT 'N'     NULL,
    question_password  VARCHAR2(32)            NOT NULL
);




CREATE TABLE board_faq
(
    id           NUMBER        NOT NULL,
    admin_id     NUMBER        NOT NULL,
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
    admin_id                 NUMBER               NULL,
    question_reply_writedate DATE DEFAULT SYSDATE NULL,
    question_reply_content   VARCHAR2(300)        NOT NULL,
    question_reply_parent_id NUMBER               NOT NULL
);


CREATE TABLE report_list
(
    id                  NUMBER               NOT NULL,
    user_id             NUMBER               NOT NULL,
    reported_subject    VARCHAR2(20)         NULL,
    reported_subject_id NUMBER               NULL,
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
    user_id        NUMBER NOT NULL,
    community_post NUMBER NOT NULL
);

ALTER TABLE users
    ADD CONSTRAINT PK_USERS PRIMARY KEY (
                                         id
        );

ALTER TABLE sentence
    ADD CONSTRAINT PK_SENTENCE PRIMARY KEY (
                                            id
        );

ALTER TABLE community_post
    ADD CONSTRAINT PK_COMMUNITY_POST PRIMARY KEY (
                                                  id
        );

ALTER TABLE board_notice
    ADD CONSTRAINT PK_BOARD_NOTICE PRIMARY KEY (
                                                id
        );

ALTER TABLE community_reply
    ADD CONSTRAINT PK_COMMUNITY_REPLY PRIMARY KEY (
                                                   id
        );

ALTER TABLE learning
    ADD CONSTRAINT PK_LEARNING PRIMARY KEY (
                                            id
        );

ALTER TABLE admin_user
    ADD CONSTRAINT PK_ADMIN_USER PRIMARY KEY (
                                              id
        );

ALTER TABLE voice_file
    ADD CONSTRAINT PK_VOICE_FILE PRIMARY KEY (
                                              id
        );

ALTER TABLE board_question
    ADD CONSTRAINT PK_BOARD_QUESTION PRIMARY KEY (
                                                  id
        );

ALTER TABLE board_faq
    ADD CONSTRAINT PK_BOARD_FAQ PRIMARY KEY (
                                             id
        );

ALTER TABLE FLASHCARD
    ADD CONSTRAINT PK_FLASHCARD PRIMARY KEY (
                                             id
        );

ALTER TABLE question_reply
    ADD CONSTRAINT PK_QUESTION_REPLY PRIMARY KEY (
                                                  id
        );

ALTER TABLE report_list
    ADD CONSTRAINT PK_REPORT_LIST PRIMARY KEY (
                                               id
        );


CREATE SEQUENCE ADMIN_ID_SEQ;
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
CREATE SEQUENCE VOICE_FILE_ID_SEQ;