package com.olts.commons;

/**
 * Created by TCCCC on 2018/10/20/020.
 */
public class Dog  extends Animal{
    private  String   strain;

    public Dog(String nickName, int age, String strain) {
        super(nickName, age);
        this.strain = strain;
    }

    public String getStrain() {
        return strain;
    }

    public void setStrain(String strain) {
        this.strain = strain;
    }

    @Override
    public String toString() {
        return "Dog{" +
                "strain='" + strain + '\'' +
                '}';
    }

    @Override
    void bark() {
        System.out.println("我们一起学狗叫");
    }
}
