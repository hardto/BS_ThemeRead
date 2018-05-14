package com.zhenyu.util;

import java.util.regex.Pattern;

/**
 * 判断字符串 工具类
 * @author lizhenyu
 *
 */
public class ValidateString {
	/**
     * 正则表达式：验证手机号
     */
    public static final String REGEX_MOBILE = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
 
    /**
     * 正则表达式：验证邮箱
     */
    public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";

	public static boolean isEmail(String email){
		return Pattern.matches(REGEX_EMAIL, email);
	}
	public static boolean isPhone(String phone){
		return Pattern.matches(REGEX_MOBILE, phone);
	}
}
