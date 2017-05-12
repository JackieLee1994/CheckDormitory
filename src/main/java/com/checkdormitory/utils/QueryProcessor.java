package com.checkdormitory.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.util.Assert;



/**
 * 这是一个HQL的处理器
 * 进行HQL的解释与返回结果集
 */
public class QueryProcessor {
	
	/**
	 * 利用表达式去除hql的from前缀
	 * @param hql
	 * @return 去掉from 前缀的hql
	 */
	public static String removeSelect(String hql) {
		Assert.hasText(hql);
		int beginPos = hql.toLowerCase().indexOf("from");
		Assert.isTrue(beginPos != -1, " hql : " + hql + " must has a keyword 'from'");
		return hql.substring(beginPos);
	}
	
	/**
	 * 利用表达式去除hql的order后缀
	 * @param hql
	 * @return 去掉order by的hql
	 */
	public static String removeOrders(String hql) {
		Assert.hasText(hql);
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}
	
	/**
	 * 去掉fetch关键字
	 * @param hql
	 * @return
	 */
	public static String removeFetchs(String hql){
		Assert.hasText(hql);
		return hql.replaceAll("fetch", "");
	}
}
