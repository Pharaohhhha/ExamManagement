package com.olts.commons;

/**
 * Created by TCCCC on 2018/11/4/004.
 */
public class Test2 {
    public static void main(String[] args) {
        int a = 0, b = 0, c = 0,d=0;
        int tem;
        String str = "abcdABCD 123-0-=";
        char[] ch = str.toCharArray();
        for (int i = 0; i < ch.length; i++) {
            tem=ch[i];
            if (tem == 32) {
                a++;
            } else if(tem>=65&&tem<=90||tem>=97&&tem<120){
                b++;
            } else if(tem>=48&&tem<=57){
                c++;
            }else{d++;}
        }System.out.println("空格数："+a);
        System.out.println("字母数："+b);
        System.out.println("数字数："+c);
        System.out.println("其他字符"+d);
    }
}
