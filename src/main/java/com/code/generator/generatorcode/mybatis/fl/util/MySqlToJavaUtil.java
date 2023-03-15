package com.code.generator.generatorcode.mybatis.fl.util;

import com.code.generator.generatorcode.mybatis.fl.convert.DateType;
import com.code.generator.generatorcode.mybatis.fl.convert.MySqlTypeConvert;
import org.apache.commons.lang3.CharUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 获奖java中需要的驼峰命名</P>
 * @version: v2.1.0
 * @author: ydd
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年4月9日      		ydd   v2.1.0           initialize
 */
public class MySqlToJavaUtil {

	/**
     * <p>说明:获取java类名</p>
     * @param table  表名
     * @return String
     */
	public static String getClassName(String table) {
		table=changeToJavaFiled(table);
		StringBuilder sbuilder = new StringBuilder();
		char[] cs = table.toCharArray();
		cs[0] -= 32;
		sbuilder.append(String.valueOf(cs));
		return sbuilder.toString();
	}

	/**
     * <p>说明:获取字段名，把"_"后面字母变大写</p>
     * @param fieldName  字段名
     * @return String
     */
	public static String changeToJavaFiled(String fieldName) {
	    if (null == fieldName) {
            return "";
        }
        fieldName = fieldName.toLowerCase();
        char[] chars = fieldName.toCharArray();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < chars.length; i++) {
            char c = chars[i];
            if (c == '_') {
                int j = i + 1;
                if (j < chars.length) {
                    sb.append(StringUtils.upperCase(CharUtils.toString(chars[j])));
                    i++;
                }
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
	}


	/**
     * <p>说明:把sql的数据类型转为java需要的类型</p>
     * @param sqlType  sql类型
     * @return String  java类型
     */
	public static String jdbcTypeToJavaType(String sqlType) {
		MySqlTypeConvert typeConvert= new MySqlTypeConvert();
		return typeConvert.processTypeConvert(DateType.ONLY_DATE, sqlType).getType();
	}
}
