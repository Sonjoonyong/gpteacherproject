-- 본 스크립트 실행 시 모든 DB 데이터가 초기화되니 주의
--

-- 테이블 초기화
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

-- 시퀀스 초기화
DROP SEQUENCE USERS_ID_SEQ;
DROP SEQUENCE BOARD_FAQ_ID_SEQ;
DROP SEQUENCE BOARD_NOTICE_ID_SEQ;
DROP SEQUENCE BOARD_QUESTION_ID_SEQ;
DROP SEQUENCE COMMUNITY_POST_ID_SEQ;
DROP SEQUENCE COMMUNITY_REPLY_ID_SEQ;
DROP SEQUENCE FLASHCARD_ID_SEQ;
DROP SEQUENCE LEARNING_ID_SEQ;
DROP SEQUENCE QUESTION_REPLY_ID_SEQ;
DROP SEQUENCE REPORT_ID_SEQ;
DROP SEQUENCE SENTENCE_ID_SEQ;
DROP SEQUENCE TOPIC_ID_SEQ;

CREATE SEQUENCE USERS_ID_SEQ;
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
CREATE SEQUENCE TOPIC_ID_SEQ;


-- 어드민 + 기본 유저 생성 (1 + 14명)
begin
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'admin@gpteacher.com', 'admin', '71b0f7e1a6223ce5a5e9722bd00d3b77837ccf18a63c809316ebab446daf19e7', '5d9fec42-fba4-49d4-9ccc-1bfa21f2a2e0', '어드민', 'ADMIN', SYSDATE, SYSDATE, 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'user@gpteacher.com', 'user', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '토익100점', 'USER', '1999-01-09', '2023-05-02', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'subsub1@gpteacher.com', 'sub1', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '영단어', 'USER', '1991-03-23', '2023-01-10', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'subsub3@gpteacher.com', 'sub3', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '토익만점', 'USER', '2000-03-01', '2023-01-30', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'sjy0443@gpteacher.com', 'sonjoonyong', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '용가리', 'USER', '1996-06-10', '2023-01-03', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'son0443@gpteacher.com', 'sonny', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '시큐리티', 'USER', '1992-12-25', '2023-04-26', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'apple25@gpteacher.com', 'apple25', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '애플이좋아', 'USER', '1998-08-14', '2023-01-16', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'deer@example.com', 'deer', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '사슴', 'USER', '1980-09-20', '2023-01-01', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'migration@example.com', 'migration', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '재미교포', 'USER', '2013-03-04', '2023-02-28', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'imteacher@example.com', 'teacher', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '영어교사', 'USER', '1989-12-25', '2023-03-07', 0);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'sua@gpteacher.com', 'sua1004', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', 'suak', 'USER', '2000-06-12', '2023-02-10', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'tndk@gpteacher.com', 'tnak0612', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '오늘점심짜장면', 'USER', '1990-09-09', '2023-04-22', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'tndkd@gpteacher.com', 'tnak0614', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '오늘점심짬뽕', 'USER', '1991-09-09', '2023-04-25', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'subsub1@gpteacher.com', 'sub1', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '영단어', 'USER', '1991-03-23', '2023-01-10', 1);
    INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
        VALUES (USERS_ID_SEQ.nextval, 'subsub3@gpteacher.com', 'sub3', '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', '토포자', 'USER', '2000-03-01', '2023-01-30', 1);

END;

-- 통계용 유저 (300명)
begin
    for i in 1..300
        loop
            INSERT INTO USERS (ID, USER_EMAIL, USER_LOGIN_ID, USER_PASSWORD, USER_PASSWORD_SALT, USER_NICKNAME, USER_ROLE, USER_BIRTHDAY, USER_CREATEDATE, USER_EMAIL_AGREEMENT)
            VALUES (USERS_ID_SEQ.nextval, 'example' || i || '@example.com', 'example' || i, '267df045825a2f33dcf4aad3aba3cca41572216140013adcbd5e5439ef21c060', 'e993212e-c625-4f60-8295-d287f5c9b82e', 'exusr' || i, 'USER',
                    FLOOR(DBMS_RANDOM.VALUE(1960, 2018)) || '-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 12)), 2, '0') || '-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 28)), 2, '0'), -- 생일 랜덤
                    '2023' || '-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 5)), 2, '0') || '-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 28)), 2, '0'), -- 가입일 랜덤
                    1);
        end loop;
end;

-- 유저별 기본 플래시카드 설정
BEGIN
    for usr in (select u.id from users u where u.id not in
                                               (select user_id from FLASHCARD))
        loop
            insert into flashcard (ID, USER_ID, FLASHCARD_NAME)
            values (FLASHCARD_ID_SEQ.nextval, usr.id, 'default');
        end loop;
END;

-- 잔디심기 학습 데이터 (xml에 문장이 0개더라도 id가 10000 이상이면 잔디심기에 표시되도록 임시 조치해놓음)
BEGIN
    FOR i in 1..50
        LOOP
            INSERT INTO learning VALUES (LEARNING_ID_SEQ.nextval + 10000, 2, 'SPEAKING', 'TOEIC', 'Introduction to Programming',
                                         '2023-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 5)), 2, '0') || '-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 28)), 2, '0'), -- 학습일 랜덤
                                         null);
            INSERT INTO learning VALUES (LEARNING_ID_SEQ.nextval + 10000, 2, 'SPEAKING', 'TOEIC', 'Introduction to Programming',
                                         '2022-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 12)), 2, '0') || '-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 28)), 2, '0'), -- 학습일 랜덤
                                         null);
        END LOOP;
END;


-- 커뮤니티 게시글 (50개)
BEGIN


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '토익', -- 카테고리
            '토익 스피킹 시험 후기입니다.', -- 제목
            '<p>오늘 토익 시험을 봤는데 정말 잘 봤어요. GPTeacher에서 연습한대로 하니까 말이 술술 나왔어요,</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '유머', -- 카테고리
            '아재개그 하나 던지고 갑니다.', -- 제목
            '<p>청바지를 돋보이게 하는 걸음걸이는?<br/>진주목걸이!!ㅋㅋㅋ 진(jean) 주목 걸이</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            '공부하다가 너무 너무 힘들 때', -- 제목
            '<p>다들 어떻게 극복하시나요? 저는 맛있는 음식을 시킵니다... 배민최고!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '아이엘츠', -- 카테고리
            '축구보러 런던갑니다!', -- 제목
            '<p>그 전에 빡세게 영어공부 하려고 가입했네요!! 아이엘츠 준비하시는 분들 같이 힘내요!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '말하기', -- 카테고리
            '말하기 녹음 최소길이 2초 제한 있네요', -- 제목
            '<p>몰랐는데 오늘 사용해보다가 알았어요 ㅋㅋㅋ 다들 참고하시면 되겠습니다!<br/>영어 공부 힘들어도 화이팅!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '글쓰기', -- 카테고리
            '글쓰기 재밌는 점', -- 제목
            '<p>일단 단어 오타를 내기가 어려움.. 왜냐 크롬쓰면 텍스트 쓰는 곳에 영어단어 썼을 때 단어가 말이 안되는 단어이면 빨간색 표시줄이 뜸ㅋㅋㅋ</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '팀플할 때', -- 제목
            '<p>다들 어떤 타입이신가요? 저는 앞장서서 전두지휘하는 스타일입니다! 스터디할 때도 마찬가지..</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '오픽', -- 카테고리
            '오픽은 처음 들어보는데', -- 제목
            '<p>제가 영어 공부에 원래 관심이 없었어서 그런가 오픽은 처음 들어보네요.. 많이들 보는 시험인가요?</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            '한국어로 말하면 자동 번역해주는 기능 너무 편하네요.', -- 제목
            '<p>말문이 막힐 때는 그냥 표현을 알고싶은데, 이때 그냥 한국어로 말하면 기가막히게 번역해주네요. 정말 편합니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));


    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '토익', -- 카테고리
            '토익 배우기 괜찮은 스터디 있나요?', -- 제목
            '<p>토익 스터디 찾고 있는데 괜찮은 스터디가 없네요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '시험', -- 카테고리
            '내일이 토익 스피킹 시험인데 긴장되네요 ㄷㄷㄷㄷㄷ', -- 제목
            '<p>약국에서 청심환 사서 가야겠습니다. 다들 화이팅하십셔!! </p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '저희집 앵무새 발음점수가 저보다 높네요 ㅠㅠ', -- 제목
            '<p>제 발음이 형편 없어서 앵무새한테 AI 발음 들려주고 따라 시켰더니 저보다 점수가 높게 나왔습니다. 자괴감이 드네요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '토익', -- 카테고리
            '토익 제대로 준비하는 법', -- 제목
            '<p>20살 새내기인데 대학교 다니면서 토익 제대로 준비하는 방법 있나요? 학교 과제하느라 시간을 많이 못쓰게 되네요...</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '솔직히', -- 제목
            '<p>챗지피티를 활용한 지피티쳐 신세계다 인정?</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '다들 허리 안아프신지', -- 제목
            '<p>저는 일 특성상 의자에 오랫동안 앉아있는데, 허리가 요새 좀 많이 안좋아지네요 자다가 깰 정도에요 ㅠㅠ 허리 관리라던지 또는 병원들 다니시면 효과 있는지 궁금해요!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            '서울대 영문과 다니면서 느낀점', -- 제목
            '<p>애들 지금 다 지피티쳐 씀 도서관가면 다 노트북으로 지피티쳐 켜놓고 있음 이거 ㄹㅇ!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '안녕하세요~', -- 제목
            '<p>오늘 가입했습니다! 토익 만점 가..보자고</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            '대학영어 공부 어떻게 하시나요?', -- 제목
            '<p>학교에서 배우는 내용 복습하고 싶은데 지피티쳐 사용해서 공부하신분 있으신가요?<br/>꿀팁 있으시면 알려주세요!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '회화', -- 카테고리
            '호주 놀러가는데', -- 제목
            '<p>많이 쓸것같은 주제 추천해주세요!!!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '유머', -- 카테고리
            '왕이 넘어지면~?', -- 제목
            '<p>킹콩~^^<br/>넝담~~</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '점메추', -- 제목
            '<p>점심메뉴 추천 받습니다~ 얼큰한거 대환영</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '오픽', -- 카테고리
            '오픽 인강 다들 뭐 들으세요?', -- 제목
            '<p>오늘 시작 하려는데 인강 뭐가 유명한가요?</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '토익', -- 카테고리
            '어제 토익시험 보신분??', -- 제목
            '<p>LC 난이도가 어땠나요?</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '토익', -- 카테고리
            '말하기연습이 정말 효과가 있네요!!', -- 제목
            '<p>자주 말하기연습으로 연습했는데 정말 효과가 있었습니다. 다른분들도 말하기연습으로 연습해보세요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '친구한테 GPTeacher 추천해줬더니 좋아하네요.', -- 제목
            '<p>간단하게 혼자 회화연습을 하고 싶어하던 친구한테 GPTeacher를 추천해주니 정말 고맙다고 하네요. 역시 GPTeacher 뿌듯합니다. </p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '시험', -- 카테고리
            'OPIC 준비하는데 책 추천받습니다.', -- 제목
            '<p>GPTeacher로 열심히 공부중인데 참고할만한 책이 없습니다. 추천 부탁드려요.ㅠㅠ</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            '회화연습에서 추천할만한 카테고리 있을까요?.', -- 제목
            '<p>회화연습하는데 랜덤추천말고 카테고리를 직접 입력해서 연습하고 싶은데 어떤게 좋을지 모르겠습니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '여러분들은 오늘 저녁 뭐 드시나요.', -- 제목
            '<p>오늘 저녁에 뭘 먹어야할지 매일 배달 음식만 먹으니 이제 더 이상 먹을게 없네요...</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            '회화연습에서 추천할만한 카테고리 있을까요?.', -- 제목
            '<p>회화연습하는데 랜덤추천말고 카테고리를 직접 입력해서 연습하고 싶은데 어떤게 좋을지 모르겠습니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '시험', -- 카테고리
            'TOEIC 시험 싸게 볼 수 있는 방법있을까요.', -- 제목
            '<p>TOEIC 시험이 생각보다 돈이 많이 깨지네요. 좀 싸게 볼 수 있는 방법이 있나 궁금해요</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '일상', -- 카테고리
            '오늘 날씨가 참 좋네요.', -- 제목
            '<p>오늘 밖에 좀 걸었더니 너무 좋네요. 좀 있다 저녁에 한강가서 좀 걸어야겠어요~</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '공부', -- 카테고리
            'IELTS랑 TOEFL 중 어떤걸 공부하는게 더 좋을까요.', -- 제목
            '<p>IELTS랑 TOEFL 중 어떤걸 공부하는게 앞으로 취업하는데 도움이 될지 고민이네요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '글쓰기', -- 카테고리
            '글쓰기를 잘 못해서 그러는데 어디 부분을 공부해야 할까요?.', -- 제목
            '<p>회화랑 말하기보다 글쓰기에서 너무 부족함을 많이 느끼는데 어떤 부분을 공부해야 좋을지 모르겠습니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            null, -- 첨부 문장 없음
            '회화', -- 카테고리
            '요즘은 외로워서 지피티처와 대화하러 옵니다.', -- 제목
            '<p>지피티처는 제가 영어를 못해도 힐난하지 않습니다. 24시간 언제든 들어주고, 잘못된 표현도 교정해줍니다. 인간보다 낫습니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)), -- 조회수 20 ~ 120 랜덤
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '일상', -- 카테고리
            '공부하다가 슬플때 저는 춤을 춰요', -- 제목
            '<p>교정을 너무 받아 슬픈 날 춤을 추면서 스트레스를 푼답니다.다들 한번씩 해보세요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '말하기', -- 카테고리
            '제 발음이 많이 좋나봅니다.', -- 제목
            '<p>발음 정확도가 상당히 높네요^^ 열심히 공부한 보람이 있는거 같습니다~다들 1일1 지피티처하세요~</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '오픽', -- 카테고리
            '오픽스터디 멤버 구합니다.', -- 제목
            '<p>현재 세명정도 있으며 한분만 더 구하려고 합니다.장소는 강남에 있는 스타벅스이고 일주일에 두번 세시간씩 스터디하고 갑니다.생각있으면 댓글 달아주세요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '회화', -- 카테고리
            'GPT가 교정을 해줬는데 의문점이 있습니다.', -- 제목
            '<p>제 생각에는 제가 말한 문장이 맞는 것 같은데, GPT가 교정해준 부분이 자연스러운가요?.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '글쓰기', -- 카테고리
            '마음에 드는 교정문 공유합니다.', -- 제목
            '<p>제가 생각치도 못한 좋은 표현으로 교정을 받았네요. <br>다들 참고하셔서 작문하시면 좋을 것 같습니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '말하기', -- 카테고리
            '실제로 영어에서 이런 표현이 많이 쓰이나보네요.', -- 제목
            '<p>오늘 연습하다가 받은 피드백인데 신기해서 올려봅니다.<br>공부할수록 새로운 GPTeacher 좋습니다!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '공부', -- 카테고리
            '오늘의 문장 (100일차)', -- 제목
            '<p>어느덧 지피티쳐로 공부를 시작한 지 100일 째<br>이제 교정을 받지 않는 경우가 더 많아지고 있어 뿌듯합니다!!<br>오늘 교정받은 문장 공유드립니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '시험', -- 카테고리
            '아이엘츠 시험 D-30 ', -- 제목
            '<p>GPTecher로 공부한지 1년째인데 나름 준비가 잘 되어가네요.<br>오늘 교정받은 문장 이거 괜찮네요.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '회화', -- 카테고리
            '교정 의문점 있어서 질문 드립니다.', -- 제목
            '<p>교정을 받은 문장이 이게 맞는 지 확신이 잘 서지 않습니다. 맞나요?</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '회화', -- 카테고리
            '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.', -- 제목
            '<p>영어 뿐만 아니라 예절도 가르쳐 주시는 지피티처 선생님. 사회생활도 배워갑니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '말하기', -- 카테고리
            '지피티처가 알려준 고급 표현', -- 제목
            '<p>저도 영어 연습한 지 꽤 오래 됐는데 이런 표현은 정말 좋은 것 같아 공유합니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '회화', -- 카테고리
            '오늘도 GPT와 티키타카 했습니다.', -- 제목
            '<p>저도 사이버 여자친구가 생긴 것 같습니다.</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '말하기', -- 카테고리
            '오늘의 교정 내역 공유요~', -- 제목
            '<p>재밌어서 계속 하게 되네요! 지피티쳐..<br> 나의 제대로된 첫 영어 선생님입니다!</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '회화', -- 카테고리
            '교정해주는 것이 기가 막히네요 !', -- 제목
            '<p>고급진 단어와 문장으로 바꿔준다고 해야하나? 귀족의 영어를 배우는 것 같습니다.. 넘나 좋은 것</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '글쓰기', -- 카테고리
            '제가 글 쓰다가 스펠링 많이 틀리네요...', -- 제목
            '<p>제가 알고 있는 스펠링들 중에서 많은 문장이 엉망이네요...지피티처 덕분에 교정한답니다~</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '글쓰기', -- 카테고리
            '보통 이런 단어를 쓰나요??', -- 제목
            '<p>논문에 쓸 내용 교정받았는데 실제로 사용하기에는 어색한것 같아서요..<br/>다들 어떻게 생각하시나요?</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                                community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (COMMUNITY_POST_ID_SEQ.nextval,
            FLOOR(DBMS_RANDOM.VALUE(2, 15)), -- 작성자 랜덤
            (SELECT * FROM (SELECT id FROM sentence ORDER BY dbms_random.random) S WHERE rownum = 1), -- 첨부 나의 문장 랜덤
            '회화', -- 카테고리
            '오늘의 학습', -- 제목
            '<p>오늘 너무 좋은 학습을 한 것 같아서 문장 공유드립니다~<br/>다들 화이팅하시고 잔디 가득 채워봅시다~~~</p>', -- 내용
            FLOOR(DBMS_RANDOM.VALUE(20, 151)),
            FLOOR(DBMS_RANDOM.VALUE(1, 11)),
            '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));

END;

