package com.sooaz.gpt.domain.learning.writing;

public class WritingDto {
    private int id;
    private int learningId;
    private String sentenceQuestion;
    private String sentenceAnswer;
    private String sentenceCorrected;
    private String sentenceExplanation;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLearningId() {
        return learningId;
    }

    public void setLearningId(int learningId) {
        this.learningId = learningId;
    }

    public String getSentenceQuestion() {
        return sentenceQuestion;
    }

    public void setSentenceQuestion(String sentenceQuestion) {
        this.sentenceQuestion = sentenceQuestion;
    }

    public String getSentenceAnswer() {
        return sentenceAnswer;
    }

    public void setSentenceAnswer(String sentenceAnswer) {
        this.sentenceAnswer = sentenceAnswer;
    }

    public String getSentenceCorrected() {
        return sentenceCorrected;
    }

    public void setSentenceCorrected(String sentenceCorrected) {
        this.sentenceCorrected = sentenceCorrected;
    }

    public String getSentenceExplanation() {
        return sentenceExplanation;
    }

    public void setSentenceExplanation(String sentenceExplanation) {
        this.sentenceExplanation = sentenceExplanation;
    }
}
