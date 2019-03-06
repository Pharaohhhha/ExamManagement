package com.olts.commons;

/**
 * Created by TCCCC on 2018/10/20/020.
 */
public abstract class Animal {
    private  String  nickName;
    private  int     age;

    abstract  void  bark();
    public Animal(String nickName, int age) {
        this.nickName = nickName;
        this.age = age;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Animal{" +
                "nickName='" + nickName + '\'' +
                ", age=" + age +
                '}';
    }
}



