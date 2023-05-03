package com.sooaz.gpt.domain.mypage;

import com.sooaz.gpt.domain.community.CommunityPost;
import com.sooaz.gpt.domain.community.CommunityPostRepository;
import com.sooaz.gpt.domain.community.bookmark.Bookmark;
import com.sooaz.gpt.domain.community.bookmark.BookmarkRepository;
import com.sooaz.gpt.domain.community.communityreply.CommunityReply;
import com.sooaz.gpt.domain.community.communityreply.CommunityReplyRepository;
import com.sooaz.gpt.domain.community.communityreply.MyReplyDto;
import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningFindDto;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import com.sooaz.gpt.domain.mypage.sentence.SentenceUpdateDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class MypageService {
    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;
    private final CommunityPostRepository communityPostRepository;
    private final CommunityReplyRepository communityReplyRepository;
    private final BookmarkRepository bookmarkRepository;

    public List<Learning> getLearningList(LearningFindDto learningFindDto) {
        List<Learning> learnings = learningRepository.findByUserId(learningFindDto);

        ListIterator<Learning> iterator = learnings.listIterator();
        while(iterator.hasNext()) {
            Learning learning = iterator.next();
            List<Sentence> sentences = sentenceRepository.findAllByLearningId(learning.getId());
            int sentenceCount = sentences.size(); //0인 경우 -> 오류임으로 해당 learning 삭제해야할듯

            int sumAccuracy = 0;
            for (Sentence sentence : sentences) {
                Integer accuracy = sentence.getSentenceAccuracy();
                if (accuracy != null) {
                    sumAccuracy += accuracy;
                }
            }
            learning.setSentenceCount(sentenceCount);
            learning.setAverageAccuracy(sentenceCount != 0 ? Math.round(sumAccuracy/sentenceCount):0);

            // learningType 별 질문/상황을 Topic에 저장
            if(learning.getLearningType() == LearningType.DIALOGUE) {
                String learningTopic = learning.getLearningTopic();
                JSONObject learningTopicJson;
                try {
                    learningTopicJson = new JSONObject(learningTopic);
                } catch (Exception e) {
                    log.error("Learning topic data from database is not parsable for JSON, \n", e);
                    return null;
                }
                String getSituation = learningTopicJson.getString("situation");
                getSituation += " at the "+learningTopicJson.getString("place");
                learning.setLearningTopic(getSituation);
            }
        }
        return learnings;
    }

    public List<Sentence> getSentenceList(LearningFindDto learningFindDto) {
        List<Sentence> sentences = sentenceRepository.findByLearningId(learningFindDto);
        return sentences;
    }

    public void sm2Algorithm(int quality, Long sentenceId) {
        Sentence sentencePrev = sentenceRepository.findById(sentenceId).get();
        SentenceUpdateDto sentenceUpdateDto = new SentenceUpdateDto();

        int prevStep = sentencePrev.getSentenceRepetitionStep();
        double prevEF = sentencePrev.getSentenceEaseFactor();
        int prevInterval = sentencePrev.getSentenceInterval();

        sentenceUpdateDto.setSentenceId(sentenceId);
        if (quality == 0) {
            sentenceUpdateDto.setSentenceRepetitionStep(0);
            sentenceUpdateDto.setSentenceInterval(1);
            sentenceUpdateDto.setSentenceEaseFactor(prevEF);
        } else {
            // step에 따른 interval update
            if(prevStep == 0) {
                sentenceUpdateDto.setSentenceInterval(1);
            } else if(prevStep == 1) {
                sentenceUpdateDto.setSentenceInterval(2);
            } else if(prevStep >= 2) {
                sentenceUpdateDto.setSentenceInterval((int)(prevInterval * prevEF + 0.5)); // +0.5 to 반올림
            }

            // step update
            sentenceUpdateDto.setSentenceRepetitionStep(prevStep + 1);

            //ef update
            double EF = prevEF + (0.1 - (3 - quality) * (0.08 + (3 - quality) * 0.02));
            if (EF < 1.3) {
                EF = 1.3;
            } else if (EF > 2.5) {
                EF = 2.5;
            }
            sentenceUpdateDto.setSentenceEaseFactor(EF);
        }
        sentenceRepository.update(sentenceUpdateDto);
    }

    public List<CommunityPost> getPostList(Long userId) {
        List<CommunityPost> communities = communityPostRepository.findByUserId(userId);
        return communities;
    }

    public List<CommunityPost> getBookmarkList(Long userId) {
        List<CommunityPost> communities = communityPostRepository.findBookmarksByUserId(userId);
        return communities;
    }

    public List<MyReplyDto> getMyCommentList(Long userId) {
        List<CommunityReply> communityReplies = communityReplyRepository.findByUserId(userId);
        List<MyReplyDto> myReplyDtos = new ArrayList<MyReplyDto>();

        for (CommunityReply communityReply : communityReplies) {
            MyReplyDto myReplyDto = new MyReplyDto();

            Long communityPostId = communityReply.getCommunityPostId();
            myReplyDto.setId(communityReply.getId());
            myReplyDto.setCommunityPostId(communityPostId);
            myReplyDto.setCommunityReplyContent(communityReply.getCommunityReplyContent());
            myReplyDto.setCommunityReplyWritedate(communityReply.getCommunityReplyWritedate());

            CommunityPost communityPost = communityPostRepository.findById(communityPostId).get();
            myReplyDto.setCommunityPostTitle(communityPost.getCommunityPostTitle());
            myReplyDtos.add(myReplyDto);
        }
        return myReplyDtos;
    }

    public void deletePostsById(List<Long> postIds) {
        for(Long id : postIds) {
            communityPostRepository.delete(id);
        }
    }

    public void deleteCommentsById(List<Long> commentIds) {
        for(Long id : commentIds) {
            communityReplyRepository.delete(id);
        }
    }

    public void deleteCommentsByPostId(List<Long> communityPostId) {
        for(Long id : communityPostId) {
            communityReplyRepository.deleteByPostId(id);
        }
    }

    public void deleteBookmarks(List<Long> postIds, Long userId) {
        for(Long id : postIds) {
            Bookmark bookmark = new Bookmark();
            bookmark.setCommunityPostId(id);
            bookmark.setUserId(userId);
            bookmarkRepository.delete(bookmark);
        }
    }

    public JSONArray getCalendarHeatmapData(Long userId) {
        JSONArray learningCountByDateData = new JSONArray();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar end = Calendar.getInstance(); //현재 날짜
        Calendar start = Calendar.getInstance(); //1년 전 날짜

        end.setTime(new Date());
        start.add(end.YEAR, -1);

        try {
            while(!start.after(end)) {
                String date = dateFormat.format(start.getTime());
                int total = learningRepository.countByLearningDate(userId, date);
                JSONObject oneDayLearning = new JSONObject();
                oneDayLearning.put("date", date);
                oneDayLearning.put("total", total);
                learningCountByDateData.put(oneDayLearning);
                start.add(Calendar.DATE, 1);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return learningCountByDateData;
    }
}
