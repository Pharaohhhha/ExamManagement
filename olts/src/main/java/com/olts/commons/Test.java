package com.olts.commons;

/**
 * Created by TCCCC on 2018/10/15/015.
 */
public class Test {
    public static void main(String args[ ]){
        String s1 =  "abc";;
        String s2 = "abc";
        s1 += "xyz"  ;

        s2.concat("pqr") ;
        s1.toUpperCase() ;
        System.out.println(s1 + s2) ;
    }
}
