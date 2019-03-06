package com.olts.vo;


import java.util.Date;

/**
 * Created by Administrator on 2018/10/7.
 */
public class SmdQuestions {
    private Integer id;
    private String question;
    private String correct;
    private Integer questionType;
    private Integer techCateId;
    private String descrpt;
    private Date pubdate;

    private SmdOptions options;
    private TechCategory tCategory;

    public SmdQuestions() {
    }

    public SmdQuestions(Integer id, String question, String correct, Integer questionType, Integer techCateId, String descrpt, Date pubdate) {
        this.id = id;
        this.question = question;
        this.correct = correct;
        this.questionType = questionType;
        this.techCateId = techCateId;
        this.descrpt = descrpt;
        this.pubdate = pubdate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getCorrect() {
        return correct;
    }

    public void setCorrect(String correct) {
        this.correct = correct;
    }

    public Integer getQuestionType() {
        return questionType;
    }

    public void setQuestionType(Integer questionType) {
        this.questionType = questionType;
    }

    public Integer getTechCateId() {
        return techCateId;
    }

    public void setTechCateId(Integer techCateId) {
        this.techCateId = techCateId;
    }

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public SmdOptions getOptions() {
        return options;
    }

    public void setOptions(SmdOptions options) {
        this.options = options;
    }

    public TechCategory gettCategory() {
        return tCategory;
    }

    public void settCategory(TechCategory tCategory) {
        this.tCategory = tCategory;
    }

    @Override
    public String toString() {
        return "SmdQuestions{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", correct='" + correct + '\'' +
                ", questionType=" + questionType +
                ", techCateId=" + techCateId +
                ", descrpt='" + descrpt + '\'' +
                ", pubdate=" + pubdate +
                '}';
    }
}
