package com.example.demo.controller.io;

import org.springframework.util.StringUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by xuwencong on 2018/9/12
 */
public class IOTest {
    public static void main(String[] args) throws Exception{
//   test01();
//   test02();
   test03();
    }

    public static void test01() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("请输入一个字符");
        char c;
        c = (char) bufferedReader.read();
        System.out.println("你输入的字符为"+c);
    }

    public static void test02() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("请输入一个字符，按 q 键结束");
        char c;
        do {
            c = (char) bufferedReader.read();
            System.out.println("你输入的字符为"+c);
        } while (c != 'q');
    }

    public static void test03() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("请输入一行字符");
        String str;
        do{
             str = bufferedReader.readLine();
            System.out.println("你输入的字符为" + str);
        }while (StringUtils.hasText(str));

    }


}
