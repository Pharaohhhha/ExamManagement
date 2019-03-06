package com.olts.vo;

import java.util.Date;

/**
 * Created by Administrator on 2018/10/7.
 */
public class FspQuestions {
    private Integer id;
    private String question;
    private String stdAnswer;
    private Integer questionType;
    private Integer techCateId;
    private Date pubdate;
    private String descrpt;
    private Integer pageNum;

    public FspQuestions() {
    }

    public FspQuestions(Integer id, String question, String stdAnswer, Integer questionType, Integer techCateId, Date pubdate, String descrpt, Integer pageNum) {
        this.id = id;
        this.question = question;
        this.stdAnswer = stdAnswer;
        this.questionType = questionType;
        this.techCateId = techCateId;
        this.pubdate = pubdate;
        this.descrpt = descrpt;
        this.pageNum = pageNum;
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

    public String getStdAnswer() {
        return stdAnswer;
    }

    public void setStdAnswer(String stdAnswer) {
        this.stdAnswer = stdAnswer;
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

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    @Override
    public String toString() {
        return "FspQuestions{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", stdAnswer='" + stdAnswer + '\'' +
                ", questionType=" + questionType +
                ", techCateId=" + techCateId +
                ", pubdate=" + pubdate +
                ", descrpt='" + descrpt + '\'' +
                ", pageNum=" + pageNum +
                '}';
    }
}
