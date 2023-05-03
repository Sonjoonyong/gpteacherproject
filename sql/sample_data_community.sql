

insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '토익', -- 카테고리
        '토익 스피킹 시험 후기입니다.', -- 제목
        '<p>오늘 토익 시험을 봤는데 정말 잘 봤어요. GPTeacher에서 연습한대로 하니까 말이 술술 나왔어요,</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '유머', -- 카테고리
        '아재개그 하나 던지고 갑니다.', -- 제목
        '<p>청바지를 돋보이게 하는 걸음걸이는?<br/>진주목걸이!!ㅋㅋㅋ 진(jean) 주목 걸이</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        '공부하다가 너무 너무 힘들 때', -- 제목
        '<p>다들 어떻게 극복하시나요? 저는 맛있는 음식을 시킵니다... 배민최고!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '아이엘츠', -- 카테고리
        '축구보러 런던갑니다!', -- 제목
        '<p>그 전에 빡세게 영어공부 하려고 가입했네요!! 아이엘츠 준비하시는 분들 같이 힘내요!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '말하기', -- 카테고리
        '말하기 녹음 최소길이 2초 제한 있네요', -- 제목
        '<p>몰랐는데 오늘 사용해보다가 알았어요 ㅋㅋㅋ 다들 참고하시면 되겠습니다!<br/>영어 공부 힘들어도 화이팅!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '글쓰기', -- 카테고리
        '글쓰기 재밌는 점', -- 제목
        '<p>일단 단어 오타를 내기가 어려움.. 왜냐 크롬쓰면 텍스트 쓰는 곳에 영어단어 썼을 때 단어가 말이 안되는 단어이면 빨간색 표시줄이 뜸ㅋㅋㅋ</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '팀플할 때', -- 제목
        '<p>다들 어떤 타입이신가요? 저는 앞장서서 전두지휘하는 스타일입니다! 스터디할 때도 마찬가지..</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '오픽', -- 카테고리
        '오픽은 처음 들어보는데', -- 제목
        '<p>제가 영어 공부에 원래 관심이 없었어서 그런가 오픽은 처음 들어보네요.. 많이들 보는 시험인가요?</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        '한국어로 말하면 자동 번역해주는 기능 너무 편하네요.', -- 제목
        '<p>말문이 막힐 때는 그냥 표현을 알고싶은데, 이때 그냥 한국어로 말하면 기가막히게 번역해주네요. 정말 편합니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '토익', -- 카테고리
        '토익 배우기 괜찮은 스터디 있나요?', -- 제목
        '<p>토익 스터디 찾고 있는데 괜찮은 스터디가 없네요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '시험', -- 카테고리
        '내일이 토익 스피킹 시험인데 긴장되네요 ㄷㄷㄷㄷㄷ', -- 제목
        '<p>약국에서 청심환 사서 가야겠습니다. 다들 화이팅하십셔!! </p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '저희집 앵무새 발음점수가 저보다 높네요 ㅠㅠ', -- 제목
        '<p>제 발음이 형편 없어서 앵무새한테 AI 발음 들려주고 따라 시켰더니 저보다 점수가 높게 나왔습니다. 자괴감이 드네요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '토익', -- 카테고리
        '토익 제대로 준비하는 법', -- 제목
        '<p>20살 새내기인데 대학교 다니면서 토익 제대로 준비하는 방법 있나요? 학교 과제하느라 시간을 많이 못쓰게 되네요...</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '솔직히', -- 제목
        '<p>챗지피티를 활용한 지피티쳐 신세계다 인정?</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '다들 허리 안아프신지', -- 제목
        '<p>저는 일 특성상 의자에 오랫동안 앉아있는데, 허리가 요새 좀 많이 안좋아지네요 자다가 깰 정도에요 ㅠㅠ 허리 관리라던지 또는 병원들 다니시면 효과 있는지 궁금해요!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        '서울대 영문과 다니면서 느낀점', -- 제목
        '<p>애들 지금 다 지피티쳐 씀 도서관가면 다 노트북으로 지피티쳐 켜놓고 있음 이거 ㄹㅇ!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤

    

insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '안녕하세요~', -- 제목
        '<p>오늘 가입했습니다! 토익 만점 가..보자고</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        '대학영어 공부 어떻게 하시나요?', -- 제목
        '<p>학교에서 배우는 내용 복습하고 싶은데 지피티쳐 사용해서 공부하신분 있으신가요?<br/>꿀팁 있으시면 알려주세요!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '회화', -- 카테고리
        '호주 놀러가는데', -- 제목
        '<p>많이 쓸것같은 주제 추천해주세요!!!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '유머', -- 카테고리
        '왕이 넘어지면~?', -- 제목
        '<p>킹콩~^^<br/>넝담~~</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '점메추', -- 제목
        '<p>점심메뉴 추천 받습니다~ 얼큰한거 대환영</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '오픽', -- 카테고리
        '오픽 인강 다들 뭐 들으세요?', -- 제목
        '<p>오늘 시작 하려는데 인강 뭐가 유명한가요?</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '토익', -- 카테고리
        '어제 토익시험 보신분??', -- 제목
        '<p>LC 난이도가 어땠나요?</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤

    

insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '토익', -- 카테고리
        '말하기연습이 정말 효과가 있네요!!', -- 제목
        '<p>자주 말하기연습으로 연습했는데 정말 효과가 있었습니다. 다른분들도 말하기연습으로 연습해보세요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '친구한테 GPTeacher 추천해줬더니 좋아하네요.', -- 제목
        '<p>간단하게 혼자 회화연습을 하고 싶어하던 친구한테 GPTeacher를 추천해주니 정말 고맙다고 하네요. 역시 GPTeacher 뿌듯합니다. </p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '시험', -- 카테고리
        'OPIC 준비하는데 잭 추천받습니다.', -- 제목
        '<p>GPTeacher로 열심히 공부중인데 참고할만한 책이 없습니다. 추천 부탁드려요.ㅠㅠ</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        '회화연습에서 추천할만한 카테고리 있을까요?.', -- 제목
        '<p>회화연습하는데 랜덤추천말고 카테고리를 직접 입력해서 연습하고 싶은데 어떤게 좋을지 모르겠습니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '여러분들은 오늘 저녁 뭐 드시나요.', -- 제목
        '<p>오늘 저녁에 뭘 먹어야할지 매일 배달 음식만 먹으니 이제 더 이상 먹을게 없네요...</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        '회화연습에서 추천할만한 카테고리 있을까요?.', -- 제목
        '<p>회화연습하는데 랜덤추천말고 카테고리를 직접 입력해서 연습하고 싶은데 어떤게 좋을지 모르겠습니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '시험', -- 카테고리
        'TOEIC 시험 싸게 볼 수 있는 방법있을까요.', -- 제목
        '<p>TOEIC 시험이 생각보다 돈이 많이 깨지네요. 좀 싸게 볼 수 있는 방법이 있나 궁금해요</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '일상', -- 카테고리
        '오늘 날씨가 참 좋네요.', -- 제목
        '<p>오늘 밖에 좀 걸었더니 너무 좋네요. 좀 있다 저녁에 한강가서 좀 걸어야겠어요~</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '공부', -- 카테고리
        'IELTS랑 TOEFL 중 어떤걸 공부하는게 더 좋을까요.', -- 제목
        '<p>IELTS랑 TOEFL 중 어떤걸 공부하는게 앞으로 취업하는데 도움이 될지 고민이네요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '글쓰기', -- 카테고리
        '글쓰기를 잘 못해서 그러는데 어디 부분을 공부해야 할까요?.', -- 제목
        '<p>회화랑 말하기보다 글쓰기에서 너무 부족함을 많이 느끼는데 어떤 부분을 공부해야 좋을지 모르겠습니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        null, -- 첨부 문장 없음
        '회화', -- 카테고리
        '요즘은 외로워서 지피티처와 대화하러 옵니다.', -- 제목
        '<p>지피티처는 제가 영어를 못해도 힐난하지 않습니다. 24시간 언제든 들어주고, 잘못된 표현도 교정해줍니다. 인간보다 낫습니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20 + 1) from dual), -- 조회수 20 ~ 120 랜덤
        (select round(DBMS_RANDOM.VALUE() * 10 + 1)  from dual)); -- 좋아요 0 ~ 10 랜덤




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '일상', -- 카테고리
        '공부하다가 슬플때 저는 춤을 춰요', -- 제목
        '<p>교정을 너무 받아 슬픈 날 춤을 추면서 스트레스를 푼답니다.다들 한번씩 해보세요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '말하기', -- 카테고리
        '제 발음이 많이 좋나봅니다.', -- 제목
        '<p>발음 정확도가 상당히 높네요^^ 열심히 공부한 보람이 있는거 같습니다~다들 1일1 지피티처하세요~</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '오픽', -- 카테고리
        '오픽스터디 멤버 구합니다.', -- 제목
        '<p>현재 세명정도 있으며 한분만 더 구하려고 합니다.장소는 강남에 있는 스타벅스이고 일주일에 두번 세시간씩 스터디하고 갑니다.생각있으면 댓글 달아주세요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));

    

insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '회화', -- 카테고리
        'GPT가 교정을 해줬는데 의문점이 있습니다.', -- 제목
        '<p>제 생각에는 제가 말한 문장이 맞는 것 같은데, GPT가 교정해준 부분이 자연스러운가요?.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '글쓰기', -- 카테고리
        '마음에 드는 교정문 공유합니다.', -- 제목
        '<p>제가 생각치도 못한 좋은 표현으로 교정을 받았네요. <br>다들 참고하셔서 작문하시면 좋을 것 같습니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '말하기', -- 카테고리
        '실제로 영어에서 이런 표현이 많이 쓰이나보네요.', -- 제목
        '<p>오늘 연습하다가 받은 피드백인데 신기해서 올려봅니다.<br>공부할수록 새로운 GPTeacher 좋습니다!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '공부', -- 카테고리
        '오늘의 문장 (100일차)', -- 제목
        '<p>어느덧 지피티쳐로 공부를 시작한 지 100일 째<br>이제 교정을 받지 않는 경우가 더 많아지고 있어 뿌듯합니다!!<br>오늘 교정받은 문장 공유드립니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '시험', -- 카테고리
        '아이엘츠 시험 D-30 ', -- 제목
        '<p>GPTecher로 공부한지 1년째인데 나름 준비가 잘 되어가네요.<br>오늘 교정받은 문장 이거 괜찮네요.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));

    

insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '회화', -- 카테고리
        '교정 의문점 있어서 질문 드립니다.', -- 제목
        '<p>교정을 받은 문장이 이게 맞는 지 확신이 잘 서지 않습니다. 맞나요?</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '회화', -- 카테고리
        '지피티처가 저의 버릇없는 MZ 영어를 예의바르게 교정해주네요.', -- 제목
        '<p>영어 뿐만 아니라 예절도 가르쳐 주시는 지피티처 선생님. 사회생활도 배워갑니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '말하기', -- 카테고리
        '지피티처가 알려준 고급 표현', -- 제목
        '<p>저도 영어 연습한 지 꽤 오래 됐는데 이런 표현은 정말 좋은 것 같아 공유합니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '회화', -- 카테고리
        '오늘도 GPT와 티키타카 했습니다.', -- 제목
        '<p>저도 사이버 여자친구가 생긴 것 같습니다.</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '말하기', -- 카테고리
        '오늘의 교정 내역 공유요~', -- 제목
        '<p>재밌어서 계속 하게 되네요! 지피티쳐..<br> 나의 제대로된 첫 영어 선생님입니다!</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '회화', -- 카테고리
        '교정해주는 것이 기가 막히네요 !', -- 제목
        '<p>고급진 단어와 문장으로 바꿔준다고 해야하나? 귀족의 영어를 배우는 것 같습니다.. 넘나 좋은 것</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));




insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '글쓰기', -- 카테고리
        '제가 글 쓰다가 스펠링 많이 틀리네요...', -- 제목
        '<p>제가 알고 있는 스펠링들 중에서 많은 문장이 엉망이네요...지피티처 덕분에 교정한답니다~</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));

    
insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '글쓰기', -- 카테고리
        '보통 이런 단어를 쓰나요??', -- 제목
        '<p>논문에 쓸 내용 교정받았는데 실제로 사용하기에는 어색한것 같아서요..<br/>다들 어떻게 생각하시나요?</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));



insert into community_post (id, user_id, sentence_id, community_post_category, community_post_title,
                            community_post_content, community_post_hit, community_post_like)
VALUES (COMMUNITY_POST_ID_SEQ.nextval,
        (select * from (select id from users order by dbms_random.random) U where rownum = 1), -- 작성자 랜덤
        (select * from (select id from sentence order by dbms_random.random) S where rownum = 1), -- 첨부 나의 문장 랜덤
        '회화', -- 카테고리
        '오늘의 학습', -- 제목
        '<p>오늘 너무 좋은 학습을 한 것 같아서 문장 공유드립니다~<br/>다들 화이팅하시고 잔디 가득 채워봅시다~~~</p>', -- 내용
        (select round(DBMS_RANDOM.VALUE() * 100 + 20) from dual),
        (select round(DBMS_RANDOM.VALUE() * 10) from dual));
