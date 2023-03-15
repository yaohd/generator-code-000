/*
 * Copyright (c) 2019-2025  All Rights Reserved.FileName: FundResult.java@author: ddyao @date: 21-11-24 下午4:48 @version: 1.0
 */

package com.code.generator.generatorcode.result;

import lombok.Data;

/**
 * 通用返回对象
 * @param <T>
 */
@Data
public class Result<T> {
    /*返回码*/
    private String code;
    /*提示信息*/
    private String message;
    /*返回对象*/
    private T data;


    public Result(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public Result(String code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }


}
