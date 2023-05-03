SELECT * FROM USERS;
SELECT * FROM SENTENCE;
SELECT * FROM COMMUNITY_POST;
SELECT * FROM BOARD_NOTICE;
SELECT * FROM COMMUNITY_REPLY;
SELECT * FROM LEARNING;
SELECT * FROM BOARD_QUESTION;
SELECT * FROM BOARD_FAQ;
SELECT * FROM FLASHCARD;
SELECT * FROM QUESTION_REPLY;
SELECT * FROM REPORT;
SELECT * FROM BOOKMARK;
SELECT * FROM LIKES;
SELECT * FROM TOPIC;

DELETE FROM USERS WHERE 1 = 1;
DELETE FROM SENTENCE WHERE 1 = 1;
DELETE FROM COMMUNITY_POST WHERE 1 = 1;
DELETE FROM BOARD_NOTICE WHERE 1 = 1;
DELETE FROM COMMUNITY_REPLY WHERE 1 = 1;
DELETE FROM LEARNING WHERE 1 = 1;
DELETE FROM BOARD_QUESTION WHERE 1 = 1;
DELETE FROM BOARD_FAQ WHERE 1 = 1;
DELETE FROM FLASHCARD WHERE 1 = 1;
DELETE FROM QUESTION_REPLY WHERE 1 = 1;
DELETE FROM REPORT WHERE 1 = 1;
DELETE FROM BOOKMARK WHERE 1 = 1;
DELETE FROM LIKES WHERE 1 = 1;
DELETE FROM TOPIC WHERE 1 = 1;

INSERT INTO USERS (
    ID,
    USER_EMAIL,
    USER_LOGIN_ID,
    USER_PASSWORD,
    USER_PASSWORD_SALT,
    USER_NICKNAME,
    USER_ROLE,
    USER_BIRTHDAY,
    USER_CREATEDATE,
    USER_EMAIL_AGREEMENT
)
VALUES (
    USERS_ID_SEQ.nextval,
    'admin@gpteacher.com',
    'admin',
    '71b0f7e1a6223ce5a5e9722bd00d3b77837ccf18a63c809316ebab446daf19e7',
    '5d9fec42-fba4-49d4-9ccc-1bfa21f2a2e0',
    '어드민',
    'ADMIN',
    SYSDATE,
    SYSDATE,
    1
);

INSERT INTO USERS (
    ID,
    USER_EMAIL,
    USER_LOGIN_ID,
    USER_PASSWORD,
    USER_PASSWORD_SALT,
    USER_NICKNAME,
    USER_ROLE,
    USER_BIRTHDAY,
    USER_CREATEDATE,
    USER_EMAIL_AGREEMENT
)
VALUES (
   USERS_ID_SEQ.nextval,
   'user@gpteacher.com',
   'user',
   '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060',
   'e993212e-c625-4f60-8295-d287f5c9b82e',
   '토익100점',
   'USER',
   SYSDATE,
   SYSDATE,
   1
);


-- 커뮤니티 게시글 등록일 랜덤 설정
UPDATE community_post
SET COMMUNITY_POST_WRITEDATE = CASE
                                   WHEN ID = 250 THEN '23/04/01'
                                   ELSE
                                       TO_CHAR(
                                                   DATE '2023-03-01' + (TRUNC(DBMS_RANDOM.VALUE(0, 68)) * INTERVAL '1' DAY),
                                                   'YY/MM/DD'
                                           )
    END
WHERE ID BETWEEN 250 AND 300;
select * from COMMUNITY_POST;