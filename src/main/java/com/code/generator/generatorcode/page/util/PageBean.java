/*
 * Copyright (c) 2019-2025  All Rights Reserved.FileName: PageBean.java@author: ddyao @date: 21-11-24 下午4:34 @version: 1.0
 */

package com.code.generator.generatorcode.page.util;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageBean {

    /*当前页数*/
    private int current;
    /*每页条数*/
    private int size;

}
