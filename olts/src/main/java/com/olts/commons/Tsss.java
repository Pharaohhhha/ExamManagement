package com.olts.commons;

import java.util.Scanner;

/**
 * Created by TCCCC on 2018/11/4/004.
 */
public class Tsss {
    public static void main(String[] args) {
            System.out.print("请输入正整数:");
            Scanner in = new Scanner(System.in);
            int num = Integer.parseInt(in.nextLine());
            //逻辑
            int sum=0;
            for(int n=1;n<num;n++) {
                for(int i=n+1;i<num;i++) {
                    sum=addNum(i,n);
			if(sum==num) {
				System.out.println(sum+"="+splicStr(i,n));
			 }
                }
            }
        }
        public static int addNum(int n,int min) {
            if(n==min)
                return min;
            else
                return n+addNum(n-1,min);

        }

        public static String splicStr(int i,int min) {
            String temp="";
            if(i==min) {
                temp=""+min;
            }
            else{
                temp=splicStr(i-1,min)+"+"+i;
            }
            return temp;
        }

//        int num=12;
//        int sum=0;
//        while(num!=0){
//            sum= sum+num%10;
//            num=num/10;
//        }
//        System.out.println("所有数字总和："+sum);
    }
