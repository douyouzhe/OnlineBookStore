package com.obs.domain;

public class Review {
    private String text;

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getText() {

        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    private int score;


}
