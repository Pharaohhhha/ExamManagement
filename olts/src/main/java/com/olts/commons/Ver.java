package com.olts.commons;

import java.util.Scanner;

/**
 * Created by TCCCC on 2018/10/20/020.
 */
public class Ver {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入：00");
        String next = scanner.next();
        char[] chars = next.toCharArray();
        for(int i=chars.length-1;i>=0;i--){
            System.out.print(chars[i]);
        }
    }
}
