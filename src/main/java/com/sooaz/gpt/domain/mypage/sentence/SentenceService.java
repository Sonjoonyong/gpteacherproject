package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.learning.PerspectiveClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SentenceService {

    private final SentenceRepository sentenceRepository;

    public char updateStatus(Long sentenceId, String type) {
        char currentStatus = getStatus(sentenceId, type); // like or flashcardId의 현재 상태 구하기

        //sentenceUpdateDto 객체 생성 & 초기화
        SentenceUpdateDto sentenceUpdateDto = new SentenceUpdateDto();
        sentenceUpdateDto.setSentenceId(sentenceId);

        if (type.equals("like")) {
            if (currentStatus == '0') { //status change
                sentenceUpdateDto.setSentenceLike('1');
            } else {
                sentenceUpdateDto.setSentenceLike('0');
            }

        } else if (type.equals("storage")) {
            if (currentStatus == '0') {
                sentenceUpdateDto.setFlashcardId(1L); // TODO - 임시 flashcardId = 1
            } else {
                sentenceUpdateDto.setFlashcardId(-2L); //-2가 id로 들어오면 null로 update
            }
        }

        //sentence DB 업데이트
        sentenceRepository.update(sentenceUpdateDto);
        return getStatus(sentenceId, type);
    }

    private char getStatus(Long sentenceId, String type) {
        Sentence sentence = sentenceRepository.findById(sentenceId)
                .orElseThrow(IllegalStateException::new);
        char result = ' ';

        if (type.equals("like")) {
            result = sentence.getSentenceLike(); //객체의 현재 like 반환
        } else if (type.equals("storage")) {
            Long flashcardId = sentence.getFlashcardId(); //객체의 현재 flashcardId 반환
            if (flashcardId==null) {
                result = '0';
            } else {
                result = '1';
            }
        }
        return result;
    }
}
