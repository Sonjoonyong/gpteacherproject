package com.sooaz.gpt.domain.mypage;

import com.sooaz.gpt.domain.community.Community;
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
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

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

    public List<Community> getPostList(Long userId) {
        List<Community> communities = communityPostRepository.findByUserId(userId);
        return communities;
    }

    public List<Community> getBookmarkList(Long userId) {
        List<Community> communities = communityPostRepository.findBookmarksByUserId(userId);
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

            Community community = communityPostRepository.findById(communityPostId).get();
            myReplyDto.setCommunityPostTitle(community.getCommunityPostTitle());
            myReplyDtos.add(myReplyDto);
        }
        return myReplyDtos;
    }

    public void deletePostsById(List<Long> postIds) {
        for(Long id : postIds) {
            communityPostRepository.deleteById(id);
        }
    }

    public void deleteCommentsById(List<Long> commentIds) {
        for(Long id : commentIds) {
            communityReplyRepository.delete(id);
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

}
