package com.checkdormitory.utils;

/**
 * Created by lwxzbh on 2017/5/1.
 */
public class CharacterEncode {
    public static String toUTF8(String str)throws Exception{
        return new String(str.getBytes("iso8859-1"),"utf-8");
    }
}
