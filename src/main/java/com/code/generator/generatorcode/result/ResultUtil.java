/*
 * Copyright (c) 2019-2025  All Rights Reserved.FileName: FundResultUtil.java@author: ddyao @date: 21-11-24 下午4:48 @version: 1.0
 */

package com.code.generator.generatorcode.result;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
public class ResultUtil {

    /*正常返回码（静默）*/
    private static final String OK_CODE = "1";
    /*消息提示返回码*/
    private static final String INFO_CODE = "2";
    /*警告返回码*/
    private static final String WARN_CODE = "3";
    /*错误提示返回码*/
    private static final String ERROR_CODE = "4";

    /*失败返回码*/
    public static final String FAIL_CODE = "100";
    /*成功返回码*/
    public static final String SUCCESS_CODE = "200";
    /*异常提示码*/
    public static final String EXCEPTION_CODE = "400";

    /*成功返回提示信息*/
    public static final String SUCCESS_MESSAGE = "操作成功";

    public static String moduleCode = "00";

//    @Value("${fund.module.code}")
    public void setModuleCode(String code) {
        ResultUtil.moduleCode = code;
    }

    /**
     * 返回成功处理对象
     *
     * @param data
     * @return
     */
    public static Result success(Object data) {
        return new Result(moduleCode + OK_CODE + SUCCESS_CODE, SUCCESS_MESSAGE, data);
    }

    /**
     * 返回成功处理提示及对象
     *
     * @param message
     * @param data
     * @return
     */
    public static Result success(String message, Object data) {
        return new Result(moduleCode + INFO_CODE + SUCCESS_CODE, message, data);
    }

    /**
     * 返回失败处理提示
     *
     * @param message
     * @return
     */
    public static Result fail(String message) {
        return new Result(moduleCode + WARN_CODE + FAIL_CODE, message);
    }

    /**
     * 返回错误处理提示
     *
     * @param message
     * @return
     */
    public static Result error(String message) {
        return new Result(moduleCode + ERROR_CODE + EXCEPTION_CODE, message);
    }

}
