package com.olts.commons;

/**
 * Created by TCCCC on 2018/10/20/020.
 */
public class Man {
    void play(Animal animal){
        System.out.println("和"+animal.getNickName()+"玩时");
       animal.bark();
    }

    public static void main(String[] args) {
        Animal animal = new Cat("小猫", 18, 6);
        Man man = new Man();
        man.play(animal);
    }
}
