package com.sooaz.gpt.domain.learning.speaking;

import lombok.Data;

@Data
public class SpeakingDTO {
    private String TOPIC;

    public String getImageButton() {
        return TOPIC;
    }

    public void setImageButton(String TOPIC) {
        this.TOPIC = TOPIC;
    }
}