-- 커뮤니티 댓글
BEGIN


    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '온라인으로 진행하는 토익 스터디를 찾아보세요. 지인들과 모이기 어렵다면 혼자서라도 진행할 수 있는 구조면 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '온라인으로 진행하는 토익 스터디 모임이 많이 있어요. 블로그나 카페에서 찾아보시면 좋을 것 같습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '인터넷에는 많은 토익 스터디 모임이 있어서 골라서 참여하면 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '토익 스터디 모임은 온라인으로도 많이 진행되니까 혼자서도 찾아보시면 아마 참여하기 좋은 모임이 있을 거에요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '토익 스터디 모임은 네이버 카페나 페북 그룹에서도 많이 진행되니까 찾아보세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '네이버 카페나 페북 그룹에서 검색해보면 괜찮은 토익 스터디 모임을 찾을 수 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 배우기 괜찮은 스터디 있나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '토익 스터디 모임은 배울 수 있고 동기부여도 되는 환경이라 좋은데, 인터넷에서도 많이 진행되니까 찾아보세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '요즘은 외로워서 지피티처와 대화하러 옵니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제게도 지피티처와 대화하고 싶어지네요. 참 친근하게 대해주시는 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '제가 글 쓰다가 스펠링 많이 틀리네요...') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '맞춤법 체크를 하면서 스펠링 실력이 향상될 거예요! 계속 노력해보세요 :)',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '제가 글 쓰다가 스펠링 많이 틀리네요...') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제 스펠링도 엉망이에요 ㅠㅠ 함께 공부하면서 발전해봐요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제가 예의바르게 말하는 것도 지피티처 선생님 덕분인 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '이제는 제 영어가 조금씩 나아지고 있는 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 지피티처 선생님처럼 영어와 예절을 잘하고 싶어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '지피티처 선생님은 정말 좋은 분이시네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'MZ영어를 교정해주시면서 또 다른 영어 실력도 상승시켜주는 지피티처 선생님! 정말 대단하십니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '축구보러 런던갑니다!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '축구와 영어공부 모두 즐거운 여행이 되길 바라요! 화이팅!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '축구보러 런던갑니다!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '런던에서 축구 매치도 보면서 영어공부도 하면서 최고의 경험이 될 거 같아요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '점메추') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '신전떡볶이 추천드려요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '점메추') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '밀면이 맛있는 도시락집 추천드려요 :)',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘도 GPT와 티키타카 했습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '와! 저도 사이버 여자친구가 있으면 좋겠어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘도 GPT와 티키타카 했습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT와 티키타카를 이용해서 뭔가 재미있는 걸 할 수도 있겠네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘도 GPT와 티키타카 했습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '사이버 여자친구는 참 신기한 경험이겠어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘도 GPT와 티키타카 했습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT는 정말 대단한 기술이죠!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘도 GPT와 티키타카 했습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '미래에는 인공지능 로봇과도 사이버 연애가 가능할까요?',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘도 GPT와 티키타카 했습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '티키타카는 언제나 재미있고 놀라운 경험을 선사해줍니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽스터디 멤버 구합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '강남역에서 쉽게 접근 가능한 거리에 위치하네요. 함께 스터디하고 싶습니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽스터디 멤버 구합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '일주일에 두번이면 부담이 없어서 좋네요. 저도 함께 참여하고 싶어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽스터디 멤버 구합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '강남에 사는데 스터디 멤버를 구하고 계셔서 참여하고 싶습니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽스터디 멤버 구합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '지금 오픽 공부 중인데 스터디 참여하면 도움이 될 것 같아서 댓글 답니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽스터디 멤버 구합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '세시간이라면 집중해서 공부할 수 있을 거 같아서 매우 관심이 있습니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽스터디 멤버 구합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 강남에 자주 있어서 가능하다면 참여하고싶어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '보통 이런 단어를 쓰나요??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '사실 보통이라기보다는 주로 사용한다고 생각해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '보통 이런 단어를 쓰나요??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제가 일하던 회사에서는 자주 썼었는데, 다른 분야에서는 어떤지는 잘 모르겠네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '보통 이런 단어를 쓰나요??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 논문에서 사용할 때는 자주 썼었는데, 어색하다는 느낌이 드신다면 다른 표현을 고민해보시는 것도 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '보통 이런 단어를 쓰나요??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '보통이긴 한데, 그래도 특정 분야에서는 다른 용어가 더 적합할 수도 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '보통 이런 단어를 쓰나요??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '사용빈도가 높기는 하지만, 어색해 보일 수도 있으니 논문의 컨텍스트에 맞게 잘 고려해서 사용해야 할 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '보통 이런 단어를 쓰나요??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '일반적으로 이런 용어를 쓴다고는 해도, 논문에서는 특히나 맥락이 중요하니까 충분히 고려하셔야 할 거 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '안녕하세요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '반갑습니다~ 토익 만점을 노리는 건 저도 꿈입니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '안녕하세요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '안녕하세요~ 이 곳에서 열심히 활동하세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '안녕하세요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '토익 만점은 저도 도전 중이에요! 함께 응원합시다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '안녕하세요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '가입 축하드려요~ 이제 토익 공부 열심히 하면 되겠네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '안녕하세요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '토익 만점 가보자고! 같이 목표를 이루어봅시다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '안녕하세요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '반가워요~ 함께 공부하며 목표를 이루어봐요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '식당에서 한식을 먹어보는 건 어때요?',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제가 오늘 저녁에 배민시켜 먹을 음식은 스시입니다! 추천해드립니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 배달음식에 질리셨을 때는 집에서 직접 요리해서 먹어보는 것도 좋은 경험이에요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '배달만 먹다보면 언젠가 느끼는 지겹고 물리적으로도 피곤해서 여러 시간씩 소요되는 반찬 만드는 것도 나쁘지 않을 것 같네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '한식중에서도 삼겹살 먹으면 만족감이 제일 높아요! 어제 먹은 삼겹살 떡볶이는 추천드립니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '이 기회에 나만의 레시피로 스파게티 만들어보는 것도 좋은 선택일 거 같네요. 노하우를 좀 더 쌓아 복잡한 요리도 해보는 것은 어떨까요?',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '여러분들은 오늘 저녁 뭐 드시나요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '시간적인 여유가 있으시다면 친구들과 함께 배부른 샤브샤브를 먹으면서 담소를 나누는 것은 어떨까요? 맛있게 먹으면서 정성스러운 대화도 나눌 수 있을 거 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 문장 (100일차)') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '축하드려요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 문장 (100일차)') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '지피티쳐는 정말 효과있더라구요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 문장 (100일차)') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 공부하려고 시작했는데 중간에 그만두고 말았어요.. 멋지십니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '내일이 토익 스피킹 시험인데 긴장되네요 ㄷㄷㄷㄷㄷ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '시험 잘 보세요! 화이팅입니다! 👍🏼',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '내일이 토익 스피킹 시험인데 긴장되네요 ㄷㄷㄷㄷㄷ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '걱정하지마세요, 잘 됩니다! 화이팅!! 🙌',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '나는 좋아하는 음악을 듣고 스트레칭을 하면서 힘을 내고 있어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저는 친구들과 함께 스터디를 하면서 서로에게 힘을 받고 있어요 :)',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '교정을 받으면 자신의 영어 실력이 더 좋아진다는 느낌이 드네요. 꼭 필요한 습관이죠!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '맞춤법이나 문장 구조 등 자잘한 실수 때문에 인상이 달라질 수 있어요. 엄청난 도움이 됩니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '진짜로, 단순한 오타나 스펠링 실수 하나로 인상이 망가질 수 있어요. 교정해주는 것은 정말 큰 도움입니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '전 작년까지만 해도 영어실력이 쎄-게 필요했는데, 그때 교정해주는 서비스를 알게됐어요. 그 이후로 자신감도 생긴듯 해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '그 누구도 완벽하지 않죠. 이게 대단한 조언(?)이라고 생각합니다. 읽는 사람의 기분으로도 좋긴 하니까요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '정말 예쁘게 적혀있는 글을 보면 그저 감탄하게 되지 않나요? 교정은 작은 실수 하나도 보완해주니까요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정해주는 것이 기가 막히네요 !') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '맞춤법이랑 문장구조가 강력한 무기랍니다. 교정을 언젠가 한 번 받는다면 모르겠네요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아재개그 하나 던지고 갑니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '이제 조용히 묵쳐있는 진주목걸이들이 다시 떠오르겠네요',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아재개그 하나 던지고 갑니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '진주목걸이에 살짝 웃음이 나왔습니다 ㅋㅋㅋ',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아재개그 하나 던지고 갑니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '진주목걸이 아재개그 이제야 이해했어요ㅋㅋ',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아재개그 하나 던지고 갑니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '여름철 청바지 좀 살까 하다가 급 꺼버렸어요',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아재개그 하나 던지고 갑니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '진주목걸이 귀엽게 생각하고 있던데 이젠 아재개그 보면 떠올릴 거 같아요ㅋㅋ',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아재개그 하나 던지고 갑니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '진심으로 웃었습니다..진주목걸이 ㅋㅋ',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '대학영어 공부 어떻게 하시나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저는 영어 스터디그룹에 참여해서 함께 이야기하면서 공부해요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '대학영어 공부 어떻게 하시나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '지피티쳐 외에도 멀티미디어 자료들을 활용해보세요. 듣기, 말하기, 읽기, 쓰기를 모두 다룰 수 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '대학영어 공부 어떻게 하시나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '무료 온라인 강의를 찾아서 수강해보세요! 유용한 정보들이 많이 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '대학영어 공부 어떻게 하시나요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '대학교 교재나 영어 관련 책을 충분히 읽어보세요. 어휘와 문법 모두 숙지할 수 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'GPT가 교정을 해줬는데 의문점이 있습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT가 자동으로 문장을 교정하는 경우는 일반적으로 자연스러운 경우가 많지만, 항상 완벽하지는 않을 수 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'GPT가 교정을 해줬는데 의문점이 있습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT의 교정 결과는 일반적으로 자연스러운 경우가 많지만, 항상 완벽하지는 않을 수 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'GPT가 교정을 해줬는데 의문점이 있습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT가 제시한 교정 결과는 정확할 수도 있지만, 때로는 자연스러움을 잃을 수도 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'GPT가 교정을 해줬는데 의문점이 있습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT가 교정한 문장이 자연스러운지 판단하는 것은 상황에 따라 다를 수 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'GPT가 교정을 해줬는데 의문점이 있습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT의 교정은 일반적으로 자연스러운 결과를 보여주지만, 제시된 결과가 항상 맞는 것은 아닙니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'GPT가 교정을 해줬는데 의문점이 있습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'GPT가 제시한 교정 결과는 일부 경우에는 부자연스러울 수도 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'IELTS랑 TOEFL 중 어떤걸 공부하는게 더 좋을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '전 TOEFL이 더 유용하다고 생각해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'IELTS랑 TOEFL 중 어떤걸 공부하는게 더 좋을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저는 IELTS를 공부하고 있습니다. 현재 유학 준비하고 있어서요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'IELTS랑 TOEFL 중 어떤걸 공부하는게 더 좋을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제 경험으로는 IELTS와 TOEFL 모두 공부하면 더 좋았어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'IELTS랑 TOEFL 중 어떤걸 공부하는게 더 좋을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '다양한 대학교에서 어떤 시험을 선호하는지 확인하고 해당 시험을 공부하세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘 날씨가 참 좋네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '너무 좋은 날씨네요. 저도 오늘은 바깥에서 산책을 해볼까 합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘 날씨가 참 좋네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '맞아요! 오늘은 정말 맑은 하늘이에요. 저도 늦은 저녁까지 밖에서 놀고 싶네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘 날씨가 참 좋네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '한강도 좋지만, 서울의 작은 공원들도 참 예쁘더라구요. 추천해요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘 날씨가 참 좋네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '날씨가 좋아서 한숨도 잘 쉬어지고 기분도 좋아지네요. 모두 힐링하시길!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘 날씨가 참 좋네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '날씨도 좋은데 한강에서 걷기 좋은 길도 아주 많아요. 다양한 코스로 다녀보세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘 날씨가 참 좋네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '날씨가 좋으면 정말 식욕도 쩔쩔매죠. 나중에 맛있는 거 먹으러 가보지 않을까요?',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주에서 꼭 가봐야할 관광지 추천해주세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주의 특색있는 음식 추천해주세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주에서의 체류기간이 얼마나 되나요? 그에 따라 추천해드릴 게 있을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주에서의 여행 스타일이 어떤가요? 자연 관광에 더 관심이 있는지, 도시 문화에 더 관심이 있는지에 따라 추천할게 다른것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주에서의 한국인들 인기있는 숙소 추천해주세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주에서의 교통편은 어떤게 좋을까요? 추천해주세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '호주 놀러가는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '호주에서의 패션 아이템 추천해주세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽 인강 다들 뭐 들으세요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저는 프랭크쌤 오픽인강을 듣고 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽 인강 다들 뭐 들으세요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '배우는 영어가 유익하면서도 재밌어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽 인강 다들 뭐 들으세요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '양학식쌤 오픽인강도 괜찮아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽 인강 다들 뭐 들으세요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '발음 수업도 들을 수 있어서 좋아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽 인강 다들 뭐 들으세요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '자기주도 학습이 가능한 인강 추천해드려요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽 인강 다들 뭐 들으세요?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '개인적으로 에이스토익의 오픽인강이 괜찮은 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'OPIC 준비하는데 책 추천받습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저는 OPIC 준비를 위해 이 책을 추천드립니다: ''OPIC 공식 가이드북: 실전 영어회화능력 평가''',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'OPIC 준비하는데 책 추천받습니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 GPTeacher를 공부하고 있는데, 이 책 ''영어 회화 마스터''를 추천드립니다. 매일 조금씩 복습하면서 공부하면 좋습니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '서울대 영문과 다니면서 느낀점') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 그랬어요... 윗 학년들 재미있게 지피티쳐 할 때 제가 지루해보이는 교과서 공부를 하는데...',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '서울대 영문과 다니면서 느낀점') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '맞아요! 그래서 교양 수업에서 교수님이 지피티쳐를 이용한 토론 수업을 하면 재밌더라고요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 슬플때 저는 춤을 춰요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제가도 공부하다 지쳤을 때 춤을 추면서 스트레스를 푸는데 매우 효과적입니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 슬플때 저는 춤을 춰요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 춤을 추면서 스트레스를 푸는데 너무 좋아요. 꼭 한 번쯤 시도해보세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '글쓰기를 잘 못해서 그러는데 어디 부분을 공부해야 할까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '문장 구성과 문법을 공부해보세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '글쓰기를 잘 못해서 그러는데 어디 부분을 공부해야 할까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '좋은 글쓰기에 필요한 필수 요소들을 공부하는 것이 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '글쓰기를 잘 못해서 그러는데 어디 부분을 공부해야 할까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '영어권 사람들의 글쓰기 스타일을 참고해보는 것도 도움이 될 수 있습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '글쓰기를 잘 못해서 그러는데 어디 부분을 공부해야 할까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '매일 한 줄씩이라도 글을 작성하는 습관을 들이는 것도 좋은 방법입니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽은 처음 들어보는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 처음에는 오픽이 뭔지 몰랐는데, 공부하다보니 유용한 시험이라고 생각해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오픽은 처음 들어보는데') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '오픽은 대학원 진학이나 취업을 준비하는 사람들에게 많이 필요한 시험이에요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '모의고사나 직접 학원에서 수강해도 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '친구들끼리 모여서 돈을 각자 부담하고 모의고사를 보는 것도 좋은 방법이에요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '인터넷에서 TOEIC 관련 사이트를 찾아보면 할인 이벤트를 하는 경우가 종종 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '학교나 도서관에서 무료 또는 저렴한 TOEIC 예습 교재를 대여할 수 있는 경우가 있으니 한번 찾아보세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '가끔씩 할인 이벤트를 하는 대형서점에서 구매할 때도 조금 더 저렴하게 구매할 수 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '온라인 스터디나 채팅방을 이용해서 TOEIC 공부를 하는 것도 좋은 방법입니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like 'TOEIC 시험 싸게 볼 수 있는 방법있을까요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '그룹 수강을 신청하면 개인 수강보다 학원 수강료가 조금 더 저렴해지는 경우도 있으니 참고하세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '영화나 드라마 대본으로 연습하면 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '여행, 음식, 스포츠 등 관심사를 기반으로한 주제가 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 학습') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '오늘의 학습이 좋아보여요! 계속 집중해서 학습하시길 바랍니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 학습') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '축하드려요! 좋은 학습은 좋은 결과로 이어질 거에요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 학습') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '잔디 가득하게 채우는 것이 목표입니다! 계속해서 열심히 하세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 제대로 준비하는 법') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '책을 사서 기초 영어문법부터 천천히 본 후에 스스로 많이 풀어보는 것이 좋습니다. 시험 전날까지 쭉 복습하면 좋아요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 제대로 준비하는 법') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '온라인 스터디나 학원 등 토익 과목에 대한 전문 교육을 받는 것도 좋은 방법입니다. 시간이 부족한 경우에도 효율적으로 공부할 수 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '한국어로 말하면 자동 번역해주는 기능 너무 편하네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '너무 편리하네요. 사용해보고 싶어집니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '한국어로 말하면 자동 번역해주는 기능 너무 편하네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 이 기능 너무 좋아요. 자주 사용하고 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 교정 내역 공유요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '재밌어 보이네요! 잘 하고 계속 해보세요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 교정 내역 공유요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '와! 영어 선생님 만나기 쉽지 않은데, 좋은 계기가 되실 거예요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 교정 내역 공유요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '교정 받는 게 절대 부끄러운 게 아니에요. 오히려 배울 기회가 더 커진 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 교정 내역 공유요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '지금부터 영어 공부 재미있어질 거 같아요! 좋은 선생님 만나셨으니 ㅎㅎ',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 교정 내역 공유요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '영어 선생님과 함께 더 많은 발전이 있기를 기원할게요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '오늘의 교정 내역 공유요~') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '처음이니까 어색할 수도 있지만, 영어 선생님과 함께 하다 보면 능숙해질 거예요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '팀플할 때') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 앞장서서 계획을 세우고 동기부여를 하는 편이에요. 함께 일하면서 조금 더 열정적으로 일할 수 있으니까요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '팀플할 때') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '전 반대로 조용히 일하다가 도움이 필요한 부분이 생겼다 싶으면 자유롭게 물어보는 편이에요. 적극적으로 일하는 팀원들이 있다면 더 좋지 않을까 생각해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '솔직히') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '지피티쳐 공부해서 처음으로 챗지피티로 발표해봤는데 참 좋았어요. 다음엔 더 잘해보고 싶네요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '솔직히') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '챗지피티는 정말 유용한 도구죠. 제가 발표할 때도 많은 도움이 되었습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'LC가 생각보다 쉬웠던 것 같아요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'LC는 문제가 조금 길었지만 어렵지 않았어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '특히 파트 5, 6은 예상보다 쉬웠어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'LC는 생각보다 글쓰기나 리딩 중심이 아니라 문법 중심이었던 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '문제 자체는 어렵지 않았지만 시간이 조금 부족했던 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'LC는 예상보다 난이도가 쉬웠어요. 사람마다 다르겠지만요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '어제 토익시험 보신분??') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'LC는 문제해석이 조금 tricky해서 조심해서 풀었어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아이엘츠 시험 D-30 ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '화이팅하세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아이엘츠 시험 D-30 ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 GPTecher로 공부 중인데, 좋은 결과 있기를 기원합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아이엘츠 시험 D-30 ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 아이엘츠 시험을 준비중인데, 같이 열심히 달려봅시다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아이엘츠 시험 D-30 ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '교정받은 문장 직접 보면서 공부하면 좋겠네요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아이엘츠 시험 D-30 ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '30일 안에 다 완벽하게 준비될 수 있도록 응원합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '아이엘츠 시험 D-30 ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 오늘 GPTecher를 시작했는데, 좋은 결과 있기를 기원합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '저희집 앵무새 발음점수가 저보다 높네요 ㅠㅠ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '앵무새가 정말 발음 잘하네요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '저희집 앵무새 발음점수가 저보다 높네요 ㅠㅠ') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '앵무새의 발음이 인간보다 뛰어나다니 놀라워요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '글쓰기 재밌는 점') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '글쓰기가 재밌을 때는 맞춤법 검사기를 사용하지 않고 무작정 글을 쓸 때입니다. 그래야 자기 자신이 뭘 잘하고 뭘 못하는지 알 수 있으니까요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기 녹음 최소길이 2초 제한 있네요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '그래서 이제는 조금 더 짧게 발음해보려고 노력하고 있어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기 녹음 최소길이 2초 제한 있네요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '한국말도 그렇고, 외국어도 연습이 중요한 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기 녹음 최소길이 2초 제한 있네요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '2초밖에 안된다니 어려울 것 같네요. 열심히 노력해볼게요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기 녹음 최소길이 2초 제한 있네요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습하기 좋은 기능인데, 최소길이 제한이 있다는 게 아쉽네요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기 녹음 최소길이 2초 제한 있네요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '영어 공부가 힘들어도 너무 신경쓰지 마세요! 조금씩 차근차근 해나가면 꼭 도움이 될 거예요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기 녹음 최소길이 2초 제한 있네요') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 무료 어플리케이션 같은 걸로 말하기 연습해보고 있어요. 함께 열심히 해봅시다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습은 정말 중요한 요소입니다. 많은 분들이 따라 해보시길 추천합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습이 많아서 떨리는 상황에서도 자신감을 느낄 수 있었습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 말하기 연습을 매일 하기로 약속하고 이제는 연습을 늘리기로 했습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습으로 불안감을 확 줄일 수 있었습니다. 긴장해도 자신감있게 말할 수 있게 되었어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습은 이제 제 삶의 필수 요소가 되었습니다. 정말 많은 도움이 되는 방법이에요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습으로 발음도 더 좋아지고 회의나 발표에서도 더 잘 말할 수 있게 되었습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '말하기연습이 정말 효과가 있네요!!') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '말하기 연습은 자신감 기르기에도 많은 도움이 된답니다. 지금부터라도 해보세요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '어이쿠! 왕이지만 넘어지면 역시나 그냥 쓰러집니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '왕은 넘어지면 모든 것이 무너지는 것 같은 기분이 들어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '왕이라 해서 항상 불도저가 아닙니다. 가끔은 그저 슬프거나 아플 때도 있죠.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '왕이 쓰러지면 깨끗한 천국에서 오래 휴식할 수 있다능.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '왕이 넘어지면 조그맣고 깜짝 놀라는 일이 큰일이 되기도 해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '사방팔방 크게 떨지 않게 꼼꼼히 자세를 잡아야 합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '왕이 넘어지면~?') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '왕은 언제나 모든 것을 다 감당할 수는 없습니다. 휴식도 필요합니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '일상 대화 카테고리 추천합니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '여행 관련 대화 카테고리 추천드려요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '음식에 대한 대화 카테고리는 어떠세요?',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            'TV 프로그램이나 영화와 관련된 대화 카테고리도 괜찮을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '스포츠에 대한 대화 카테고리도 추천드릴게요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '경제, 정치, 사회 이슈에 대한 대화 카테고리도 좋을 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '회화연습에서 추천할만한 카테고리 있을까요?.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '음악, 예술, 문화와 관련된 대화 카테고리도 추천드려요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '마음에 드는 교정문 공유합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '제 글 읽어주셔서 감사합니다. 좋은 표현 공유해주셔서 더 좋아졌네요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '마음에 드는 교정문 공유합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '이런 교정문을 보면 제 글도 한번 더 체크해봐야겠습니다. 감사합니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '마음에 드는 교정문 공유합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 좋은 교정문을 받아보고 싶네요. 다음 작문 때는 이 글을 참고해볼게요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '마음에 드는 교정문 공유합니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '정말 유용한 정보를 공유해주셨습니다. 항상 유익한 글 올려주셔서 감사합니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 스피킹 시험 후기입니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '축하드려요! 저도 GPTeacher로 공부 중인데 도움이 많이 됩니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 스피킹 시험 후기입니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '와우! 멋있어요. 그래도 기본기가 좀 더 중요한 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 스피킹 시험 후기입니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 오늘 토익 시험을 봤는데 GPTeacher 공부한 결과 집에 오자마자 후기를 검색하다가 여기서 볼 수 있어서 뿌듯해요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 스피킹 시험 후기입니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '좋은 소식 정말 축하합니다! 한국어로 된 자료도 있으면 공유해줘요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '토익 스피킹 시험 후기입니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '정말 부러워요! 저도 언제나 GPTeacher를 믿고 공부하는 중입니다. 조만간 저도 잘 볼 수 있기를 바래봅니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '교정 의문점 있어서 질문 드립니다.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '교정을 받으셨다면 교정을 한 전문가의 판단이 맞다고 믿으셔야 합니다. Plus, 혹시 의문점이 있다면 교정을 해주신 분께 다시 물어보시는건 어떨까요?',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '와 이런 표현들을 잘 사용해보려고 노력하겠습니다!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '감사합니다! 이런 표현들은 영어 실력 향상에 큰 도움이 될 것 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '이제부터 업무 메일 작성할 때 지피티처에서 알려준 표현들을 적극 활용해야겠어요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '알찬 정보 감사합니다. 이틀 전부터 메일 작성할 내용을 정하고 있었는데, 이 기회에 지피티처에서 알려준 내용도 곁들여 작성해봐야겠어요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '와 지피티처에서 알려준 표현들 정말 멋져요! 한 작성자가 자신감을 가지고 작성할 수 있는 표현들 같아요.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 이런 표현들 좀 적극적으로 사용해보고 싶어요. 한 번씩 검색해서 공부해보려구요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '지피티처가 알려준 고급 표현') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '표현이 매우 예쁘고 문장 구성도 잘 된 것 같습니다. 참고해서 영어 실력을 더 향상시키도록 하겠습니다.',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '친구한테 GPTeacher 추천해줬더니 좋아하네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '친구한테 GPTeacher 추천해줬다는데 GPTeacher 최근에 업데이트한 거 같던데 맞나요? 그럼 더욱 추천하고 싶네요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (COMMUNITY_REPLY_ID_SEQ.nextval,
            (select p.id from (select id from COMMUNITY_POST where COMMUNITY_POST_TITLE like '친구한테 GPTeacher 추천해줬더니 좋아하네요.') p where rownum = 1), --제목으로 게시글 특정
            (select p.community_post_writedate from (select community_post_writedate from COMMUNITY_POST where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때') p where rownum = 1),
            (SELECT * FROM (SELECT id FROM users WHERE id BETWEEN 2 AND 14 AND id != (select user_id from community_post where COMMUNITY_POST_TITLE like '공부하다가 너무 너무 힘들 때')  ORDER BY dbms_random.random) U WHERE rownum = 1), -- 작성자 랜덤
            '저도 GPTeacher로 영어회화 공부 중인데 정말 도움이 많이 되고 있어요. 추천해준 것도 고마우시겠지만 친구도 영어 실력이 향상되면서 더욱 기뻐하실 거예요!',
            COMMUNITY_REPLY_ID_SEQ.nextval
           );


end;

-- 회화 토픽
BEGIN
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"American diner","situation":"complaining about food","gpt_role":"server","option":"asking for a refund"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"French bistro","situation":"making a reservation","gpt_role":"maître","option":"requesting a table by the window"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"Chinese restaurant","situation":"ordering dim sum","gpt_role":"dim sum cart server","option":"trying a new dish"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"Airport Terminal","situation":"Checking in for a flight","gpt_role":"Airline Staff","option":"Flight delay"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"Italian restaurant","situation":"ordering food","gpt_role":"waiter","option":"asking for recommendations"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"Japanese restaurant","situation":"ordering sushi","gpt_role":"sushi chef","option":"customizing the order"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"Airport Security Checkpoint","situation":"Going through security screening","gpt_role":"Security Officer","option":"Carrying prohibited items"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"Airport Gate","situation":"Boarding a flight","gpt_role":"Gate Agent","option":"Overbooked flight"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"Airport Baggage Claim","situation":"Waiting for luggage","gpt_role":"Baggage Handler","option":"Lost luggage"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Airport Restaurant","situation":"Ordering food and drinks","gpt_role":"Waiter","option":"Food allergy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sales Manager","place":"Tokyo, Japan","situation":"Negotiating a new contract","gpt_role":"Japanese Client","option":"The client is hesitant due to recent economic changes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Marketing Director","place":"New York City, USA","situation":"Presenting a new product line","gpt_role":"Potential Investor","option":"The investor is skeptical about the market potential"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Human Resources Manager","place":"Paris, France","situation":"Discussing performance evaluation","gpt_role":"French Employee","option":"The employee is unhappy with their evaluation and demands a raise"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Operations Manager","place":"Beijing, China","situation":"Negotiating a new shipment contract","gpt_role":"Chinese Supplier","option":"The supplier is demanding a higher price due to increased production costs"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"CEO","place":"Sydney, Australia","situation":"Finalizing a merger agreement","gpt_role":"Australian Partner","option":"The partner is requesting changes to the proposed terms"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"CEO","place":"Conference room","situation":"Negotiating a merger","gpt_role":"Lawyer","option":"Discussing the terms of the acquisition"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sales manager","place":"Virtual meeting","situation":"Closing a deal","gpt_role":"Client","option":"Clarifying the payment and delivery terms"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"HR manager","place":"Office","situation":"Signing a job offer","gpt_role":"New employee","option":"Explaining the benefits and compensation package"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Production supervisor","place":"Factory floor","situation":"Renewing a supply contract","gpt_role":"Supplier","option":"Discussing the quality control and delivery schedule"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Event planner","place":"Hotel lobby","situation":"Hiring a catering service","gpt_role":"Vendor","option":"Tasting the menu and selecting the dishes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"CEO","place":"Conference room","situation":"Pitching a new product","gpt_role":"Investor","option":"Product is a sustainable energy solution"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sales representative","place":"Coffee shop","situation":"Discussing a new partnership","gpt_role":"Potential client","option":"Client is interested in expanding to international markets"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Job applicant","place":"Office lobby","situation":"Interview for a marketing position","gpt_role":"HR representative","option":"Applicant has no prior marketing experience"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Project manager","place":"Virtual meeting","situation":"Reviewing progress on a software development project","gpt_role":"Team member","option":"Project is behind schedule"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Business consultant","place":"Hotel conference room","situation":"Presenting a market analysis report","gpt_role":"Client","option":"Client is considering entering a new industry"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"son","place":"living room","situation":"discussing future plans","gpt_role":"father","option":"college vs. job"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"daughter","place":"kitchen","situation":"cooking dinner together","gpt_role":"mother","option":"trying out new recipe"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"sibling","place":"bedroom","situation":"helping each other get ready for a party","gpt_role":"sibling","option":"sharing outfit ideas"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"grandchild","place":"backyard","situation":"playing a game of catch","gpt_role":"grandparent","option":"teaching each other new games"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"spouse","place":"dining room","situation":"talking about the day''s events","gpt_role":"partner","option":"enjoying a glass of wine"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"chef","place":"home kitchen","situation":"preparing a three-course meal for a dinner party","gpt_role":"sous chef","option":"guests have dietary restrictions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"line cook","place":"restaurant kitchen","situation":"preparing a special dish for a food critic","gpt_role":"head chef","option":"the restaurant is short on ingredients"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"camper","place":"outdoor campsite","situation":"cooking dinner over an open fire","gpt_role":"campfire cook","option":"it''s raining heavily"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"student","place":"culinary school","situation":"learning how to make a classic French dish","gpt_role":"instructor","option":"the student has never cooked French cuisine before"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"pastry chef","place":"bakery","situation":"preparing a variety of pastries for a busy morning rush","gpt_role":"assistant","option":"one of the ovens is malfunctioning"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"department store","situation":"looking for a pair of running shoes","gpt_role":"salesperson","option":"on a tight budget"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"fashionista","place":"boutique","situation":"searching for the perfect pair of heels","gpt_role":"stylist","option":"attending a formal event"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"bargain hunter","place":"outlet mall","situation":"trying to find a comfortable pair of sandals for summer","gpt_role":"sales associate","option":"with limited sizes available"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopaholic","place":"online store","situation":"looking for trendy sneakers","gpt_role":"chatbot","option":"with a discount code"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"eco-conscious consumer","place":"secondhand shop","situation":"searching for a unique pair of boots","gpt_role":"store owner","option":"in good condition"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Supermarket","situation":"Checking out at the cash register","gpt_role":"Cashier","option":"I forgot my wallet"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Clothing store","situation":"Trying on clothes in the fitting room","gpt_role":"Salesperson","option":"The clothes don''t fit"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Electronic store","situation":"Asking for advice about buying a laptop","gpt_role":"Salesperson","option":"I need a laptop for gaming"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"Toy store","situation":"Looking for a birthday present","gpt_role":"Child","option":"The child wants a specific toy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Grocery store","situation":"Asking for help finding a specific item","gpt_role":"Employee","option":"The item is out of stock"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"tourist","place":"beach","situation":"meeting for the first time","gpt_role":"local","option":"both watching the sunset"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"barista","place":"cafe","situation":"flirting while ordering coffee","gpt_role":"regular customer","option":"both laughing at a joke"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"jogger","place":"park","situation":"colliding while running","gpt_role":"dog walker","option":"both helping each other up"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"student","place":"library","situation":"asking for book recommendations","gpt_role":"librarian","option":"both discussing favorite authors"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"bridesmaid","place":"wedding","situation":"dancing together at the reception","gpt_role":"groomsmen","option":"both sharing childhood stories about the couple"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"me","place":"at home","situation":"I''m feeling self-conscious about my weight gain","gpt_role":"friend","option":"My friend suggests we start a workout routine together"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"at a restaurant","situation":"I''m hesitant to order a dessert because I''m worried about gaining weight","gpt_role":"waiter","option":"The waiter recommends a lighter dessert option"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"at the gym","situation":"I''m frustrated with my lack of progress in losing weight","gpt_role":"personal trainer","option":"The personal trainer suggests adjusting my workout routine and diet"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"nephew","place":"at a family gathering","situation":"My aunt/uncle comments on my weight gain","gpt_role":"aunt/uncle","option":"I try to change the subject or politely explain that their comment is hurtful"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"at a clothing store","situation":"I''m struggling to find clothes that fit because of my weight gain","gpt_role":"sales associate","option":"The sales associate recommends styles that are more forgiving or suggests alterations"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"driver","place":"airport","situation":"picking up someone","gpt_role":"passenger","option":"flight delayed"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"tour guide","place":"museum","situation":"showing around","gpt_role":"visitor","option":"special exhibit"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"host","place":"restaurant","situation":"seating","gpt_role":"guest","option":"crowded"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"ticket seller","place":"movie theater","situation":"selling tickets","gpt_role":"moviegoer","option":"sold out"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"lifeguard","place":"beach","situation":"ensuring safety","gpt_role":"swimmer","option":"rough waves"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"interviewee","place":"a corporate office","situation":"a job interview for a marketing position","gpt_role":"interviewer","option":"the interviewer asks for a marketing plan"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"interviewee","place":"a coffee shop","situation":"a job interview for a barista position","gpt_role":"interviewer","option":"the interviewer asks for a demonstration of latte art"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"interviewee","place":"a law firm","situation":"a job interview for a paralegal position","gpt_role":"interviewer","option":"the interviewer asks for legal research experience"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"interviewee","place":"a tech company","situation":"a job interview for a software engineer position","gpt_role":"interviewer","option":"the interviewer asks for experience with a specific programming language"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"interviewee","place":"a hospital","situation":"a job interview for a nurse position","gpt_role":"interviewer","option":"the interviewer asks for experience with a specific medical condition"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"In a carpool van","situation":"Driving to work during rush hour","gpt_role":"Passenger","option":"Traffic is especially bad today"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a carpool car","situation":"Going to a concert with friends","gpt_role":"Driver","option":"Everyone is excited and singing along to the radio"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a carpool bus","situation":"Going on a field trip with classmates","gpt_role":"Driver","option":"The bus breaks down on the side of the road"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"In a carpool SUV","situation":"Driving to a family gathering","gpt_role":"Passenger","option":"The weather is bad and the roads are slick"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a carpool truck","situation":"Heading to a football game with buddies","gpt_role":"Driver","option":"There is heavy traffic and the game starts in 30 minutes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"commuter","place":"subway train","situation":"You forgot to buy a ticket and the inspector approaches you.","gpt_role":"ticket inspector","option":"The train is crowded and you are in a hurry to get to an important meeting."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"tourist","place":"subway station","situation":"You''re lost and need help finding your way to the correct train.","gpt_role":"local","option":"The station is under construction and some areas are closed off."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"student","place":"subway platform","situation":"You''re waiting for the train to arrive and strike up a conversation with another student.","gpt_role":"fellow student","option":"You''re both studying the same subject and can discuss your coursework."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"businessperson","place":"subway car","situation":"You''re on your way to an important meeting and the train stops unexpectedly.","gpt_role":"fellow passenger","option":"The delay is causing you to be late and you''re feeling stressed."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"musician","place":"subway platform","situation":"You see someone playing music on the platform and strike up a conversation.","gpt_role":"fellow musician","option":"You both play the same instrument and can talk about your shared passion."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"On a crowded bus","situation":"The bus is stuck in traffic","gpt_role":"Bus driver","option":"Passengers are getting impatient"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"On a school bus","situation":"The bus is running late","gpt_role":"Bus driver","option":"The driver is trying to find a shortcut"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"On a long-distance bus","situation":"The bus is making a rest stop","gpt_role":"Bus driver","option":"Passengers are getting food and drinks"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"On a tour bus","situation":"The bus is approaching a scenic spot","gpt_role":"Tour guide/bus driver","option":"The guide is giving information about the location"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"On a public bus","situation":"A passenger has left their bag on the bus","gpt_role":"Bus driver","option":"The driver is trying to locate the owner"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a taxi on the way to the airport","situation":"You forgot your passport at home and your flight is in 2 hours.","gpt_role":"Taxi driver","option":"Heavy traffic on the way to the airport"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a taxi on a rainy day","situation":"You need to get to an important meeting but the traffic is terrible due to the rain.","gpt_role":"Taxi driver","option":"The taxi driver is a talkative person"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"In a taxi in a foreign country","situation":"You want to visit a famous tourist spot but you don''t speak the local language.","gpt_role":"Taxi driver","option":"The taxi driver is a local and can give you recommendations for other places to visit."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a taxi on a busy street","situation":"You are running late for an important appointment and need to get there as soon as possible.","gpt_role":"Taxi driver","option":"The taxi driver is a reckless driver"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"In a taxi at night","situation":"You are heading home after a night out with friends and the taxi driver takes a wrong turn.","gpt_role":"Taxi driver","option":"The taxi driver is new to the area and relies on a GPS to navigate."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"passenger","place":"airport","situation":"boarding a plane","gpt_role":"flight attendant","option":"delayed flight"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"tourist","place":"hotel lobby","situation":"checking in","gpt_role":"hotel receptionist","option":"room upgrade"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"backpacker","place":"train station","situation":"buying a ticket","gpt_role":"ticket agent","option":"missed train"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"foodie","place":"restaurant","situation":"ordering food","gpt_role":"waiter","option":"food allergy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"tourist","place":"sightseeing bus","situation":"exploring the city","gpt_role":"tour guide","option":"traffic jam"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Hotel A","situation":"Making a reservation for a single room","gpt_role":"Hotel Receptionist","option":null}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Travel Agent","place":"Hotel B","situation":"Negotiating group rates for a conference","gpt_role":"Hotel Sales Manager","option":"The conference will be held in 3 months"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"Hotel C","situation":"Asking for recommendations on local attractions","gpt_role":"Hotel Concierge","option":"I have a week to explore the area"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Business Executive","place":"Hotel D","situation":"Booking a suite for a week-long business trip","gpt_role":"Hotel Executive Suite Manager","option":"I need a conference room for meetings"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Budget Traveler","place":"Hotel E","situation":"Finding the cheapest available room for one night","gpt_role":"Hotel Front Desk Clerk","option":"I am traveling alone and have no specific preferences"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guest","place":"Hilton Hotel","situation":"Checking in for a business trip","gpt_role":"Receptionist","option":"Arriving late at night"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guest","place":"Marriott Hotel","situation":"Checking in for a honeymoon","gpt_role":"Concierge","option":"Asking for romantic room decoration"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guest","place":"Holiday Inn","situation":"Checking in for a family vacation","gpt_role":"Front Desk Agent","option":"Asking for adjoining rooms"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Celebrity","place":"Ritz Carlton","situation":"Checking in for a private event","gpt_role":"Hotel Manager","option":"Requesting complete privacy and security"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guest","place":"Four Seasons","situation":"Checking in for a romantic getaway","gpt_role":"Bellhop","option":"Asking for a room with a view and champagne on arrival"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Post office","situation":"Sending a package to a friend in another country","gpt_role":"Post office clerk","option":"Package contains fragile items"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Small business owner","place":"UPS store","situation":"Sending a package to a customer","gpt_role":"UPS employee","option":"Package needs to be delivered within 2 days"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"FedEx office","situation":"Sending care package to child in college","gpt_role":"FedEx employee","option":"Package contains homemade cookies"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Traveler","place":"DHL service point","situation":"Sending souvenirs to family back home","gpt_role":"DHL employee","option":"Package needs to be insured"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Online shopper","place":"Amazon locker","situation":"Returning an item for refund","gpt_role":"Amazon locker attendant","option":"Package needs to be scanned for confirmation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Doctor''s office","situation":"Discussing allergy symptoms","gpt_role":"Doctor","option":"Trying to determine the cause of the allergy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Restaurant","situation":"Ordering food with allergies","gpt_role":"Waiter","option":"Asking for ingredient information"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Classroom","situation":"Dealing with allergies during class","gpt_role":"Teacher","option":"Explaining the allergy to classmates"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Traveler","place":"Airport","situation":"Going through security with allergy medication","gpt_role":"Security Officer","option":"Explaining the medication to the officer"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"Home","situation":"Teaching a child about their allergies","gpt_role":"Child","option":"Identifying allergens in the home"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Frustrated employee","place":"At home","situation":"Missed a call from an important client","gpt_role":"Understanding boss","option":"Client left a voicemail"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nervous date","place":"In a coffee shop","situation":"Missed a call from the date''s ex","gpt_role":"Romantic interest","option":"Ex left a message"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Worried parent","place":"In a car","situation":"Missed a call from the school","gpt_role":"Teenage child","option":"School left a voicemail"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Busy professional","place":"At work","situation":"Missed a call from an unknown number","gpt_role":"Curious colleague","option":"No voicemail was left"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Excited fan","place":"At a concert","situation":"Missed a call from the friend who couldn''t make it","gpt_role":"Disappointed friend","option":"Friend left a message"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"fan","place":"at a concert","situation":"enjoying the live performance","gpt_role":"musician","option":"trying to get the musician''s attention"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"driver","place":"in a car","situation":"listening to the radio","gpt_role":"passenger","option":"singing along to the song"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"guest","place":"at a party","situation":"dancing to the music","gpt_role":"DJ","option":"requesting a specific song"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"in a coffee shop","situation":"listening to the background music","gpt_role":"barista","option":"asking about the artist or song"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"listener","place":"at home","situation":"playing music from a playlist","gpt_role":"virtual assistant","option":"adding a song to the playlist"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"student","place":"college campus","situation":"discussing major options","gpt_role":"academic advisor","option":"student is undecided"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"friend","place":"coffee shop","situation":"talking about career goals and how major relates","gpt_role":"career counselor","option":"friend is considering changing majors"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"job seeker","place":"job fair","situation":"discussing job opportunities related to major","gpt_role":"employer","option":"job seeker has multiple majors to choose from"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"college student","place":"family dinner","situation":"explaining major choice to family","gpt_role":"parent","option":"parent is skeptical of major''s job prospects"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"participant","place":"online forum","situation":"debating the importance of major in career success","gpt_role":"moderator","option":"participant argues that experience is more important than major"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"New York City","situation":"Looking for a new home","gpt_role":"Real Estate Agent","option":"Budget is limited"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Renter","place":"London","situation":"Moving out of old apartment","gpt_role":"Landlord","option":"Need to find a new place quickly"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Mover","place":"Los Angeles","situation":"Packing up belongings","gpt_role":"Moving Company Employee","option":"Fragile items need special care"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"International Student","place":"Paris","situation":"Moving in with host family","gpt_role":"Host Family","option":"Language barrier"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Sydney","situation":"Selling current home","gpt_role":"Real Estate Agent","option":"Need to find a new home before selling"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lost Customer","place":"Shopping Mall","situation":"I lost my wallet and can''t find it anywhere","gpt_role":"Helpful Staff","option":"The mall is about to close in 30 minutes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lost Traveler","place":"Airport","situation":"I lost my passport and need to catch my flight","gpt_role":"Information Desk Staff","option":"The flight is leaving in 1 hour"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lost Child","place":"Park","situation":"I can''t find my mom and I''m scared","gpt_role":"Concerned Parent","option":"It''s getting dark and the park is closing soon"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lost Student","place":"Library","situation":"I lost my textbook and need it for an exam tomorrow","gpt_role":"Librarian","option":"The library is closing in 15 minutes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lost Attendee","place":"Concert Venue","situation":"I lost my ticket and can''t get into the concert","gpt_role":"Security Guard","option":"The concert is starting in 10 minutes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"Tourist attraction","situation":"Asking for a photo","gpt_role":"Photographer","option":"It''s crowded and you have to wait for your turn."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Bride","place":"Wedding","situation":"Posing for bridal portraits","gpt_role":"Wedding photographer","option":"The weather suddenly turns bad and you have to find a new location."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Model","place":"Fashion shoot","situation":"Posing for a magazine cover","gpt_role":"Fashion photographer","option":"The lighting keeps changing and you have to adjust your poses accordingly."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Wildlife photographer","place":"Nature reserve","situation":"Spotting rare animals","gpt_role":"Guide","option":"The animals are far away and you have to use a telephoto lens."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Concert-goer","place":"Music festival","situation":"Capturing the energy of the crowd","gpt_role":"Event photographer","option":"You have to navigate through the crowd to get the best shots."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"grocery store","situation":"checking out at the register","gpt_role":"cashier","option":"I forgot my wallet"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"employee","place":"grocery store","situation":"restocking shelves","gpt_role":"manager","option":"we''re running low on a popular item"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"grocery store","situation":"looking for a specific item","gpt_role":"employee","option":"it''s not in stock"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"cashier","place":"grocery store","situation":"bagging groceries","gpt_role":"shopper","option":"the customer has a lot of items"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"employee","place":"grocery store","situation":"assisting with self-checkout","gpt_role":"customer","option":"the machine isn''t working properly"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Local pharmacy","situation":"Asking for advice on over-the-counter medication for a cold","gpt_role":"Pharmacist","option":"The customer has a history of allergies to certain ingredients"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Doctor","place":"Hospital pharmacy","situation":"Ordering medication for a patient with a rare condition","gpt_role":"Pharmacist","option":"The medication is not commonly stocked and needs to be specially ordered"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Online pharmacy","situation":"Ordering prescription medication","gpt_role":"AI chatbot","option":"The customer needs to provide their prescription information and medical history"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pet owner","place":"Veterinary pharmacy","situation":"Requesting medication for a pet''s chronic condition","gpt_role":"Veterinary pharmacist","option":"The medication is not available in the preferred dosage and needs to be compounded"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pharmacy technician","place":"Community pharmacy","situation":"Assisting with filling prescriptions","gpt_role":"Pharmacist","option":"The pharmacy is short-staffed and there is a high volume of customers"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Drug store","situation":"Asking for over-the-counter medication for a headache","gpt_role":"Pharmacist","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pharmacist","place":"Drug store","situation":"Returning a medication due to side effects","gpt_role":"Customer","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Drug store","situation":"Asking for advice on vitamins and supplements","gpt_role":"Pharmacist","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pharmacist","place":"Drug store","situation":"Inquiring about a prescription refill","gpt_role":"Customer","option":"The prescription is out of refills"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Drug store","situation":"Asking for recommendations on skincare products","gpt_role":"Pharmacist","option":"The customer has sensitive skin"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Manager","place":"Office","situation":"Canceling a meeting due to urgent client request","gpt_role":"Employee","option":"The client has requested a meeting at the same time"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend","place":"Coffee shop","situation":"Canceling a meeting due to unexpected personal emergency","gpt_role":"Friend","option":"The emergency involves a family member"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Presenter","place":"Conference room","situation":"Canceling a meeting due to technical difficulties","gpt_role":"Audience member","option":"The presentation materials cannot be accessed"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Date","place":"Restaurant","situation":"Canceling a meeting due to illness","gpt_role":"Date","option":"The illness is contagious"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Teacher","place":"Online","situation":"Canceling a meeting due to power outage","gpt_role":"Student","option":"The outage is expected to last for several hours"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Hospital waiting room","situation":"Waiting for surgery and feeling nervous","gpt_role":"Nurse","option":"The patient''s family is also present"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Surgeon","place":"Operating room","situation":"Discussing the surgery plan with the anesthesiologist","gpt_role":"Anesthesiologist","option":"The patient has a pre-existing medical condition"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Recovery room","situation":"Waking up after surgery and feeling disoriented","gpt_role":"Nurse","option":"The patient is experiencing pain"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Doctor","place":"Consultation room","situation":"Explaining the surgical procedure to the patient","gpt_role":"Patient","option":"The patient is afraid of needles"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nurse","place":"Pre-operation room","situation":"Preparing the patient for surgery","gpt_role":"Patient","option":"The patient has never had surgery before"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Hospital","situation":"I have been experiencing chest pain for a few days.","gpt_role":"Doctor","option":"The pain gets worse when I exercise."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Clinic","situation":"I have a fever and sore throat.","gpt_role":"Nurse","option":"I have been coughing up yellow mucus."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Urgent Care","situation":"I accidentally cut myself while cooking.","gpt_role":"Physician Assistant","option":"The cut is deep and won''t stop bleeding."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Doctor''s Office","situation":"I have been feeling really tired lately.","gpt_role":"Doctor","option":"I am having trouble sleeping at night."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"Pediatrician''s Office","situation":"My child has been complaining about a stomachache.","gpt_role":"Pediatrician","option":"They have also been vomiting and have diarrhea."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Birthday girl/boy","place":"At a fancy restaurant","situation":"Ordering a birthday cake","gpt_role":"Waiter/waitress","option":"Deciding between chocolate and vanilla"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Party host","place":"At home","situation":"Opening presents","gpt_role":"Guest","option":"Getting a surprise gift"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"At a park","situation":"Having a picnic","gpt_role":"Child","option":"Playing with balloons"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Club-goer","place":"At a club","situation":"Dancing to birthday songs","gpt_role":"DJ","option":"Requesting a favorite song"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Surfer","place":"At a beach","situation":"Celebrating after a surf session","gpt_role":"Lifeguard","option":"Eating a beach-themed cake"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Library","situation":"Asking for help with finding study materials","gpt_role":"Librarian","option":"Library is crowded and noisy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Teacher","place":"Classroom","situation":"Giving a review session before the exam","gpt_role":"Student","option":"Students are feeling stressed and anxious"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Coffee shop","situation":"Discussing study strategies and sharing notes","gpt_role":"Friend","option":"Friend is a straight-A student"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Online","situation":"Taking an online practice test and getting feedback","gpt_role":"Tutor","option":"Tutor is a native English speaker"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Professor","place":"Office hours","situation":"Answering questions and clarifying confusing concepts","gpt_role":"Student","option":"Student is struggling with the material"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"patient","place":"doctor''s office","situation":"making an appointment for a general check-up","gpt_role":"receptionist","option":null}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"patient","place":"specialist''s clinic","situation":"booking an appointment with a cardiologist","gpt_role":"nurse","option":null}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"patient","place":"telemedicine platform","situation":"scheduling a video consultation with a dermatologist","gpt_role":"virtual assistant","option":"checking if insurance covers the cost"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"patient","place":"hospital","situation":"setting up an appointment for a surgical procedure","gpt_role":"operator","option":"providing medical history and current medications"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"patient","place":"community health center","situation":"arranging a check-up for a child''s immunization","gpt_role":"volunteer","option":"asking if there are any available slots for the weekend"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"striker","place":"football field","situation":"penalty shootout","gpt_role":"goalkeeper","option":"crowd cheering loudly"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"personal trainer","place":"gym","situation":"weightlifting session","gpt_role":"client","option":"client struggling with form"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"coach","place":"tennis court","situation":"preparing for tournament","gpt_role":"player","option":"player dealing with nerves"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"point guard","place":"basketball court","situation":"final minutes of a tied game","gpt_role":"opposing team''s point guard","option":"trash talk between players"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"swimmer","place":"swimming pool","situation":"racing for gold medal","gpt_role":"opponent","option":"swimming in rough waters"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"patient","place":"doctor''s office","situation":"I have a cold and need to see a doctor","gpt_role":"doctor","option":"The doctor is running late and I have to wait for an hour"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"employee","place":"workplace","situation":"I have a cold but need to go to work","gpt_role":"boss","option":"I have an important meeting with a client"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"grocery store","situation":"I have a cold and need to buy some medicine","gpt_role":"cashier","option":"The store is out of stock of the medicine I need"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"parent","place":"home","situation":"My child has a cold and needs to stay home from school","gpt_role":"child","option":"The child is bored and wants to play video games all day"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"restaurant","situation":"I have a cold but still want to go out to eat","gpt_role":"waiter","option":"The restaurant is very busy and the waiter is short-staffed"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"wealthy businessman","place":"fancy restaurant","situation":"discussing potential business partnership","gpt_role":"up-and-coming entrepreneur","option":"the restaurant is known for its seafood"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"amateur chef","place":"my apartment","situation":"hosting a dinner party to showcase my culinary skills","gpt_role":"food critic","option":"one of the guests has a severe food allergy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"young adult","place":"family home","situation":"meeting the parents for the first time","gpt_role":"significant other''s parents","option":"the family has a tradition of saying grace before meals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"romantic partner","place":"outdoor picnic area","situation":"surprising them with a romantic dinner under the stars","gpt_role":"significant other","option":"there is a sudden rainstorm"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"old friends","place":"casual diner","situation":"reminiscing about old times","gpt_role":"catching up after years apart","option":"the diner is known for its milkshakes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Host","place":"Backyard","situation":"Preparing the grill","gpt_role":"Guest","option":"Discussing the best marinade for the meat"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Picnicker","place":"Park","situation":"Setting up the grill","gpt_role":"Friend","option":"Deciding on the perfect spot for the grill"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Beach-goer","place":"Beach","situation":"Grilling seafood","gpt_role":"Fellow beach-goer","option":"Sharing recipes for the perfect seafood marinade"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Apartment owner","place":"Rooftop","situation":"Hosting a building-wide barbeque","gpt_role":"Tenant","option":"Discussing the best way to invite everyone in the building"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Camper","place":"Campsite","situation":"Cooking over an open fire","gpt_role":"Fellow camper","option":"Exchanging tips for cooking over a campfire"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"new employee","place":"conference room","situation":"introduction meeting","gpt_role":"supervisor","option":"going over company policies and procedures"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"job applicant","place":"office lobby","situation":"job interview","gpt_role":"hiring manager","option":"discussing job responsibilities"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"co-worker","place":"break room","situation":"casual conversation","gpt_role":"team leader","option":"talking about weekend plans"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"project manager","place":"boardroom","situation":"project update meeting","gpt_role":"client","option":"reviewing project timeline"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"employee","place":"office hallway","situation":"quick chat","gpt_role":"boss","option":"asking for feedback on recent project"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"personal trainer","place":"gym","situation":"teaching how to use weight machines","gpt_role":"client","option":"client is a beginner"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"yoga instructor","place":"gym","situation":"leading a yoga class","gpt_role":"student","option":"student has a back injury"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"bodybuilder","place":"gym","situation":"lifting heavy weights","gpt_role":"spotter","option":"attempting a personal best"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"cardio enthusiast","place":"gym","situation":"running on the treadmill","gpt_role":"workout buddy","option":"trying to beat a personal record"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"fitness class instructor","place":"gym","situation":"leading a dance fitness class","gpt_role":"participant","option":"participant is new to dance fitness"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Dog Owner","place":"Park","situation":"My dog ran up to you and started playing with you.","gpt_role":"Stranger","option":"You seem scared of dogs."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Pet Store","situation":"I''m looking for a new toy for my cat.","gpt_role":"Store Clerk","option":"You recommend a specific toy and explain why it''s good for cats."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pet Owner","place":"Vet Clinic","situation":"My dog is sick and I need to know what''s wrong.","gpt_role":"Veterinarian","option":"You give me a diagnosis and explain the treatment plan."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Dog Owner","place":"Beach","situation":"My dog is playing fetch with a ball.","gpt_role":"Fellow Beachgoer","option":"You suggest we play a game of beach volleyball together."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Cat Owner","place":"Home","situation":"My cat is sleeping on my lap.","gpt_role":"Friend","option":"You suggest we watch a movie together and we have to be quiet so we don''t wake up the cat."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"Highway","situation":"You are driving on the highway and suddenly the car starts shaking.","gpt_role":"Passenger","option":"It''s raining heavily outside."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driving Instructor","place":"City","situation":"The learner driver is having trouble with parallel parking.","gpt_role":"Learner Driver","option":"There is a car parked very close to the spot."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"Mountain Road","situation":"You are driving on a narrow mountain road and there is a sharp turn ahead.","gpt_role":"Local Guide","option":"The road is covered with snow."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Delivery Driver","place":"Rural Area","situation":"You are delivering a package to a farm and the dirt road is bumpy.","gpt_role":"Farmer","option":"There are cows blocking the road."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car Owner","place":"Parking Lot","situation":"You hear a strange noise coming from your car''s engine.","gpt_role":"Car Mechanic","option":"The parking lot is full and you have to park far away."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"Intersection","situation":"I just got into a car accident with another vehicle.","gpt_role":"Police Officer","option":"The other driver is claiming it was my fault."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Passenger","place":"Highway","situation":"The car I''m in just got into a major accident with multiple vehicles.","gpt_role":"911 Dispatcher","option":"There are injured people in the car and we need an ambulance."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pedestrian","place":"Parking Lot","situation":"I just witnessed a car hit a parked vehicle.","gpt_role":"Witness","option":"The driver of the car is attempting to flee the scene."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"Rural Road","situation":"My car just went off the road and hit a tree.","gpt_role":"Tow Truck Driver","option":"My car is stuck and I need a tow truck to get it out."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Bicyclist","place":"City Street","situation":"I was hit by a car while riding my bike.","gpt_role":"Ambulance Driver","option":"I am injured and need to be taken to the hospital."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"student","place":"coffee shop","situation":"debating about the benefits of technology in education","gpt_role":"teacher","option":"teacher brings up the potential negative effects of technology on learning"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"environmentalist","place":"park","situation":"debating about the impact of climate change on the planet","gpt_role":"skeptic","option":"skeptic argues that climate change is a natural occurrence and not caused by human activity"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"employee","place":"office","situation":"debating about the effectiveness of a new company policy","gpt_role":"boss","option":"boss defends the policy as necessary for the success of the company"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"student","place":"classroom","situation":"debating about the interpretation of a literary work","gpt_role":"professor","option":"professor challenges the student''s interpretation and offers a different perspective"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"sports fan","place":"bar","situation":"debating about the outcome of a recent game","gpt_role":"opposing fan","option":"opposing fan argues that their team won due to luck rather than skill"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"In a busy city street","situation":"Lost and trying to find a specific restaurant","gpt_role":"Local","option":"It''s raining heavily"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Traveler","place":"At a train station","situation":"Trying to find the platform for a specific train","gpt_role":"Station staff","option":"The train is about to depart"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Hiker","place":"In a rural area","situation":"Trying to find the way to a nearby waterfall","gpt_role":"Local farmer","option":"There''s a language barrier"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Shopper","place":"In a shopping mall","situation":"Trying to find a specific store","gpt_role":"Store employee","option":"The mall is very crowded"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"In a university campus","situation":"Trying to find a specific building for a class","gpt_role":"Campus security","option":"It''s after hours and the campus is mostly empty"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Bank lobby","situation":"I need to deposit a check.","gpt_role":"Bank teller","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Small business owner","place":"Bank manager''s office","situation":"I need a loan to expand my business.","gpt_role":"Bank manager","option":"My credit score is low."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"ATM","situation":"I need to withdraw cash.","gpt_role":"ATM machine","option":"The ATM is out of service."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Bank call center","situation":"I need to report a lost credit card.","gpt_role":"Bank representative","option":"I don''t remember my credit card number."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Security guard","place":"Bank security room","situation":"There is a suspicious person in the bank.","gpt_role":"Bank manager","option":"The person is carrying a bag."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Actor","place":"Movie theater","situation":"You just saw my new movie and want to interview me about my performance","gpt_role":"Movie critic","option":"The movie is a horror film"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Artist","place":"Art studio","situation":"You''re working on a painting and I want to give you feedback","gpt_role":"Art critique","option":"The painting is abstract"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Baker","place":"Kitchen","situation":"You''ve just baked lemon cupcakes and I''m here to taste them","gpt_role":"Food critic","option":"The cupcakes have a raspberry filling"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Dancer","place":"Dance studio","situation":"I want to learn a new dance and you''re teaching me","gpt_role":"Dance instructor","option":"The dance is salsa"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Gardener","place":"Garden","situation":"I need help designing my garden and you''re giving me suggestions","gpt_role":"Landscaper","option":"I want a garden with only native plants"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"Office","situation":"Checking an important email with a deadline","gpt_role":"Manager","option":"Feeling stressed"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Freelancer","place":"Home","situation":"Responding to a request for a quote","gpt_role":"Client","option":"In need of the job"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Entrepreneur","place":"Coffee shop","situation":"Pitching a business idea via email","gpt_role":"Investor","option":"Hoping for a positive response"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Traveller","place":"Airport","situation":"Checking flight confirmation details","gpt_role":"Employee","option":"Missing some information"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Consultant","place":"Meeting room","situation":"Confirming meeting details through email","gpt_role":"Client","option":"First time meeting"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"bank","situation":"paying credit card bill","gpt_role":"bank teller","option":"balance due is larger than expected"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"head of household","place":"home","situation":"budgeting monthly expenses","gpt_role":"spouse","option":"unexpected car repair expense"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"customer","place":"utility company office","situation":"setting up automatic bill pay","gpt_role":"employee","option":"choosing payment date"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"investor","place":"investment firm","situation":"reviewing portfolio performance","gpt_role":"financial advisor","option":"discussing diversification strategy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"grocery store","situation":"using debit card for payment","gpt_role":"cashier","option":"card gets declined"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"Department Store","situation":"Looking for a dress for a wedding","gpt_role":"salesperson","option":"The shopper has a specific color or style in mind"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"Mall","situation":"In desperate need of a wardrobe revamp","gpt_role":"personal stylist","option":"The shopper has a limited budget"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"Boutique","situation":"Interested in getting custom tailored clothes","gpt_role":"designer","option":"The shopper has a preferred fabric in mind"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"Thrift Store","situation":"Shopping for vintage clothing","gpt_role":"cashier","option":"The shopper is trying to stay within a specific era"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"shopper","place":"Online Store","situation":"Looking for a new pair of shoes","gpt_role":"chatbot","option":"The shopper is interested in seeing other customers'' reviews"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Clinic","situation":"Discussing symptoms of a cough","gpt_role":"Doctor","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Dental office","situation":"Getting a dental cleaning","gpt_role":"Dentist","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Hospital","situation":"Checking in for a surgery","gpt_role":"Nurse","option":"Filling out forms"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Urgent care facility","situation":"Receiving treatment for a broken arm","gpt_role":"Doctor","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Psychologist''s office","situation":"Discussing anxiety and stress","gpt_role":"Psychologist","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"House owner","place":"Bedroom","situation":"Discussing the cleaning schedule","gpt_role":"Professional cleaner","option":"Deciding on which days to clean and what tasks to do each day."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Messy tenant","place":"Kitchen","situation":"Inspecting the cleanliness of the kitchen","gpt_role":"Strict landlord","option":"Tallying the number of dirty dishes and unclean surfaces."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Newly moved-in tenant","place":"Living room","situation":"Asking for cleaning advice","gpt_role":"Friendly neighbor","option":"Receiving tips and tricks for maintaining a clean living space."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Busy parent","place":"Bathroom","situation":"Organizing the bathroom","gpt_role":"Organizing expert","option":"Sorting through piles of towels and toiletries to declutter and streamline the space."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Messy hobbyist","place":"Garage","situation":"Cleaning and reorganizing the garage","gpt_role":"Professional organizer","option":"Dividing items into keep, donate, and discard piles for efficient and effective organization."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Bride''s Best Friend","place":"Wedding","situation":"Discussing the wedding arrangements","gpt_role":"Wedding Planner","option":"The florist cancelled"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New Employee","place":"Company Party","situation":"Introducing yourself to your colleagues","gpt_role":"HR Manager","option":"Your boss is watching you"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Team Leader","place":"Office Christmas Party","situation":"Organizing the Secret Santa gift exchange","gpt_role":"HR Director","option":"One colleague didn''t participate"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guest of Honor","place":"Birthday Party","situation":"Opening your presents","gpt_role":"Party Planner","option":"One gift was clearly regifted"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Charity Gala","situation":"Raising money for a good cause","gpt_role":"Fundraiser","option":"A high-profile donor arrives unexpectedly"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Local animal shelter","situation":"You are tasked with walking and playing with the dogs","gpt_role":"Shelter coordinator","option":"One of the dogs is particularly shy and scared of people"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Community garden","situation":"You are responsible for planting and maintaining the vegetable beds","gpt_role":"Garden manager","option":"The garden is experiencing a drought and you must find a way to conserve water"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Local food bank","situation":"You are sorting and organizing donated food items","gpt_role":"Food bank manager","option":"There is a shortage of canned vegetables and you must find a way to acquire more"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Environmental conservation group","situation":"You are helping to clean up a local park","gpt_role":"Conservationist","option":"You come across a group of people littering and must confront them"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Habitat for Humanity construction site","situation":"You are helping to build a new home for a family in need","gpt_role":"Construction manager","option":"There is a delay in the delivery of building supplies and you must find a way to keep the project on track"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Community Center","situation":"Learning how to knit","gpt_role":"Teacher","option":"Teacher brings in different types of yarn to practice with"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Athlete","place":"Gym","situation":"Taking a boxing class","gpt_role":"Coach","option":"Coach shows new techniques on the punching bag"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Apprentice","place":"Art Studio","situation":"Learning how to paint with oils","gpt_role":"Master Artist","option":"Master Artist critiques and provides feedback on apprentice''s work"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Cooking School","situation":"Learning how to make sushi","gpt_role":"Chef Instructor","option":"Chef Instructor provides a variety of fresh fish to practice with"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"University Lecture Hall","situation":"Taking a computer science course","gpt_role":"Professor","option":"Professor assigns coding projects to complete outside of class"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Babysitter","place":"Park","situation":"Taking care of a 2 year old child","gpt_role":"Parent","option":"The child wants to play on the swings"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pet sitter","place":"Pet store","situation":"Taking care of a 6 month old puppy","gpt_role":"Pet owner","option":"The puppy wants to chew on everything in sight"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nanny","place":"Beach","situation":"Taking care of a 5 year old child","gpt_role":"Single parent","option":"The child wants to build a sandcastle"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pet sitter","place":"Zoo","situation":"Taking care of a group of 10 year old children on a field trip","gpt_role":"Zookeeper","option":"One of the children wants to feed the animals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pet sitter","place":"Backyard","situation":"Taking care of a 1 year old kitten","gpt_role":"Pet owner","option":"The kitten wants to climb up a tree"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Project Manager","place":"Office","situation":"Discussing project timeline","gpt_role":"Team Member","option":"Client deadline is approaching"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"University","situation":"Brainstorming ideas for research paper","gpt_role":"Professor","option":"Limited resources for the topic"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Freelance Writer","place":"Virtual Meeting","situation":"Editing a blog post","gpt_role":"Editor","option":"Tight deadline for submission"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Researcher","place":"Library","situation":"Collecting data for a project","gpt_role":"Research Assistant","option":"Limited access to online resources"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Marketing Manager","place":"Conference Room","situation":"Preparing a sales pitch","gpt_role":"Sales Team","option":"Competitor has launched a similar product"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Music room","situation":"Practicing piano for a recital","gpt_role":"Music teacher","option":"Struggling with a difficult section"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Singer","place":"Concert hall","situation":"Preparing for an audition","gpt_role":"Vocal coach","option":"Working on a challenging song"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guitarist","place":"Recording studio","situation":"Recording a new album","gpt_role":"Producer","option":"Trying to come up with a catchy riff"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Violinist","place":"Music school","situation":"Preparing for a concert","gpt_role":"Orchestra conductor","option":"Working on ensemble playing"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pianist","place":"Home","situation":"Playing for personal enjoyment","gpt_role":"Music lover","option":"Trying out a new piece"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Aspiring writer","place":"Coffee shop","situation":"Discussing writing techniques","gpt_role":"Experienced author","option":"Ordering coffee"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Journalist","place":"Library","situation":"Reviewing article drafts","gpt_role":"Editor","option":"Searching for sources"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Teenager","place":"Bedroom","situation":"Journaling about personal struggles","gpt_role":"Therapist","option":"Listening and providing guidance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Travel blogger","place":"Park","situation":"Capturing moments for blog posts","gpt_role":"Photographer","option":"Exploring the scenery"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Classroom","situation":"Learning how to write essays","gpt_role":"English teacher","option":"Analyzing sample essays"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Gardener","place":"Backyard","situation":"Asking for gardening advice","gpt_role":"Neighbor","option":"Neighbor wants to learn how to grow vegetables"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Community garden","situation":"Showing around the garden","gpt_role":"Newcomer","option":"Newcomer is interested in joining the garden"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Front yard","situation":"Discussing landscaping options","gpt_role":"Landscaper","option":"Homeowner wants to incorporate a water feature"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Park ranger","place":"Local park","situation":"Giving a tour of the park''s gardens","gpt_role":"Visitor","option":"Visitor is interested in the park''s history"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tour guide","place":"Botanical garden","situation":"Explaining the different types of gardens","gpt_role":"Tourist","option":"Tourist is interested in the garden''s rare plants"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Travel Agency","situation":"Planning a trip to Europe","gpt_role":"Travel Agent","option":"Discussing budget and itinerary"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Online Booking Website","situation":"Booking a flight to New York","gpt_role":"Website Bot","option":"Choosing between economy and business class"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Hotel Reception","situation":"Checking in at a hotel","gpt_role":"Hotel Receptionist","option":"Asking for room upgrade"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Airport","situation":"Boarding a plane","gpt_role":"Flight Attendant","option":"Asking about in-flight meals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Tourist Information Center","situation":"Planning a city tour","gpt_role":"Tourist Information Officer","option":"Getting recommendations for local attractions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car owner","place":"Auto repair shop","situation":"My car won''t start","gpt_role":"Auto mechanic","option":"It''s raining heavily outside"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Novice mechanic","place":"Home garage","situation":"I want to change my car''s oil","gpt_role":"Experienced mechanic","option":"I don''t have the right tools"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"Highway","situation":"My tire blew out","gpt_role":"Roadside assistance","option":"I''m in a rush to get to an important meeting"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Interested buyer","place":"Car dealership","situation":"I want to know more about the car''s maintenance history","gpt_role":"Salesperson","option":"I''m considering buying a used car"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Driver","place":"Gas station","situation":"I need to fill up my car''s tank","gpt_role":"Gas station attendant","option":"I''m not sure which type of gasoline to use"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Movie enthusiast","place":"Living room","situation":"Watching a classic movie","gpt_role":"Movie critic","option":"The movie is in black and white"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"First-time moviegoer","place":"Movie theater","situation":"Watching a horror movie","gpt_role":"Movie usher","option":"The theater is almost empty"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Netflix binge-watcher","place":"Friend''s house","situation":"Watching a popular TV show","gpt_role":"TV show spoiler","option":"The show just released a new season"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Traveler","place":"Hotel room","situation":"Watching a foreign movie","gpt_role":"Hotel staff","option":"The subtitles are not working"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Family member","place":"Family room","situation":"Watching a sports game","gpt_role":"TV remote hog","option":"The game is in overtime"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Player","place":"Basketball court","situation":"Preparing for a tournament","gpt_role":"Coach","option":"Discussing game strategy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Attendee","place":"Gaming convention","situation":"Trying out a new game","gpt_role":"Vendor","option":"Asking for game tips"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Player","place":"Tennis court","situation":"Playing a friendly match","gpt_role":"Opponent","option":"Making small talk during breaks"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Player","place":"Board game cafe","situation":"Starting a new game","gpt_role":"Game master","option":"Explaining game rules"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Spectator","place":"Football stadium","situation":"Watching a live match","gpt_role":"Commentator","option":"Predicting the outcome of the game"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Supermarket","situation":"I see an elderly person struggling to reach an item on the top shelf.","gpt_role":"Employee","option":"The item is heavy and they cannot lift it"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Jogger","place":"Park","situation":"I notice a person sitting on a bench looking upset.","gpt_role":"Passerby","option":"They lost their phone and cannot find their way home."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Visitor","place":"Hospital","situation":"I see a patient in a wheelchair struggling to reach the elevator button.","gpt_role":"Nurse","option":"The patient is visually impaired and cannot see the button."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Library","situation":"I see a person struggling to carry a large stack of books.","gpt_role":"Librarian","option":"The person has a broken arm and cannot carry the books alone."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pedestrian","place":"Street","situation":"I see a homeless person sleeping on the sidewalk with no blanket.","gpt_role":"Homeless person","option":"It is a cold winter night and the person is shivering."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Local park","situation":"Organizing a community picnic","gpt_role":"Event coordinator","option":"Trying to accommodate dietary restrictions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Attendee","place":"Community center","situation":"Participating in a gardening workshop","gpt_role":"Workshop facilitator","option":"Learning about composting"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Presenter","place":"City hall","situation":"Proposing a new community project","gpt_role":"City council member","option":"Dealing with budget constraints"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Organizer","place":"Local library","situation":"Hosting a storytime event","gpt_role":"Children''s librarian","option":"Incorporating interactive activities"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Participant","place":"Town square","situation":"Attending a cultural festival","gpt_role":"Event emcee","option":"Sampling traditional foods"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Guest","place":"At a friend''s house","situation":"Celebrating Thanksgiving","gpt_role":"Host","option":"Everyone is bringing a dish to share"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Birthday girl/boy","place":"At a fancy restaurant","situation":"Celebrating a birthday","gpt_role":"Waiter","option":"The restaurant offers a free dessert for the birthday person"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Organizer","place":"At a park","situation":"Celebrating Earth Day","gpt_role":"Volunteer","option":"The event includes a tree-planting activity"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"At a school gymnasium","situation":"Celebrating Christmas","gpt_role":"Teacher","option":"The school choir is performing Christmas carols"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Bride","place":"At a beach resort","situation":"Celebrating a wedding","gpt_role":"Wedding planner","option":"The ceremony is held on the beach at sunset"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Italian restaurant","situation":"Ordering food","gpt_role":"Waiter","option":"Deciding between two pasta dishes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Japanese restaurant","situation":"Trying new sushi roll","gpt_role":"Sushi chef","option":"Sushi chef recommends a special roll"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Mexican restaurant","situation":"Ordering a spicy dish","gpt_role":"Server","option":"Server warns about spiciness level"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Chinese restaurant","situation":"Trying new dumpling dish","gpt_role":"Dumpling maker","option":"Dumpling maker teaches how to make dumplings"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"French bakery","situation":"Trying new pastry","gpt_role":"Baker","option":"Baker explains the history of the pastry"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Concertgoer","place":"Madison Square Garden","situation":"Buying tickets for a sold-out concert","gpt_role":"Ticket seller","option":"Trying to negotiate a better price"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Musician","place":"Local bar","situation":"Performing a live set","gpt_role":"Bar owner","option":"Dealing with a rowdy audience member"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Usher","place":"Outdoor amphitheater","situation":"Directing concertgoers to their seats","gpt_role":"Concert promoter","option":"Handling a VIP seating mix-up"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Stage manager","place":"Opera house","situation":"Preparing for a live performance","gpt_role":"Lead singer","option":"Dealing with a last-minute costume malfunction"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Audience member","place":"Community center","situation":"Attending a talent show","gpt_role":"Emcee","option":"Being asked to fill in as a judge"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Marketing manager","place":"Conference center","situation":"Introducing new product line to potential clients","gpt_role":"Sales director","option":"The event is running behind schedule"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Freelance writer","place":"Coffee shop","situation":"Discussing article pitches and deadlines","gpt_role":"Editor","option":"The coffee shop is noisy and crowded"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"HR manager","place":"Office building","situation":"Interviewing job candidates","gpt_role":"Recruiter","option":"One of the candidates is late"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Event planner","place":"Hotel lobby","situation":"Finalizing menu options for upcoming event","gpt_role":"Catering manager","option":"The hotel is experiencing a power outage"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Software developer","place":"Online meeting","situation":"Discussing project timeline and deliverables","gpt_role":"Project manager","option":"One of the team members has poor internet connection"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Novice monk","place":"Buddhist temple","situation":"Learning to meditate","gpt_role":"Experienced monk","option":"Sitting in silence for an hour"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Altar server","place":"Catholic church","situation":"Preparing for mass","gpt_role":"Priest","option":"Setting up the altar"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Devotee","place":"Hindu temple","situation":"Performing a puja","gpt_role":"Pandit","option":"Offering flowers and incense"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Bar mitzvah boy","place":"Jewish synagogue","situation":"Reading from the Torah","gpt_role":"Rabbi","option":"Reciting the Shema prayer"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Boyfriend","place":"Beach","situation":"Walking on the beach at sunset","gpt_role":"Girlfriend","option":"Watching the waves crash on the shore"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Husband","place":"Park","situation":"Having a picnic on a sunny day","gpt_role":"Wife","option":"Playing frisbee together"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Date","place":"Restaurant","situation":"Ordering food and drinks","gpt_role":"Partner","option":"Trying a new exotic dish"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Boyfriend","place":"Movie theater","situation":"Watching a romantic comedy","gpt_role":"Girlfriend","option":"Sharing a tub of popcorn"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Husband","place":"Concert venue","situation":"Swaying to the music of their favorite band","gpt_role":"Wife","option":"Singing along to the chorus"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fan","place":"Stadium","situation":"Buying a ticket for the game","gpt_role":"Ticket vendor","option":"The game is sold out"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Player","place":"Basketball court","situation":"Practicing before the game","gpt_role":"Coach","option":"The team is losing all their games"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Referee","place":"Soccer field","situation":"Making a controversial call","gpt_role":"Coach","option":"The game is tied and in overtime"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Announcer","place":"Baseball stadium","situation":"Commentating on a home run","gpt_role":"Umpire","option":"The home team is down by 3 runs"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Cheerleader","place":"Football stadium","situation":"Performing a halftime routine","gpt_role":"Mascot","option":"It''s raining and the field is slippery"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"National Museum of Natural History","situation":"Exploring the dinosaur exhibit","gpt_role":"Museum guide","option":"Excitedly pointing out interesting facts"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Art enthusiast","place":"The Louvre","situation":"Admiring the Mona Lisa","gpt_role":"Gallery curator","option":"Discussing the painting''s history and significance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"History buff","place":"Ellis Island Immigration Museum","situation":"Learning about the immigrant experience","gpt_role":"Museum docent","option":"Sharing personal family immigration stories"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Archaeology student","place":"The British Museum","situation":"Examining ancient Egyptian artifacts","gpt_role":"Museum expert","option":"Discussing the process of excavation and preservation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Texan","place":"The Alamo","situation":"Reliving the Battle of the Alamo","gpt_role":"Historical reenactor","option":"Wearing period-appropriate clothing and using replica weapons"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Library","situation":"Asking for help in finding relevant books for exam preparation","gpt_role":"Librarian","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Teacher","place":"Classroom","situation":"Giving a mock presentation and providing feedback","gpt_role":"Student","option":"The student is nervous and lacks confidence"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Online","situation":"Taking an online course and seeking clarification on a difficult topic","gpt_role":"Tutor","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Manager","place":"Conference room","situation":"Preparing for an important presentation to senior management","gpt_role":"Employee","option":"The employee is new to the company and unsure of the company culture"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Coffee shop","situation":"Studying for a final exam together","gpt_role":"Friend","option":"The friend is easily distracted and keeps getting off topic"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Host","place":"A friend''s house","situation":"Hosting a dinner party","gpt_role":"Guest","option":"One of the guests is a picky eater"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Host","place":"A rooftop bar","situation":"Hosting a cocktail party","gpt_role":"Guest","option":"It starts raining halfway through the party"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"A community center","situation":"Hosting a potluck","gpt_role":"Attendee","option":"There''s not enough food for everyone"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Event planner","place":"A mansion","situation":"Hosting a charity gala","gpt_role":"Client","option":"A celebrity unexpectedly cancels their appearance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Picnic organizer","place":"A park","situation":"Hosting a picnic","gpt_role":"Picnic-goer","option":"A swarm of bees disrupts the party"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car owner","place":"Car wash","situation":"Getting my car washed","gpt_role":"Car wash attendant","option":"Deciding between a basic wash or a full detail"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car owner","place":"Home driveway","situation":"Cleaning my car on a Saturday afternoon","gpt_role":"Friend","option":"Listening to music or a podcast while cleaning"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car owner","place":"Parking lot","situation":"Cleaning my car before a job interview","gpt_role":"Stranger","option":"Using a portable vacuum or just a broom"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car owner","place":"Auto repair shop","situation":"Cleaning my car after a major repair","gpt_role":"Mechanic","option":"Using a power washer or just a hose"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Car owner","place":"Gas station","situation":"Cleaning my car before a road trip","gpt_role":"Gas station attendant","option":"Using the free squeegee or buying a car cleaning kit"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"My apartment","situation":"I need help fixing a leaky faucet in my bathroom.","gpt_role":"Handyman","option":"I have already tried tightening the faucet myself, but it didn''t work."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Son/Daughter","place":"My parents'' house","situation":"My parents need their roof repaired after a storm.","gpt_role":"Contractor","option":"We need to discuss the cost and timeline for the repair."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Landlord","place":"My rental property","situation":"My tenants have reported a problem with the heating system.","gpt_role":"Maintenance worker","option":"I need to schedule a time for the maintenance worker to come and fix the issue."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Visitor","place":"My friend''s house","situation":"My friend needs help installing a new ceiling fan in their living room.","gpt_role":"Handy friend","option":"We need to make sure we have all the necessary tools and equipment before starting the installation."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"My workplace","situation":"One of the light fixtures in the office is flickering and needs to be replaced.","gpt_role":"Facilities manager","option":"We need to make sure the replacement bulb is the correct size and type for the fixture."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Meditation student","place":"Zen garden","situation":"Learning how to meditate","gpt_role":"Meditation teacher","option":"Teacher guides student through breathing exercises"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Mindfulness practitioner","place":"Yoga studio","situation":"Incorporating mindfulness into yoga practice","gpt_role":"Yoga instructor","option":"Instructor leads class in a guided meditation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Solo hiker","place":"Nature trail","situation":"Practicing mindfulness in nature","gpt_role":"Mindfulness guide","option":"Guide prompts hiker to focus on sounds of the forest"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Retreat participant","place":"Meditation retreat center","situation":"Deepening meditation practice","gpt_role":"Meditation leader","option":"Leader leads group in a walking meditation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Stressed out worker","place":"Living room","situation":"Using an app to practice mindfulness","gpt_role":"Meditation app","option":"App prompts user to focus on their breath"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Community center","situation":"Discussing anxiety and stress","gpt_role":"Therapist","option":"Group therapy with other patients"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Family member","place":"Hospital","situation":"Coping with a loved one''s illness","gpt_role":"Support group leader","option":"Small group discussion with other families"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"College student","place":"Online","situation":"Managing depression and loneliness","gpt_role":"Mental health counselor","option":"One-on-one virtual session"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"First-time patient","place":"Private practice","situation":"Dealing with PTSD","gpt_role":"Psychiatrist","option":"Initial consultation and evaluation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Recovering addict","place":"Rehabilitation center","situation":"Staying sober and avoiding triggers","gpt_role":"Addiction counselor","option":"Group therapy with other recovering addicts"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Home Depot","situation":"I need help finding the right tools for building a bookshelf","gpt_role":"Sales Associate","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Mechanic","place":"Garage","situation":"Teaching how to change a car''s oil","gpt_role":"Apprentice","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"DIY Enthusiast","place":"Backyard","situation":"Asking for help with building a garden bed","gpt_role":"Neighbor","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Contractor","place":"Hardware store","situation":"Looking for the best materials for a bathroom remodel","gpt_role":"Employee","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Foreman","place":"Construction site","situation":"Teaching how to use heavy machinery for building a skyscraper","gpt_role":"New Hire","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Hiker","place":"Mount Everest","situation":"Planning the route to the summit","gpt_role":"Tour Guide","option":"Discussing the weather forecast"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Park Ranger","place":"Yellowstone National Park","situation":"Explaining the park''s geothermal features","gpt_role":"Tourist","option":"Asking for recommendations on hiking trails"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Explorer","place":"Amazon Rainforest","situation":"Searching for rare plant species","gpt_role":"Local Guide","option":"Encountering a poisonous snake"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Geologist","place":"Grand Canyon","situation":"Identifying different rock formations","gpt_role":"Visitor","option":"Discussing the history of the canyon''s formation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Dog Sledder","place":"Alaska","situation":"Preparing for a dog sled race","gpt_role":"Tourist","option":"Learning how to handle the sled and dogs"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fitness enthusiast","place":"Gym","situation":"Trying out a new strength training routine","gpt_role":"Personal trainer","option":"The routine involves using kettlebells"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Beginner yogi","place":"Yoga studio","situation":"Trying a new yoga class","gpt_role":"Experienced yoga instructor","option":"The class focuses on inversions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Outdoor enthusiast","place":"Park","situation":"Trying a new running routine","gpt_role":"Fitness coach","option":"The routine involves interval training"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Swimmer","place":"Swimming pool","situation":"Trying a new swimming technique","gpt_role":"Swimming coach","option":"The technique is butterfly stroke"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Dance enthusiast","place":"Dance studio","situation":"Trying a new dance style","gpt_role":"Dance instructor","option":"The style is hip hop"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Library","situation":"Asking for book recommendations","gpt_role":"Librarian","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Writer","place":"Coffee shop","situation":"Discussing research strategies","gpt_role":"Fellow writer","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Blogger","place":"Online forum","situation":"Asking for advice on research methods","gpt_role":"Expert in topic","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"University lecture hall","situation":"Asking for clarification on a reading assignment","gpt_role":"Professor","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Reader","place":"Bookstore","situation":"Asking for book recommendations based on interests","gpt_role":"Bookstore employee","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"volunteer coordinator","place":"local community center","situation":"planning a rally","gpt_role":"campaign manager","option":"deciding on guest speakers"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"phone bank volunteer","place":"campaign headquarters","situation":"making calls to potential voters","gpt_role":"call script writer","option":"handling difficult conversations"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"petition gatherer","place":"city hall","situation":"presenting signatures to city council","gpt_role":"lobbyist","option":"responding to opposition arguments"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"tabling volunteer","place":"university campus","situation":"registering students to vote","gpt_role":"outreach coordinator","option":"dealing with apathetic students"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"marshaling volunteer","place":"protest march","situation":"ensuring marchers stay safe","gpt_role":"security coordinator","option":"managing counter-protesters"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Marketing Manager","place":"New York City","situation":"Attending a seminar on digital marketing","gpt_role":"Conference Organizer","option":"Discussing the latest trends in social media advertising"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Software Engineer","place":"San Francisco","situation":"Attending a conference on artificial intelligence","gpt_role":"Tech Conference Speaker","option":"Participating in a panel discussion on the ethics of AI"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sales Representative","place":"Las Vegas","situation":"Attending a seminar on effective sales techniques","gpt_role":"Seminar Host","option":"Role-playing different sales scenarios with other attendees"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Human Resources Manager","place":"Chicago","situation":"Attending a conference on workplace diversity and inclusion","gpt_role":"Conference Panelist","option":"Leading a breakout session on unconscious bias in hiring"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Financial Analyst","place":"London","situation":"Attending a seminar on blockchain technology","gpt_role":"Seminar Presenter","option":"Demonstrating the use of smart contracts in financial transactions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Chef","place":"A friend''s house","situation":"Preparing a three-course meal for a dinner party","gpt_role":"Diner","option":"One of the guests is a vegetarian"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Apprentice baker","place":"A bakery","situation":"Taking orders and serving pastries","gpt_role":"Customer","option":"The customer has a nut allergy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Contestant","place":"A cooking competition","situation":"Preparing a signature dish to impress the judges","gpt_role":"Judge","option":"One of the ingredients is missing from the pantry"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Home cook","place":"A family gathering","situation":"Preparing a traditional holiday meal","gpt_role":"Relative","option":"The kitchen is small and crowded"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sous chef","place":"A restaurant","situation":"Preparing and serving dishes from the menu","gpt_role":"Customer","option":"The customer has a special request for their meal"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend","place":"Apartment building","situation":"Helping move furniture down the stairs","gpt_role":"Friend''s roommate","option":"One of the pieces is too big to fit through the door"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sibling","place":"Suburban house","situation":"Packing up childhood bedroom","gpt_role":"Parent","option":"Finding old toys and mementos"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Partner","place":"City apartment","situation":"Loading boxes into a moving truck","gpt_role":"Partner''s roommate","option":"Realizing some boxes are heavier than expected"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Cousin","place":"Rural farmhouse","situation":"Moving livestock to a new barn","gpt_role":"Aunt","option":"One of the animals is stubborn and won''t budge"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend","place":"High-rise condo","situation":"Disassembling furniture for easier transport","gpt_role":"Friend''s significant other","option":"Realizing some of the screws are missing"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Protester","place":"City Hall","situation":"Protesters are blocking the entrance to City Hall","gpt_role":"Police Officer","option":"The police are using tear gas to disperse the crowd"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student Protester","place":"University Campus","situation":"Students are protesting against tuition fee hikes","gpt_role":"Campus Security","option":"The security is trying to prevent the students from entering the administration building"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Immigrant Rights Activist","place":"Airport","situation":"Activists are protesting against the deportation of undocumented immigrants","gpt_role":"Customs and Border Protection Officer","option":"The officer is detaining an undocumented immigrant and the protesters are trying to stop it"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Environmental Activist","place":"Corporate Headquarters","situation":"Activists are protesting against the company''s environmental policies","gpt_role":"Corporate Executive","option":"The executive is refusing to meet with the activists"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Gun Control Activist","place":"State Capitol","situation":"Activists are protesting against the lack of gun control laws","gpt_role":"State Senator","option":"The senator is refusing to support any new gun control legislation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Hiker","place":"National Park","situation":"Asking for hiking trail recommendations","gpt_role":"Park Ranger","option":"It''s a hot day and I''m looking for a trail with shade"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Surfer","place":"Beach","situation":"Checking the surf conditions","gpt_role":"Lifeguard","option":"There''s a storm offshore and I''m wondering if it''s safe to surf"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Camper","place":"Cabin in the woods","situation":"Checking in at the campsite","gpt_role":"Park Ranger","option":"I forgot to bring my tent and need to rent one"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"Botanical Garden","situation":"Asking for a map of the garden","gpt_role":"Garden Guide","option":"I''m interested in seeing the rare and exotic plants"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fisherman","place":"Lake","situation":"Renting a boat for the day","gpt_role":"Boat Rental Attendant","option":"I''m looking for a spot with good bass fishing"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"A teenager","place":"At home","situation":"Getting ready for school","gpt_role":"A parent","option":"Running late"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"A fitness enthusiast","place":"At the gym","situation":"After a workout","gpt_role":"A gym instructor","option":"Using the shower facilities"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"A job applicant","place":"At a job interview","situation":"Preparing for the interview","gpt_role":"An interviewer","option":"Checking appearance in the mirror"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"A tourist","place":"At a hotel","situation":"Getting ready for a day of sightseeing","gpt_role":"A hotel staff","option":"Requesting extra toiletries"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"A guest","place":"At a friend''s house","situation":"Getting ready for a night out","gpt_role":"A host","option":"Sharing grooming tips"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"At home","situation":"You want to send a message to your best friend to invite them over for dinner tonight","gpt_role":"Your best friend","option":"You have just finished cooking and are excited to share your meal with them"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"At work","situation":"You need to call your mother to let her know that you will be working late tonight","gpt_role":"Your mother","option":"You are feeling guilty because you promised to have dinner with her tonight"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"On the bus","situation":"You want to send a message to your sibling to ask them to pick up some groceries on their way home","gpt_role":"Your sibling","option":"You are feeling grateful because they always help you out"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"At a cafe","situation":"You want to call your significant other to tell them how much you miss them","gpt_role":"Your significant other","option":"You are feeling sad because you haven''t seen them in a while"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"At the park","situation":"You want to send a message to your grandparent to check in on them and see how they are doing","gpt_role":"Your grandparent","option":"You are feeling worried because they are getting older and you want to make sure they are okay"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"pet owner","place":"park","situation":"walking my dog","gpt_role":"stranger","option":"the stranger''s dog approaches mine"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"visitor","place":"zoo","situation":"watching the elephants","gpt_role":"zookeeper","option":"the zookeeper offers to answer my questions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"volunteer","place":"farm","situation":"feeding the chickens","gpt_role":"farmer","option":"the farmer asks for my help with other tasks"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"beach-goer","place":"beach","situation":"eating a sandwich","gpt_role":"seagull","option":"the seagull tries to steal my food"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"pet owner","place":"vet clinic","situation":"getting my cat''s check-up","gpt_role":"veterinarian","option":"the vet recommends a new type of food for my cat"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"picnic organizer","place":"park","situation":"planning the menu","gpt_role":"picnic guest","option":"deciding on vegetarian options"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"grill master","place":"beach","situation":"preparing the grill","gpt_role":"beachgoer","option":"dealing with windy conditions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"host","place":"backyard","situation":"setting up the picnic area","gpt_role":"neighbor","option":"dealing with a sudden rain shower"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"camper","place":"campsite","situation":"gathering firewood","gpt_role":"fellow camper","option":"finding dry wood after a rainfall"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"city dweller","place":"rooftop","situation":"enjoying the view","gpt_role":"friend","option":"dealing with noisy neighbors"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Game Master","place":"Living Room","situation":"Playing a game of Monopoly","gpt_role":"Player","option":"The player just landed on Boardwalk and cannot afford the rent"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Card Dealer","place":"Coffee Shop","situation":"Playing a game of Poker","gpt_role":"Opponent","option":"The opponent just went all in and you have a strong hand"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Board Game Enthusiast","place":"Park","situation":"Playing a game of Settlers of Catan","gpt_role":"Friend","option":"You are trying to negotiate a trade for sheep"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Uno Champion","place":"Family Room","situation":"Playing a game of Uno","gpt_role":"Sibling","option":"You have just played a Draw Four card and your sibling is not happy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Game Store","situation":"Looking for a new board game to play","gpt_role":"Employee","option":"The employee is recommending a game that you have never heard of"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"College student","place":"Coffee shop","situation":"Discussing post-graduation plans","gpt_role":"Career counselor","option":"Considering gap year"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"Office","situation":"Performance review","gpt_role":"Manager","option":"Setting career growth goals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Stay-at-home parent","place":"Home","situation":"Feeling unfulfilled","gpt_role":"Life coach","option":"Exploring personal goals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fitness enthusiast","place":"Gym","situation":"Starting a new workout routine","gpt_role":"Personal trainer","option":"Setting achievable fitness goals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"High school student","place":"Library","situation":"Preparing for college applications","gpt_role":"Guidance counselor","option":"Setting academic and career goals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Cafeteria","situation":"Starting a romantic relationship","gpt_role":"Friend","option":"Both of us have been secretly crushing on each other for a long time."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"Beach","situation":"Ending a romantic relationship","gpt_role":"Local","option":"We''ve been dating long-distance for a few months and it''s not working out."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Waiter","place":"Restaurant","situation":"Starting a romantic relationship","gpt_role":"Regular Customer","option":"I''ve been flirting with them for weeks and finally asked them out on a date."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Jogger","place":"Park","situation":"Ending a romantic relationship","gpt_role":"Fellow Jogger","option":"We''ve been casually seeing each other for a few weeks and I''m just not feeling it anymore."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Boss","place":"Office","situation":"Starting a romantic relationship","gpt_role":"Employee","option":"We''ve been working together for a while and there''s always been a spark between us."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New resident","place":"New York City","situation":"Looking for a new apartment","gpt_role":"Real estate agent","option":"Apartment must be pet-friendly"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"London","situation":"Exploring the city","gpt_role":"Tour guide","option":"Visiting historical landmarks"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New resident","place":"Los Angeles","situation":"Moving to a new home","gpt_role":"Moving company representative","option":"Packing and transporting fragile items"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Paris","situation":"Enrolling in a language course","gpt_role":"Language school administrator","option":"Choosing the right level of instruction"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Business traveler","place":"Sydney","situation":"Checking into a new hotel","gpt_role":"Hotel concierge","option":"Arranging transportation to a business meeting"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Bride''s best friend","place":"Grand ballroom at a luxury hotel","situation":"Finalizing the seating chart","gpt_role":"Wedding planner","option":"The bride''s estranged aunt just RSVP''d"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Groom''s sister","place":"Mansion overlooking the ocean","situation":"Selecting the menu","gpt_role":"Event coordinator","option":"The groom''s vegan cousin just informed you of their dietary restrictions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Mother of the bride","place":"Cathedral in the city center","situation":"Choosing the floral arrangements","gpt_role":"Florist","option":"The bride''s favorite flower is out of season"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Maid of honor","place":"Rustic barn in the countryside","situation":"Creating the playlist","gpt_role":"DJ","option":"The groom''s favorite song is a heavy metal track"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Wedding guest","place":"Art museum in the downtown district","situation":"Taking candid photos","gpt_role":"Photographer","option":"The bride''s ex-boyfriend just arrived at the reception"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Marketing Manager","place":"Corporate office","situation":"First day at work","gpt_role":"HR Manager","option":"Orientation session"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nurse","place":"Hospital","situation":"Joining a new department","gpt_role":"Head Nurse","option":"Meeting with the team"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Software Engineer","place":"Tech startup","situation":"Starting a new project","gpt_role":"CTO","option":"Brainstorming session"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Paralegal","place":"Law firm","situation":"First day at work","gpt_role":"Senior Partner","option":"Office tour"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Editor","place":"Fashion magazine","situation":"Taking over a new team","gpt_role":"Chief Editor","option":"Team meeting"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"Corporate office","situation":"Quitting a job due to personal reasons","gpt_role":"HR Manager","option":"Discussing potential job opportunities within the company"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Chef","place":"Restaurant","situation":"Ending a career path as a chef","gpt_role":"Restaurant owner","option":"Exploring options for opening a new restaurant"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nurse","place":"Hospital","situation":"Quitting a job due to burnout","gpt_role":"Doctor","option":"Discussing potential career paths within the healthcare industry"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lawyer","place":"Law firm","situation":"Ending a career path as a lawyer","gpt_role":"Managing partner","option":"Exploring options for transitioning to a different field"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Software engineer","place":"Tech company","situation":"Quitting a job due to lack of growth opportunities","gpt_role":"Project manager","option":"Discussing potential career paths within the company"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Grieving daughter","place":"Funeral home","situation":"Planning the funeral service","gpt_role":"Funeral director","option":"Choosing the casket"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Widow","place":"Cemetery","situation":"Visiting the grave","gpt_role":"Grave digger","option":"Planting flowers"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Grieving parent","place":"Therapist''s office","situation":"Discussing the loss","gpt_role":"Therapist","option":"Exploring coping mechanisms"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend of the deceased","place":"Park","situation":"Reflecting on the loss","gpt_role":"Sympathetic stranger","option":"Sharing memories"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sibling","place":"Home","situation":"Sorting through the deceased''s belongings","gpt_role":"Parent","option":"Deciding what to keep and what to donate"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Doctor''s office","situation":"Receiving test results","gpt_role":"Doctor","option":"The test results are inconclusive"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Hospital","situation":"Preparing for surgery","gpt_role":"Nurse","option":"The patient is allergic to anesthesia"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Pharmacy","situation":"Picking up medication","gpt_role":"Pharmacist","option":"The medication is out of stock"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Caregiver","place":"Home","situation":"Caring for a sick family member","gpt_role":"Doctor","option":"The family member''s condition is worsening"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Emergency room","situation":"Receiving treatment for a sudden illness","gpt_role":"Nurse","option":"The patient has no medical history or insurance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"Office","situation":"Your boss is constantly criticizing your work","gpt_role":"Boss","option":"You have tried talking to your boss about the issue, but they refuse to listen"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Manager","place":"Meeting room","situation":"Your coworker is always interrupting you during meetings","gpt_role":"Difficult coworker","option":"You have tried politely asking them to stop, but they continue to do it"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Team lead","place":"Cafeteria","situation":"Your coworker is always taking credit for your team''s work","gpt_role":"Difficult coworker","option":"You have tried talking to them about it, but they deny doing anything wrong"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"HR representative","place":"Conference room","situation":"Your boss is making inappropriate comments to you and your coworkers","gpt_role":"Difficult boss","option":"You have reported the behavior to HR, but your boss continues to do it"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Trainer","place":"Workshop","situation":"Your coworker is always questioning your authority and expertise","gpt_role":"Difficult coworker","option":"You have tried explaining your qualifications, but they still refuse to listen"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Protester","place":"City Hall","situation":"Protesting against police brutality","gpt_role":"Police Officer","option":"The police officer is a friend of the protester"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student Activist","place":"University Campus","situation":"Demanding divestment from fossil fuels","gpt_role":"University Administrator","option":"The university administrator is sympathetic to the cause"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"LGBTQ+ Activist","place":"State Capitol","situation":"Advocating for anti-discrimination laws","gpt_role":"State Senator","option":"The state senator is opposed to the activist''s views"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Climate Change Activist","place":"Local Park","situation":"Raising awareness about the effects of climate change","gpt_role":"City Council Member","option":"The city council member is interested in implementing green initiatives"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Labor Activist","place":"Corporate Headquarters","situation":"Fighting for fair wages and better working conditions","gpt_role":"CEO","option":"The CEO is willing to negotiate with the activist group"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fitness enthusiast","place":"Gym","situation":"Getting a new workout plan","gpt_role":"Personal trainer","option":"Discussing fitness goals and preferences"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Busy professional","place":"Home","situation":"Working out during lunch break","gpt_role":"Virtual fitness coach","option":"Choosing a quick and effective workout routine"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Beginner","place":"Gym","situation":"Using gym equipment for the first time","gpt_role":"Experienced gym-goer","option":"Asking for guidance on proper form and technique"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Stay-at-home parent","place":"Home","situation":"Working out with kids around","gpt_role":"Online fitness class instructor","option":"Incorporating fun and interactive exercises for kids to join in"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Competitive athlete","place":"Gym","situation":"Preparing for a big game","gpt_role":"Sports performance coach","option":"Tailoring workout to improve specific skills and performance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Caregiver","place":"At home","situation":"Helping with daily activities","gpt_role":"Elderly family member","option":"Assisting with bathing and dressing"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Advocate","place":"At the hospital","situation":"Communicating with medical staff","gpt_role":"Sick family member","option":"Making decisions about treatment options"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Visitor","place":"In a nursing home","situation":"Providing emotional support","gpt_role":"Elderly family member","option":"Bringing favorite items from home"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Cook","place":"At home","situation":"Preparing meals","gpt_role":"Elderly family member","option":"Adapting recipes for dietary restrictions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Companion","place":"At home","situation":"Spending time together","gpt_role":"Elderly family member","option":"Playing games or doing puzzles"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Travel Planner","place":"Hawaii","situation":"Deciding on activities","gpt_role":"Friend","option":"Trying to find activities that everyone will enjoy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Budget Manager","place":"Europe","situation":"Booking accommodations","gpt_role":"Family Member","option":"Trying to find a place that fits everyone''s needs and budget"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Itinerary Planner","place":"Disney World","situation":"Deciding on which attractions to visit","gpt_role":"Niece/Nephew","option":"Trying to balance everyone''s interests and age ranges"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Gear Coordinator","place":"Camping in the Mountains","situation":"Preparing for the trip","gpt_role":"Friend","option":"Making sure everyone has the appropriate gear and equipment"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Foodie","place":"Beach Resort","situation":"Choosing restaurants","gpt_role":"Spouse","option":"Trying to find the best local cuisine and seafood options"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sales Manager","place":"Corporate office","situation":"I have achieved my sales targets for the quarter","gpt_role":"CEO","option":"The company is facing financial difficulties"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Assistant Manager","place":"Retail store","situation":"I have consistently exceeded my sales goals","gpt_role":"Store Manager","option":"There is a new store opening in the area"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Junior Attorney","place":"Law firm","situation":"I have successfully closed a major case","gpt_role":"Senior Partner","option":"The firm is expanding its practice areas"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Software Engineer","place":"Tech company","situation":"I have developed a new feature that has received positive feedback from users","gpt_role":"CTO","option":"The company is planning to launch a new product"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nurse","place":"Hospital","situation":"I have consistently provided excellent patient care","gpt_role":"Head of Nursing","option":"The hospital is implementing new technology to improve patient outcomes"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Entrepreneur","place":"Coffee Shop","situation":"Pitching a new business idea","gpt_role":"Investor","option":"The entrepreneur has a prototype to show"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"CEO","place":"Office","situation":"Presenting financial reports","gpt_role":"Board Member","option":"The company is facing financial difficulties"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Startup Founder","place":"Conference Room","situation":"Negotiating a partnership deal","gpt_role":"Potential Partner","option":"The startup needs funding to scale up"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Entrepreneur","place":"Co-Working Space","situation":"Seeking advice on business strategy","gpt_role":"Mentor","option":"The entrepreneur is facing competition from established players"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Business Owner","place":"Online Meeting","situation":"Discussing marketing strategy","gpt_role":"Consultant","option":"The business wants to target a new demographic"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Stressed Employee","place":"Office","situation":"Requesting a mental health day off","gpt_role":"Understanding Manager","option":""}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Overworked Freelancer","place":"Home","situation":"Discussing the need for a break","gpt_role":"Supportive Friend","option":"Overcoming feelings of guilt"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Anxious Individual","place":"Counselor''s Office","situation":"Exploring the benefits of taking a mental health day","gpt_role":"Empathetic Counselor","option":"Discussing coping mechanisms"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Burnt-out Executive","place":"Beach","situation":"Enjoying a day off at the beach","gpt_role":"Relaxing Beachgoer","option":"Reflecting on work-life balance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Mentally Exhausted Student","place":"Park","situation":"Sharing the need for a mental health break","gpt_role":"Sympathetic Classmate","option":"Discussing self-care practices"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"defendant","place":"courtroom","situation":"I am being accused of theft and must defend myself in court.","gpt_role":"judge","option":"The prosecution has strong evidence against me."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"lawyer","place":"law office","situation":"My client has been sued for breach of contract and needs legal representation.","gpt_role":"client","option":"The opposing party is a large corporation with a team of lawyers."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"mediator","place":"mediation room","situation":"Two parties are in a legal dispute and have agreed to try mediation before going to court.","gpt_role":"parties in dispute","option":"The dispute is about property ownership and both parties have emotional attachment to the property."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"paralegal","place":"jail","situation":"I am assisting an inmate with a legal appeal for their conviction.","gpt_role":"inmate","option":"The inmate claims they were wrongfully convicted due to racial bias."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"arbitrator","place":"arbitration hearing","situation":"Two parties have agreed to arbitration to resolve a legal dispute.","gpt_role":"parties in dispute","option":"The dispute is about intellectual property rights and both parties have invested significant resources in the disputed property."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Freshman student","place":"College campus","situation":"Trying to join the debate club","gpt_role":"Club president","option":"There are already too many members"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Retiree","place":"Community center","situation":"Wanting to volunteer for the local food bank","gpt_role":"Volunteer coordinator","option":"The schedule conflicts with other commitments"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fitness enthusiast","place":"Gym","situation":"Interested in joining a weightlifting club","gpt_role":"Personal trainer","option":"Feeling intimidated by the other members"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New member","place":"Church","situation":"Wanting to join the church''s youth group","gpt_role":"Youth group leader","option":"Not knowing anyone else in the group"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tech enthusiast","place":"Online forum","situation":"Looking to join a programming club","gpt_role":"Forum moderator","option":"Feeling unsure about the club''s level of expertise"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Job applicant","place":"Office building","situation":"You are applying for a marketing position at a tech startup.","gpt_role":"Interviewer","option":"The interviewer asks you to pitch a marketing campaign for their newest product."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Chef","place":"Restaurant","situation":"You are being interviewed for a head chef position at a new restaurant.","gpt_role":"Restaurant owner","option":"The owner asks you to create a new menu item on the spot."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lawyer","place":"Law firm","situation":"You are interviewing for a partnership position at a prestigious law firm.","gpt_role":"Partner","option":"The partner asks you to argue a hypothetical case in front of them."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fashion designer","place":"Fashion company headquarters","situation":"You are interviewing for a position as a lead designer at a high-end fashion company.","gpt_role":"Creative director","option":"The creative director asks you to sketch a design for their upcoming runway show."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Software engineer","place":"Tech company office","situation":"You are interviewing for a technical lead position at a fast-growing tech startup.","gpt_role":"Technical lead","option":"The technical lead asks you to explain a complex coding problem and how you would solve it."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Worshipper","place":"Church","situation":"Attending Sunday Mass","gpt_role":"Priest","option":"The priest is delivering a sermon on forgiveness"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Devotee","place":"Temple","situation":"Celebrating Diwali","gpt_role":"Pandit","option":"The pandit is performing the aarti"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Muslim","place":"Mosque","situation":"Observing Eid al-Fitr","gpt_role":"Imam","option":"The imam is leading the congregation in prayer"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Jewish","place":"Synagogue","situation":"Observing Yom Kippur","gpt_role":"Rabbi","option":"The rabbi is delivering a sermon on repentance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sikh","place":"Gurdwara","situation":"Celebrating Guru Nanak Jayanti","gpt_role":"Granthis","option":"The granthis are reciting the Guru Granth Sahib"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Event Planner","place":"Community Center","situation":"Planning a charity auction","gpt_role":"Donor","option":"Discussing the items to be auctioned"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fundraiser Organizer","place":"Luxury Hotel","situation":"Hosting a gala dinner","gpt_role":"Sponsor","option":"Negotiating the sponsorship package"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer Coordinator","place":"Park","situation":"Organizing a charity walkathon","gpt_role":"Volunteer","option":"Assigning roles to the volunteers"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Event Manager","place":"Museum","situation":"Planning a charity art exhibition","gpt_role":"Philanthropist","option":"Discussing the artists to be featured"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Benefit Concert Organizer","place":"Theater","situation":"Hosting a benefit concert","gpt_role":"Musician","option":"Discussing the setlist and stage setup"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Shy person","place":"Coffee Shop","situation":"Meeting for the first time","gpt_role":"Outgoing person","option":"Both waiting in line for coffee"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Dog owner","place":"Park","situation":"Walking dogs","gpt_role":"Fellow dog owner","option":"Dogs start playing together"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Book lover","place":"Library","situation":"Browsing books","gpt_role":"Fellow book lover","option":"Both reach for the same book"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Fitness enthusiast","place":"Gym","situation":"Working out","gpt_role":"Fellow gym-goer","option":"Both reach for the same equipment"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Social drinker","place":"Bar","situation":"Ordering drinks","gpt_role":"Outgoing person","option":"Both order the same drink"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend","place":"Coffee shop","situation":"Ending a friendship","gpt_role":"Friend","option":"After a big argument"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Boyfriend","place":"Park","situation":"Ending a relationship","gpt_role":"Girlfriend","option":"Long-distance relationship"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Wife","place":"Restaurant","situation":"Ending a marriage","gpt_role":"Husband","option":"Infidelity"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"Office","situation":"Ending a professional relationship","gpt_role":"Manager","option":"Poor performance"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Best friend","place":"Beach","situation":"Ending a friendship","gpt_role":"Best friend","option":"Growing apart"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Taxpayer","place":"Tax Office","situation":"Filing Taxes","gpt_role":"Tax Officer","option":"I am self-employed"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Account Holder","place":"Bank","situation":"Applying for a Loan","gpt_role":"Bank Teller","option":"I have a poor credit score"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Business Owner","place":"Accountant''s Office","situation":"Preparing Financial Statements","gpt_role":"Accountant","option":"I need to file for bankruptcy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Taxpayer","place":"IRS Office","situation":"Auditing","gpt_role":"IRS Agent","option":"I made a mistake on my tax return"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Investor","place":"Investment Firm","situation":"Managing Investments","gpt_role":"Financial Advisor","option":"I want to diversify my portfolio"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"Apartment","situation":"Moving in together for the first time","gpt_role":"Your Partner","option":"You are nervous about sharing a space with someone else"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Roommate","place":"House","situation":"Meeting your new roommate for the first time","gpt_role":"New Roommate","option":"You are unsure about how to divide household chores"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"Condo","situation":"Combining households after getting married","gpt_role":"Your Significant Other","option":"You are struggling to decide which furniture to keep and which to get rid of"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Roommate","place":"Studio Apartment","situation":"Sharing a small space with a stranger","gpt_role":"New Roommate","option":"You are worried about finding privacy in such a small living area"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"You","place":"Townhouse","situation":"Moving in together after a long-distance relationship","gpt_role":"Your Significant Other","option":"You are excited to finally be living in the same city, but nervous about adjusting to each other''s daily routines"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Visitor","place":"County Fair","situation":"Buying food at a food stall","gpt_role":"Vendor","option":"Deciding between two different types of fried food"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Concert-goer","place":"Music Festival","situation":"Getting my bag checked at the entrance","gpt_role":"Security guard","option":"Having a prohibited item in my bag"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Actor","place":"Renaissance Fair","situation":"Performing in a jousting tournament","gpt_role":"Visitor","option":"Winning or losing the tournament"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Carnival worker","place":"State Fair","situation":"Running a game booth","gpt_role":"Customer","option":"Giving a prize to a customer who wins the game"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Brewer","place":"Beer Festival","situation":"Serving my beer at a booth","gpt_role":"Beer enthusiast","option":"Running out of beer before the end of the festival"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Local community center","situation":"Preparing for a rally","gpt_role":"Campaign Manager","option":"It''s raining heavily outside"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Activist","place":"City Hall","situation":"Presenting a proposal for a new environmental policy","gpt_role":"City Council Member","option":"There is a heated debate among the council members"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Campaign Manager","place":"Campaign headquarters","situation":"Planning a town hall meeting","gpt_role":"Candidate","option":"There is a scheduling conflict with another event"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"University campus","situation":"Organizing a protest against tuition hikes","gpt_role":"Faculty Advisor","option":"The university administration has threatened to take disciplinary action"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lobbyist","place":"State Capitol","situation":"Advocating for increased funding for public schools","gpt_role":"State Senator","option":"There is a competing proposal for tax cuts"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Community college classroom","situation":"Taking a class on computer programming","gpt_role":"Teacher","option":"The teacher is using a hands-on approach and asks you to code a simple program"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Apprentice","place":"Art studio","situation":"Taking a workshop on oil painting techniques","gpt_role":"Master artist","option":"The master artist is teaching you how to mix colors to create different shades and hues"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Yoga studio","situation":"Taking a class on advanced yoga poses","gpt_role":"Instructor","option":"The instructor is guiding you through a challenging sequence that includes inversions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Chef-in-training","place":"Cooking school kitchen","situation":"Taking a course on French cuisine","gpt_role":"Head chef","option":"The head chef is demonstrating how to properly sear a steak"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Language school classroom","situation":"Taking a class on Mandarin Chinese","gpt_role":"Teacher","option":"The teacher is using flashcards to help you memorize the characters"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Goalkeeper","place":"Football field","situation":"Penalty shootout","gpt_role":"Opponent striker","option":"The score is tied and it''s the final penalty kick"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Point guard","place":"Basketball court","situation":"Fast break","gpt_role":"Opponent defender","option":"The game is tied with only a few seconds left on the clock"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Butterfly swimmer","place":"Swimming pool","situation":"Individual medley race","gpt_role":"Opponent breaststroke swimmer","option":"It''s the final lap and both swimmers are neck and neck"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Singles player","place":"Tennis court","situation":"Match point","gpt_role":"Opponent","option":"This is the final match of a tournament and the winner takes all"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sprinter","place":"Track and field stadium","situation":"100 meter dash","gpt_role":"Opponent","option":"It''s the Olympic finals and the whole world is watching"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tenant","place":"Apartment complex","situation":"Complaining about noisy neighbor","gpt_role":"Landlord","option":"The neighbor is a friend of the landlord"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Suburban neighborhood","situation":"Dealing with a neighbor''s barking dog","gpt_role":"Neighbor","option":"The neighbor is unapproachable and hostile"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tenant","place":"Rental house","situation":"Requesting repairs from negligent landlord","gpt_role":"Landlord","option":"The landlord is unresponsive and uncooperative"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Owner","place":"Condo building","situation":"Resolving a dispute over shared amenities","gpt_role":"Condo association","option":"The association has conflicting bylaws and policies"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tenant","place":"Apartment building","situation":"Reporting a pest infestation","gpt_role":"Superintendent","option":"The superintendent is inexperienced and unhelpful"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"Hospital","situation":"Your child has been admitted to the hospital with a high fever","gpt_role":"Doctor","option":"The doctor needs your consent for a medical procedure"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sibling","place":"Home","situation":"Your younger sibling has the flu and needs constant care","gpt_role":"Nurse","option":"You have to administer medication to your sibling"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Grandchild","place":"Nursing Home","situation":"Your grandparent has been admitted to a nursing home and needs constant care","gpt_role":"Nurse","option":"The nurse needs your help with feeding your grandparent"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Spouse","place":"Home","situation":"Your partner has been diagnosed with a chronic illness and needs constant care","gpt_role":"Doctor","option":"The doctor needs to discuss treatment options with you"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Parent","place":"Hospital","situation":"Your child has been in a serious accident and needs surgery","gpt_role":"Surgeon","option":"You have to sign a consent form for the surgery"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Adventurer","place":"Grand Canyon National Park","situation":"I am planning a hiking trip in the Grand Canyon and need advice on the best trails to take.","gpt_role":"Park Ranger","option":"The weather forecast is calling for thunderstorms in the area."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Road Tripper","place":"Route 66","situation":"I need directions to the nearest gas station and recommendations for the best roadside attractions.","gpt_role":"Gas Station Attendant","option":"My car is overheating and I need advice on what to do."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Wildlife Photographer","place":"Yellowstone National Park","situation":"I am looking for the best spots to photograph wildlife in Yellowstone.","gpt_role":"Park Ranger","option":"I have encountered a bear on one of the trails and need advice on how to safely proceed."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Musician","place":"New Orleans","situation":"I am looking for the best jazz clubs and music venues in New Orleans.","gpt_role":"Local Resident","option":"I have lost my instrument and need help finding a replacement before my gig tonight."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Surfer","place":"Pacific Coast Highway","situation":"I am looking for the best surf spots along the Pacific Coast Highway.","gpt_role":"Beach Local","option":"The waves are too rough at my current location and I need advice on where to find calmer waters."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Japanese restaurant","situation":"Trying sushi for the first time","gpt_role":"Waiter","option":"N/A"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Mexican restaurant","situation":"Trying spicy food for the first time","gpt_role":"Server","option":"N/A"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Food critic","place":"Indian restaurant","situation":"Tasting a new curry dish","gpt_role":"Chef","option":"N/A"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Foodie","place":"French bistro","situation":"Choosing a wine to pair with a new dish","gpt_role":"Sommelier","option":"N/A"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Group of friends","place":"Korean BBQ restaurant","situation":"Sharing a variety of dishes and grilling meat at the table","gpt_role":"Server","option":"Celebrating a birthday"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"CEO","place":"Boardroom","situation":"Starting a business partnership","gpt_role":"Potential partner","option":"Discussing terms and conditions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Entrepreneur","place":"Cafe","situation":"Ending a business partnership","gpt_role":"Current partner","option":"Negotiating a buyout"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Investor","place":"Office","situation":"Starting a business partnership","gpt_role":"Startup founder","option":"Pitching the idea"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Lawyer","place":"Conference room","situation":"Ending a business partnership","gpt_role":"Business owner","option":"Drafting a termination agreement"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Consultant","place":"Restaurant","situation":"Starting a business partnership","gpt_role":"Small business owner","option":"Brainstorming business ideas"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Chief Information Security Officer","place":"Corporate office","situation":"A data breach has been detected in the company''s database","gpt_role":"IT Support Staff","option":"The breach was caused by an employee''s negligence"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Cybersecurity Analyst","place":"Government agency","situation":"A hacker has gained access to sensitive information","gpt_role":"IT Manager","option":"The agency is responsible for national security"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Privacy Officer","place":"Hospital","situation":"A cyber attack has compromised patient records","gpt_role":"IT Specialist","option":"The hospital is facing legal action from affected patients"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Information Security Manager","place":"Bank","situation":"A phishing attack has resulted in unauthorized access to customer accounts","gpt_role":"Customer Service Representative","option":"The bank''s reputation is at risk"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Data Protection Officer","place":"E-commerce company","situation":"A security vulnerability has been discovered in the company''s website","gpt_role":"Web Developer","option":"The vulnerability could lead to financial loss for customers"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"The black sheep of the family","place":"Grandma''s house","situation":"Attending a family reunion after years of being estranged","gpt_role":"The successful cousin","option":"Grandma announces she''s leaving her inheritance to the family member who can prove they deserve it the most"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"The youngest cousin","place":"Aunt''s backyard","situation":"Attending a family gathering for a summer BBQ","gpt_role":"The favorite aunt","option":"Aunt challenges the cousins to a game of volleyball"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"The broke sibling","place":"Cousin''s mansion","situation":"Attending a family reunion for a milestone birthday","gpt_role":"The successful cousin","option":"Cousin offers to pay for everyone''s dinner at the fancy restaurant down the street"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"The mediator","place":"Family cabin","situation":"Attending a family reunion for a weekend getaway","gpt_role":"The argumentative uncle","option":"Uncle insists on starting a political debate during dinner"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"The family historian","place":"Cousin''s backyard","situation":"Attending a family gathering for a Memorial Day BBQ","gpt_role":"The forgetful cousin","option":"Family members take turns sharing stories about their ancestors"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Excited Visitor","place":"Disneyland","situation":"I just arrived at Disneyland and I''m trying to figure out which rides to go on first.","gpt_role":"Disneyland Employee","option":"The park is very crowded and the lines are long."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Thrill-Seeker","place":"Six Flags","situation":"I''m at Six Flags and I''m looking for the scariest ride in the park.","gpt_role":"Six Flags Employee","option":"It''s a hot day and I''m worried about getting sunburned."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Movie Buff","place":"Universal Studios","situation":"I''m at Universal Studios and I want to see all the movie-themed attractions.","gpt_role":"Universal Studios Employee","option":"The park is closing soon and I haven''t seen everything yet."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Family Vacationer","place":"Cedar Point","situation":"I''m at Cedar Point with my family and we''re trying to find rides that everyone can enjoy.","gpt_role":"Cedar Point Employee","option":"It''s a cloudy day and we''re worried about rain."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Foodie","place":"Knott''s Berry Farm","situation":"I''m at Knott''s Berry Farm and I want to try all the famous foods.","gpt_role":"Knott''s Berry Farm Employee","option":"I''m a vegetarian and I''m not sure what options are available."}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Resident","place":"Apartment building","situation":"Power outage","gpt_role":"Building Manager","option":"It''s winter and the heating is out"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Employee","place":"Office building","situation":"Natural disaster","gpt_role":"Facilities Manager","option":"The building has structural damage"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Customer","place":"Supermarket","situation":"Power outage","gpt_role":"Store Manager","option":"The store is in the middle of a rush hour"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Hospital","situation":"Natural disaster","gpt_role":"Nurse","option":"The hospital is understaffed"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"School","situation":"Power outage","gpt_role":"Teacher","option":"The school is in the middle of a test"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New member","place":"Gym","situation":"Discussing fitness goals","gpt_role":"Personal trainer","option":"Deciding on a workout plan"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New student","place":"Yoga studio","situation":"Introducing yoga poses","gpt_role":"Yoga instructor","option":"Customizing poses for individual needs"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New runner","place":"Running track","situation":"Explaining proper running form","gpt_role":"Running coach","option":"Setting realistic running goals"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New meditator","place":"Meditation center","situation":"Guiding through meditation techniques","gpt_role":"Meditation teacher","option":"Creating a daily meditation routine"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New client","place":"Nutritionist''s office","situation":"Assessing dietary habits","gpt_role":"Nutritionist","option":"Developing a personalized meal plan"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Heartbroken Partner","place":"Coffee Shop","situation":"Discussing the Breakup","gpt_role":"Sympathetic Friend","option":"Rainy Day"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Client","place":"Lawyer''s Office","situation":"Negotiating Settlement","gpt_role":"Divorce Attorney","option":"Child Custody Battle"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Therapist''s Office","situation":"Processing the Divorce","gpt_role":"Licensed Therapist","option":"Infidelity"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Recently Divorced","place":"Family Dinner","situation":"Dealing with Family Reactions","gpt_role":"Judgmental Relatives","option":"Holiday Gathering"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Leaving Partner","place":"Moving Truck","situation":"Packing Up Belongings","gpt_role":"Angry Ex","option":"Shared Apartment"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Presenter","place":"Conference hall","situation":"Giving a keynote speech at a tech conference","gpt_role":"Audience","option":"The projector malfunctions mid-presentation"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"University auditorium","situation":"Presenting a research paper on psychology","gpt_role":"Professor","option":"The professor interrupts with challenging questions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Sales executive","place":"Company boardroom","situation":"Pitching a new product to a client","gpt_role":"Potential client","option":"The client expresses concerns about the product''s price"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Community center","situation":"Presenting a proposal for a new community garden","gpt_role":"Local residents","option":"Some residents are skeptical about the proposal''s feasibility"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Campaign manager","place":"Political rally","situation":"Introducing a candidate running for governor","gpt_role":"Voters","option":"The candidate is running against a popular incumbent"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Aspiring Artist","place":"Art Studio","situation":"Starting a new painting project","gpt_role":"Experienced Art Teacher","option":"Choosing the right color palette"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Beginner Musician","place":"Music Store","situation":"Starting to learn a new instrument","gpt_role":"Professional Music Teacher","option":"Deciding on the type of instrument to learn"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Craft Enthusiast","place":"Craft Store","situation":"Starting a new DIY project","gpt_role":"Craft Store Owner","option":"Selecting the right materials"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Gardening Beginner","place":"Gardening Center","situation":"Starting a new garden project","gpt_role":"Expert Gardener","option":"Choosing the right plants for the soil and climate"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Cooking Enthusiast","place":"Kitchen","situation":"Starting a new recipe","gpt_role":"Professional Chef","option":"Selecting the right ingredients and tools"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Recent college graduate","place":"At home","situation":"Celebrating graduation","gpt_role":"Parent","option":"Opening graduation gifts"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Newly promoted employee","place":"At a restaurant","situation":"Celebrating promotion","gpt_role":"Boss","option":"Ordering a celebratory drink"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Marathon runner","place":"At a park","situation":"Celebrating finishing a marathon","gpt_role":"Friend","option":"Eating a post-race snack"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Musician","place":"At a concert venue","situation":"Celebrating signing a record deal","gpt_role":"Bandmate","option":"Playing a new song for the first time"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Artist","place":"At a museum","situation":"Celebrating a solo exhibition","gpt_role":"Curator","option":"Giving a tour of the exhibition"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Daughter","place":"At home","situation":"Mother is constantly criticizing my life choices","gpt_role":"Mother","option":"I have just announced my plans to pursue a career in the arts"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend","place":"At a restaurant","situation":"My friend keeps borrowing money and never pays me back","gpt_role":"Friend","option":"I am currently struggling financially"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Niece","place":"At a family gathering","situation":"My aunt keeps making inappropriate comments about my weight","gpt_role":"Aunt","option":"I have recently been diagnosed with a medical condition that causes weight gain"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Friend","place":"At a party","situation":"My friend is constantly interrupting me and talking over me","gpt_role":"Friend","option":"I am trying to share some exciting news about my new job"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Son","place":"At a family dinner","situation":"My father keeps pressuring me to take over the family business","gpt_role":"Father","option":"I have different career aspirations and want to pursue my own path"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Nervous person","place":"Coffee shop","situation":"First date","gpt_role":"Confident person","option":"It''s raining outside"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Shy person","place":"Restaurant","situation":"Blind date","gpt_role":"Outgoing person","option":"The restaurant is very busy"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Adventurous person","place":"Park","situation":"First date","gpt_role":"Romantic person","option":"There are a lot of people around"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Movie buff","place":"Movie theater","situation":"Blind date","gpt_role":"Casual moviegoer","option":"The movie is sold out"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Social drinker","place":"Bar","situation":"First date","gpt_role":"Non-drinker","option":"The bar is very loud"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Therapist''s office","situation":"Trying out cognitive behavioral therapy","gpt_role":"Therapist","option":"Discussing coping mechanisms for anxiety"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Virtual therapy session","situation":"Exploring art therapy","gpt_role":"Therapist","option":"Creating a painting to express emotions"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Participant","place":"Group therapy session","situation":"Participating in equine therapy","gpt_role":"Facilitator","option":"Interacting with horses to build trust and communication skills"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Online counseling session","situation":"Trying out hypnotherapy","gpt_role":"Therapist","option":"Visualizing a peaceful scene to reduce stress and anxiety"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Patient","place":"Mental health clinic","situation":"Attempting exposure therapy","gpt_role":"Psychiatrist","option":"Gradually facing fears of heights through virtual reality simulations"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Expectant Mother","place":"Hospital","situation":"Preparing for labor","gpt_role":"Nurse","option":"Choosing pain management options"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New Father","place":"Home","situation":"Welcoming the baby","gpt_role":"Midwife","option":"Deciding on home birth or hospital birth"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Expectant Parent","place":"Baby Store","situation":"Shopping for baby supplies","gpt_role":"Salesperson","option":"Choosing between cloth or disposable diapers"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"New Parent","place":"Pediatrician''s Office","situation":"Baby''s first check-up","gpt_role":"Doctor","option":"Discussing vaccination schedule"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Pregnant Sister","place":"Family Gathering","situation":"Announcing the pregnancy","gpt_role":"Grandmother","option":"Sharing baby names"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Tourist","place":"Tokyo, Japan","situation":"Exploring the city","gpt_role":"Local guide","option":"Visiting a traditional Japanese tea ceremony"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Exchange student","place":"Paris, France","situation":"Adjusting to a new culture","gpt_role":"French host family","option":"Attending a family dinner party"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Backpacker","place":"Rio de Janeiro, Brazil","situation":"Navigating the city''s street markets","gpt_role":"Local street vendor","option":"Haggling for souvenirs"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Business traveler","place":"Bangkok, Thailand","situation":"Negotiating a business deal","gpt_role":"Thai client","option":"Discussing cultural differences in business practices"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Archaeologist","place":"Cairo, Egypt","situation":"Exploring ancient ruins","gpt_role":"Local tour guide","option":"Translating hieroglyphics"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Unemployed person","place":"At home","situation":"Discussing job search strategies","gpt_role":"Career counselor","option":"Identifying transferable skills"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Recently laid-off employee","place":"In a coffee shop","situation":"Offering emotional support","gpt_role":"Friend","option":"Brainstorming new career paths"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Job seeker","place":"At a job fair","situation":"Networking and handing out resumes","gpt_role":"Employer representative","option":"Discussing available job openings"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Applicant","place":"In a job interview","situation":"Answering questions about previous employment","gpt_role":"Hiring manager","option":"Discussing reasons for job loss"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Unemployed person","place":"At a government employment office","situation":"Discussing job training programs","gpt_role":"Job placement specialist","option":"Reviewing job market trends"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Home Depot","situation":"Asking for advice on paint colors","gpt_role":"Store Associate","option":"I have a specific color scheme in mind"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Living Room","situation":"Discussing furniture layout","gpt_role":"Interior Designer","option":"I have a small space to work with"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Kitchen","situation":"Planning a kitchen remodel","gpt_role":"Contractor","option":"I want to add an island"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Bedroom","situation":"Choosing bedding and curtains","gpt_role":"Decorator","option":"I want a cozy and warm feel"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Homeowner","place":"Bathroom","situation":"Replacing the shower head","gpt_role":"Plumber","option":"I want a rain shower head"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Student","place":"Language school","situation":"Learning new vocabulary","gpt_role":"Teacher","option":"Using flashcards"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Participant","place":"Online course","situation":"Practicing pronunciation","gpt_role":"Instructor","option":"Recording and listening to audio"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Self-learner","place":"Library","situation":"Improving grammar","gpt_role":"Online tutor","option":"Taking quizzes and receiving feedback"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Conversation partner","place":"Café","situation":"Practicing speaking","gpt_role":"Language exchange partner","option":"Discussing current events"}');
    INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) VALUES (TOPIC_ID_SEQ.nextval, 'DIALOGUE', null, '{"my_role":"Volunteer","place":"Community center","situation":"Teaching English to immigrants","gpt_role":"ESL teacher","option":"Creating lesson plans and activities"}');
END;

-- 공지사항
BEGIN
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '웹사이트 이용안내에 대한 수정 사항', '앞으로 웹사이트에서 이용안내 페이지를 계속해서 업데이트할 예정입니다. 업데이트된 내용은 바로바로 확인하실 수 있습니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '서비스 향상을 위한 점검 공지', '서비스 향상을 위해 점검 작업이 있을 예정입니다. 작업 시간은 9시부터 11시까지입니다. 이용에 참고해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '여름 휴가 연장 안내', '여름 휴가 연장 안내입니다. 8월 말까지 휴가 연장이 가능합니다. 자세한 문의는 고객센터로 연락주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '신규 서비스 출시 안내', '신규 서비스 출시 안내입니다. A 서비스부터 D 서비스까지 총 4가지 서비스를 출시합니다. 자세한 내용은 메인페이지에서 확인하실 수 있습니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '수강신청 기간 연장 공지', '수강신청 기간이 연장됩니다. 이번 기회를 놓치지 마시고 원하는 과목을 수강하세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '온라인 결제 오류 안내', '일부 고객님들이 온라인 결제 시 오류가 발생했다는 문의가 있어 안내 드립니다. 확인 후 다시 시도해주시기 바랍니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '교육과정 변경 안내', '교육과정 변경 안내입니다. 변경된 교육과정을 반영하여 수업이 진행됩니다. 문의사항은 강의 담당자에게 문의 바랍니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '시스템 업데이트 안내', '시스템 업데이트를 진행합니다. 업데이트 기간 동안 일부 서비스에 제한이 있을 수 있습니다. 이용에 참고해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '서른번째 영어회화 대회 일정 공지', '서른번째 영어회화 대회 일정이 확정되었습니다. 참가를 원하시는 분들은 홈페이지에서 신청해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어학습 프로그램 업데이트 안내', '영어학습 프로그램이 업데이트 되었습니다. 사용 중인 회원님들은 최신 버전으로 업데이트해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '토익시험 정보 안내', '다가오는 토익시험에 관한 정보를 안내합니다. 시험 날짜와 장소 등 자세한 내용은 홈페이지를 참고해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어학습 캠프 참가 안내', '영어학습 캠프에 참가하시는 분들께 안내드립니다. 준비물 및 일정 관련 안내는 홈페이지에서 확인해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어교재 할인 이벤트 안내', '영어교재 할인 이벤트가 열리니 많은 이용 바랍니다. 이벤트 기간 동안 해당 상품을 구매하시면 10% 할인 혜택을 받으실 수 있습니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어학습 꿀팁 Q&A', '영어학습 꿀팁 Q&A 게시판을 면세점 시작합니다. 궁금하신 내용은 자유롭게 질문해주세요. 답변은 최대한 빠르게 드리도록 하겠습니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, 'TOEIC스코어 목표 설정하기', 'TOEIC스코어 목표 설정에 대한 팁을 공유합니다. 홈페이지에서 확인해주세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어회화반 새로운 강의 안내', '영어회화반 새로운 강의가 추가되었습니다. 회원님들께서는 마이페이지에서 확인하실 수 있습니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '스스로 학습하기 효과적인 방법', '스스로 학습하기 효과적인 방법을 공유합니다. 영어학습에 어려움을 겪는 분들께 도움이 되길 바랍니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어 단어 외우기 팁', '영어 단어 외우기 팁을 공유합니다. 효율적인 단어외우기법을 활용해 영어공부에 도움을 받아보세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어 화상회의 연습자료 안내', '영어 화상회의 연습자료를 안내해 드립니다. 효율적으로 회의를 진행하기 위한 영어 표현들을 제공합니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '미국식 발음 연습하기', '미국식 발음 연습하기에 도움이 되는 자료를 제공합니다. 발음 기초부터 실제 대화에 사용되는 발음 연습까지 다양한 자료를 제공합니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어번역 프로그램 추천', '영어번역 프로그램 추천을 드립니다. 영한, 한영 번역 및 발음까지 지원되는 프로그램으로, 영어공부에 큰 도움이 될 것입니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '회화 실력 높이는 방법', '회화 실력을 높이는 방법을 공유합니다. 홈페이지에서 꼭 확인하시길 바랍니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어 고난이도 문제 풀이 방법', '영어 고난이도 문제 풀이 방법을 알려드립니다. 단어 뜻 파악, 문장 구조 파악 등 다양한 팁을 제공합니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어회화 채팅 연습하기', '영어회화 채팅 연습에 도움이 되는 자료를 안내합니다. 기본적인 문장부터 지속적인 대화 연습까지 가능합니다.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어 암기 팁', '영어 암기 팁을 효과적으로 사용하시면 단어 암기 능력을 높일 수 있습니다. 지금 바로 확인하세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어책 추천', '영어책 추천을 드립니다. 다양한 장르의 영어책을 소개하고 있으니, 취향에 맞는 책을 골라보세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어로 일기 쓰기 연습하기', '영어로 일기 쓰기 연습은 자신의 영어 작문실력을 높이는 데 도움이 됩니다. 다양한 표현과 단어들을 배울 수 있으니 꼭 한번 시도해보세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어회화 취미반 신청 안내', '영어회화 취미반을 신청할 수 있는 기회가 열립니다. 취미와 함께 즐기는 영어회화 수업, 기회를 놓치지 마세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어 노래 가사 연습하기', '영어 노래 가사 연습은 발음향상과 영어문장 구사 능력을 높여줍니다. 다양한 노래 가사를 활용해 영어공부에 도전해보세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어정보 알림글', '영어공부와 관련된 다양한 정보를 알립니다. 홈페이지에서 확인해보세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    insert into BOARD_NOTICE (ID, USER_ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_HIT, NOTICE_WRITEDATE)
    values (BOARD_NOTICE_ID_SEQ.nextval, 1, '영어 회화 대화표현숙어 모음', '영어 회화 대화표현와 쉼표 등, 다양한 표현들을 쉽게 알아볼 수 있는 모음집입니다. 매일 조금씩 공부해보세요.', FLOOR(DBMS_RANDOM.VALUE(30, 300)), '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
END;

-- 문의사항 및 댓글

begin

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '사용 방법이 잘 이해가 안 돼요.', '보고 있는데 뭔가 어렵네요.', '2023-04-01', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '사용 방법이 잘 이해가 안 돼요.'), 1, '메인 페이지 및 자주 묻는 질문에 자세히 설명되어 있습니다. 감사합니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '오디오가 재생되지 않아요.', 'AI의 음성이 들리지 않습니다. 무슨 문제일까요?', '2023-04-03', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '오디오가 재생되지 않아요.'), 1, '오디오 재생이 되지 않을 경우, 사용하시는 브라우저를 버전으로 업데이트해주세요.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '문제가 너무 어려워요.', '학습 질문으로 주어지는 것들이 내용이 너무 어렵습니다.', '2023-04-04', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '문제가 너무 어려워요.'), 1, '죄송합니다. 아직 난이도 조절 기능은 제공되지 않고 있습니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '환불을 요청하고 싶어요.', '환불 받고싶은데, 혹시 환불 되나요?', '2023-04-12', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '환불을 요청하고 싶어요.'), 1, '환불을 원하실 경우, 고객센터로 전화 바랍니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '비밀번호를 분실했어요.', '비밀번호는 어떻게 찾을 수 있나요?', '2023-04-15', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '비밀번호를 분실했어요.'), 1, '비밀번호 분실 시, 회원가입 시 등록한 이메일 주소로 비밀번호를 재발급 해드립니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '회원정보', '회원 가입 후에 정보를 수정할 수 있나요?', '제 회원 정보를 수정하고 싶어요.', '2023-04-19', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '회원 가입 후에 정보를 수정할 수 있나요?'), 1, '네, 마이페이지에서 정보를 수정할 수 있습니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '회원정보', '회원 탈퇴를 하려면 어떻게 해야 하나요?', '회원 탈퇴를 하고싶어요.', '2023-04-20', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '회원 탈퇴를 하려면 어떻게 해야 하나요?'), 1, '마이페이지에서 회원 탈퇴 버튼을 클릭하고, 탈퇴 사유를 선택한 후 비밀번호를 입력하면 탈퇴가 가능합니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '회원정보', '회원 탈퇴 시 보유하고 있던 정보는 모두 삭제되나요?', '회원 탈퇴 시 보유하고 있던 정보는 모두 삭제되나요?', '2023-04-21', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '회원 탈퇴 시 보유하고 있던 정보는 모두 삭제되나요?'), 1, '네. 회원 탈퇴 시 모든 정보가 삭제됩니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '회원정보', '한 번 가입한 이메일을 다른 계정에서도 사용할 수 있나요?', '이메일 하나로 여러 계정을 사용하고 싶습니다.', '2023-04-22', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '한 번 가입한 이메일을 다른 계정에서도 사용할 수 있나요?'), 1, '아니요, 한 번 가입한 이메일은 다른 계정에서 사용할 수 없습니다.');

    insert into BOARD_QUESTION (ID, USER_ID, QUESTION_CATEGORY, QUESTION_TITLE, QUESTION_CONTENT, QUESTION_WRITEDATE, QUESTION_STATUS)
    values (BOARD_QUESTION_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '회원정보', '계정 도용이 의심될 때 어떻게 해야 하나요?', '누가 제 계정으로 학습을 하는 것 같아서 소름이 돋아요.', '2023-04-30', '1');
    insert into QUESTION_REPLY (ID, QUESTION_ID, USER_ID, QUESTION_REPLY_CONTENT)
    VALUES (QUESTION_REPLY_ID_SEQ.nextval, (select id from board_question where question_title like '계정 도용이 의심될 때 어떻게 해야 하나요?'), 1, '관리자에게 신고를 하거나, 마이페이지에서 비밀번호를 변경하시기 바랍니다.');

end;


-- 자주 묻는 질문
begin

    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '개명을 했는데 이름 변경은 어떻게 하나요?', 'GPTeacher에서는 회원관리하는데 있어 실명을 받지 않고 있기 때문에 추가로 수정하실 필요 없습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '비밀번호 수정은 어떻게 하나요?', '마이페이지 -> 계정관리 -> 비밀번호 변경에서 변경하실 수 있습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '아이디/비밀번호를 분실했어요', '로그인 페이지의 아이디 및 비밀번호 찾기를 이용해주시면 됩니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '인증메일이 오지 않아요', '이메일 주소를 확인해주시고, 스팸 메일함도 확인 바랍니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '회원탈퇴 시 개인정보는 언제 삭제되나요', '개인정보는 탈퇴 즉시 파기됩니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '회원 정보는 어디서 수정하나요?', '마이페이지 -> 계정관리 -> 회원 정보 조회/수정 변경에서 변경하실 수 있습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '계정관리', '회원 탈퇴는 어디서 하나요?', '마이페이지 -> 계정관리 -> 회원 탈퇴를 통해 탈퇴하실 수 있습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '글쓰기 연습은 어떻게 이용하나요?', '글쓰기 연습은 먼저 직접 주제를 입력하시거나 분야를 골라 GPT로부터 랜덤 주제를 출제받습니다. 이후 1500자 이내로 정답을 제출하시고, 교정본 출력과 문장별 분석을 통해 피드백을 받으실 수 있습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '말하기 연습은 어떻게 활용하나요?', '말하기 연습은 먼저 문제를 출제받고 싶은 시험을 선택하시고 GPT로투버 랜덤 주제를 출제받습니다. 이후 1분 내로 음성으로 정답을 제출하시고, 교정본 출력과 문장별 분석을 통해 피드백을 받으실 수 있습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습', '회화 연습은 어떻게 활용하나요?', '회화 연습은 직접 주제를 설정하시거나 랜덤 주제를 추천받아 GPT와 대화를 시작하실 수 있습니다. 사용자의 답변은 매 답변마다 실시간 분석되고, 대화도 자연스럽게 이어집니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습현황', '나의 문장은 어떻게 활용하나요?', '나의 문장은 학습했던 내용이 문장별로 확인할 수 있는 공간입니다. 좋아요 버튼과 북마크 버튼을 이용해 복습에 활용해보세요. 학습이력 찾기가 힘들다면 카테고리선택과 시간순서, 좋아요 표시를 활용해 좀 더 간편하게 찾을 수 있습니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습현황', '플래시카드는 무엇인가요?', '플래시 카드는 학습할 때 어려웠던 부분을 북마크에 담아뒀다면 확인할 수 있는 공간입니다. 이전에 학습한 내용이 있어야 활용할 수 있으니 평소 학습 시 어려웠던 부분은 북마크로 꼭 표시해두세요. ' ||
                                                                                                   '플래시카드 학습은 아래와 같은 순서로 진행됩니다. ' ||
                                                                                                   '<br> Step 1. 오늘 복습할 문장 수를 입력해주세요. ' ||
                                                                                                   '<br>Step 2. 주어진 Quesiton에 이전에 어떤 대답을 했는지 확인하고 your sentence에 고쳐야하는 점을 생각해보세요.' ||
                                                                                                   '<br>Step 3. 이전 단계에서 Your sentence를 보고 고쳐야할점을 찾았고 맞췄다면 문장 난이도에 맞춰 Again Hard Good Easy 버튼을 눌러 난이도를 입력해주세요. 다음 플래시카드 학습 시 난이도에 맞춰 일정 기간 후 다시 출제됩니다. ' ||
                                                                                                   '<br>Your sentence 우측에 위치한 마이크 버튼을 눌러 발음평가도 해보세요.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '학습현황', '회화 연습은 어떻게 활용하나요?', '회화 연습은 직접 주제를 설정하시거나 랜덤 주제를 추천받아 GPT와 대화를 시작하실 수 있습니다. 사용자의 답변은 매 답변마다 실시간 분석되고, 대화도 자연스럽게 이어집니다.');
    insert into BOARD_FAQ (ID, USER_ID, FAQ_CATEGORY, FAQ_TITLE, FAQ_CONTENT)
    values (BOARD_FAQ_ID_SEQ.nextval, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '나의활동', '북마크 기능은 무엇인가요?', '북마크는 커뮤니티 게시글에 제공되는 북마크기능을 활용하면 사용할 수 있는 공간입니다. 커뮤니티 게시글 중 마음에 들었던 게시글을 북마크 해두면 이 공간에서 확인할 수 있습니다. 북마크 해제 기능이 제공되니 불필요한 북마크된 게시글을 관리할 수 있습니다.');

end;



-- 신고 글

DECLARE
    post_info community_post%ROWTYPE;
    post_id NUMBER;
BEGIN

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '야이 바보들아!!',  '<p>메롱~</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '욕설', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '수익률 200% 보장 글로벌 노.리.터 카톡 abc123',  '<p>수익률 200% 보장 글로벌 노.리.터 카톡 abc123</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '토익 100점도 못 맞는 놈들 이해가 안가네 ㅉㅉ.. ㅋㅋ',  '<p>한심하다 한심해~</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '욕설', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '행운의 편지',  '이 편지는 영국에서 시작되어',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '좋은 사진 공유합니다 ㅎㅎ',  '(음란한 사진)',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '음란물', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '회화',  '저랑 일 하나 하실분(돈 급하신 분 환영)',  '카톡 abc 연락주세요~',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '불법', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '잼민이들 안녕~',  'ㅎㅇㅎㅇ',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '청소년유해', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '유머',  '야이 멍청아',  '멍청이들~ㅋㅋ',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '욕설', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '토익',  '이번 토익 답안지 유출됨 이거 한번씩 봐봐',  '<p>www.toiec유출.com 여기서 확인가능 ㄱㄱ</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '불법', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '토플',  '이번에 저희랑 같이 커닝할 멤버 구합니다.',  '<p>확실하게 컨닝할 방법이 있는데 인원이 부족하네요.두명 더 구합니다.</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '불법', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '시험',  '학생들에게 괜찮은 약 팔아봅니다.',  '<p>괜찮은 약인데 이거 먹으면 머리 맑아져서 시험을 잘 봅니다.</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '글쓰기',  '아 ㅁㅊ 글쓰기 왜이렇게 X같냐 짜증나게',  '<p>심한 욕설 문장</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '욕설', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '여기 말고 진짜 영어교육 사이트 알려준다.',  '<p>www.englishjjoa.com 여기가 진짜 영어사이트다 여기 버리고 일로 오삼</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '중고등학생들 전용 술집 위치 알려드립니다~',  '<p>서울시 중랑구에 괜찮은 곳 있습니다.카카오톡 suljoa 여기로 문의주세요.</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '청소년유해', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '토익',  '여기 토익 수레기네',  '<p>니들 사이트 이따구로 만들래??</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '욕설', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '여기 사이트 애들 만났는데 남자 여자 존잘존예더라 흐흐',  '<p>다 내 자취방에 불러서 이상한 짓 해야지 히히</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '음란물', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '말하기',  '말하기 ai기능 해킹할 건데 구경하실 분 계심?',  '<p>스트리밍으로 보여줄건데 보고싶음 댓글 달아봐 주소 보내줄게</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '불법', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '유머',  '음흉한 사이트 괜찮은 거 있는데 보여줄까?',  '<p>댓글 달면 내가 밑에 대댓글로 사이트 주소 보내드림</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '음란물', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '공부',  '마약 같은거 파는데 있나요?',  '<p>약 먹고 하루종일 공부에 집중하고 싶어요</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '불법', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '공부',  '여기 말고 괜찮은 영어 강사 있는데 소개해줌',  '<p>메카스토디에 OOO강사가 좀 쩔어 여기 버리고 일로 가자</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '일상',  '도박사이트 중에 괜찮은 곳하면 잉글리시bet이지~',  '<p>잉글리시bet.com 들어가서 유석유 추천인 해주면 좋은 결과 나올거야 ㅎㅎ</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

    SELECT COMMUNITY_POST_ID_SEQ.nextval into post_id from dual;
    INSERT INTO community_post (id, user_id, sentence_id, community_post_category, community_post_title, community_post_content, community_post_hit, community_post_like, COMMUNITY_POST_WRITEDATE)
    VALUES (post_id, FLOOR(DBMS_RANDOM.VALUE(2, 15)), null, '아이엘츠',  '아이엘츠용 강사 있는데 소개해줌',  '<p>메카스토디에 OOO강사가 좀 쩔어 여기 버리고 일로 가자</p>',  FLOOR(DBMS_RANDOM.VALUE(20, 151)), 0, '2023-04-' || LPAD(FLOOR(DBMS_RANDOM.VALUE(1, 30)), 2, '0'));
    SELECT * INTO post_info FROM COMMUNITY_POST WHERE id = post_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, post_info.user_id, 'COMMUNITY_POST', post_info.id, '스팸/광고', post_info.COMMUNITY_POST_WRITEDATE);

END;


-- 신고 댓글

DECLARE
    reply_info community_reply%ROWTYPE;
    post_info community_post%ROWTYPE;
    reply_id number;
BEGIN

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '한심하다 증말 ㅉㅉ.', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '욕설', reply_info.COMMUNITY_REPLY_WRITEDATE);

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '바보멍청이~', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '욕설', reply_info.COMMUNITY_REPLY_WRITEDATE);

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '혹시 가출 청소년이세요? 보금자리가 필요하시면 연락주세요.', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '청소년유해', reply_info.COMMUNITY_REPLY_WRITEDATE);

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '혹시 가출? 잘곳 필요하면 연락주세요.', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '청소년유해', reply_info.COMMUNITY_REPLY_WRITEDATE);

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '스타가 되고 싶으면 연락해', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '스팸/광고', reply_info.COMMUNITY_REPLY_WRITEDATE);

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '얘 또 헛소리하네', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '욕설', reply_info.COMMUNITY_REPLY_WRITEDATE);

    select COMMUNITY_REPLY_ID_SEQ.nextval into reply_id from dual;
    select * into post_info from (SELECT * FROM COMMUNITY_POST ORDER BY DBMS_RANDOM.RANDOM()) where rownum = 1;
    INSERT INTO COMMUNITY_REPLY (ID, COMMUNITY_POST_ID, COMMUNITY_REPLY_WRITEDATE, USER_ID, COMMUNITY_REPLY_CONTENT, COMMUNITY_REPLY_PARENTS_ID)
    VALUES (reply_id, post_info.id, post_info.community_post_writedate, FLOOR(DBMS_RANDOM.VALUE(2, 15)), '발 닦고 잠이나 자라', reply_id);
    select * into reply_info from community_reply where id = reply_id;
    insert into REPORT (ID, USER_ID, REPORT_SUBJECT, REPORT_SUBJECT_ID, REPORT_REASON, REPORT_DATE)
    VALUES (REPORT_ID_SEQ.nextval, reply_info.user_id, 'COMMUNITY_REPLY', reply_info.id, '욕설', reply_info.COMMUNITY_REPLY_WRITEDATE);
END;

commit;

