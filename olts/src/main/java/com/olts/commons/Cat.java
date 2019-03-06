package com.olts.commons;

/**
 * Created by TCCCC on 2018/10/20/020.
 */
public class Cat extends Animal{
    private  int age1;

    public Cat(String nickName, int age, int age1) {
        super(nickName, age);
        this.age1 = age1;
    }

    @Override
    public int getAge() {
        return age1;
    }

    @Override
    public void setAge(int age) {
        this.age1 = age;
    }

    @Override
    public String toString() {
        return "Cat{" +
                "age=" + age1 +
                '}';
    }

    @Override
    void bark() {
        System.out.println("我们一起学猫叫");
    }
}
