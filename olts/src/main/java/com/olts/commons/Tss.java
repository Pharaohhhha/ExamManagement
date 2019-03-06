package com.olts.commons;

/**
 * Created by TCCCC on 2018/11/4/004.
 */
public class Tss {
    public static void main(String[] args) {
        int n=15;
        int sum;
        for(int i=1;i<=n/2;i++){
              sum=0;
        for(int j=i;sum<n;j++){
            sum+=j;
            if(sum==n){
                for(int k=i;k<=j;k++){
                    System.out.print(k);
                }
                System.out.println();
            }
//            else if(sum>n){
//                continue;
//            }
        }
        }
    }
}
