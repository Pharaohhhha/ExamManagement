package com.olts.commons;

import java.util.Scanner;

/**
 * Created by TCCCC on 2018/11/4/004.
 */
public class As {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String big = "abcdefghiabzzzabccc";
        String small ="ab";
        char[] chBig = big.toCharArray();
        int count = 0;
        String nwe = "";
        for (int i = 0; i < chBig.length - small.length(); i++) {
            nwe = "";
           for(int j=0;j<small.length();j++){
               nwe+=chBig[i+j];
           }
            if (nwe.equals(small)) {
                count++;
            }
        }
        System.out.println("共出现" + count + "次");
    }
}

