package com.lanqiao.vo;

/**
 * Created by TCCCC on 2018/10/17/017.
 */
public class Test {
    public static void main(String[] args) {
        String s = "avfcz";
        char[] chars = s.toCharArray();
        for (int i = chars.length-1; i >=0; i--) {
            System.out.print(chars[i]);
        }
    }
}
