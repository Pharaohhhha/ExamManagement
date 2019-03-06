package com.olts.vo;


import java.io.Serializable;
import java.sql.Date;

public class OltsUser implements Serializable{
    private Integer id;
    private String stu_no;
    private String id_card_no;
    private String user_name;
    private String pass_word;
    private String mobile;
    private String home_tel;
    private String home_addr;
    private String sch_addr;
    private String qq;
    private String email;
    private Integer user_type;
    private String gender;
    private Date birthday;
    private String nation_place;
    private String marjor;
    private String edu_Background;
    private String graduate_School;

    public OltsUser() {
    }

    public OltsUser(Integer id, String stu_no, String id_card_no, String user_name, String pass_word, String mobile, String home_tel, String home_addr, String sch_addr, String qq, String email, Integer user_type, String gender, Date birthday, String nation_place, String marjor, String edu_Background, String graduate_School) {
        this.id = id;
        this.stu_no = stu_no;
        this.id_card_no = id_card_no;
        this.user_name = user_name;
        this.pass_word = pass_word;
        this.mobile = mobile;
        this.home_tel = home_tel;
        this.home_addr = home_addr;
        this.sch_addr = sch_addr;
        this.qq = qq;
        this.email = email;
        this.user_type = user_type;
        this.gender = gender;
        this.birthday = birthday;
        this.nation_place = nation_place;
        this.marjor = marjor;
        this.edu_Background = edu_Background;
        this.graduate_School = graduate_School;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStu_no() {
        return stu_no;
    }

    public void setStu_no(String stu_no) {
        this.stu_no = stu_no;
    }

    public String getId_card_no() {
        return id_card_no;
    }

    public void setId_card_no(String id_card_no) {
        this.id_card_no = id_card_no;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPass_word() {
        return pass_word;
    }

    public void setPass_word(String pass_word) {
        this.pass_word = pass_word;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getHome_tel() {
        return home_tel;
    }

    public void setHome_tel(String home_tel) {
        this.home_tel = home_tel;
    }

    public String getHome_addr() {
        return home_addr;
    }

    public void setHome_addr(String home_addr) {
        this.home_addr = home_addr;
    }

    public String getSch_addr() {
        return sch_addr;
    }

    public void setSch_addr(String sch_addr) {
        this.sch_addr = sch_addr;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getUser_type() {
        return user_type;
    }

    public void setUser_type(Integer user_type) {
        this.user_type = user_type;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getNation_place() {
        return nation_place;
    }

    public void setNation_place(String nation_place) {
        this.nation_place = nation_place;
    }

    public String getMarjor() {
        return marjor;
    }

    public void setMarjor(String marjor) {
        this.marjor = marjor;
    }

    public String getEdu_Background() {
        return edu_Background;
    }

    public void setEdu_Background(String edu_Background) {
        this.edu_Background = edu_Background;
    }

    public String getGraduate_School() {
        return graduate_School;
    }

    public void setGraduate_School(String graduate_School) {
        this.graduate_School = graduate_School;
    }

    @Override
    public String toString() {
        return "OltsUser{" +
                "id=" + id +
                ", stu_no='" + stu_no + '\'' +
                ", id_card_no='" + id_card_no + '\'' +
                ", user_name='" + user_name + '\'' +
                ", pass_word='" + pass_word + '\'' +
                ", mobile='" + mobile + '\'' +
                ", home_tel='" + home_tel + '\'' +
                ", home_addr='" + home_addr + '\'' +
                ", sch_addr='" + sch_addr + '\'' +
                ", qq='" + qq + '\'' +
                ", email='" + email + '\'' +
                ", user_type=" + user_type +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", nation_place='" + nation_place + '\'' +
                ", marjor='" + marjor + '\'' +
                ", edu_Background='" + edu_Background + '\'' +
                ", graduate_School='" + graduate_School + '\'' +
                '}';
    }
}
