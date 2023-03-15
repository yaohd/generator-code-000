/*
 * Copyright (c) 2019-2025  All Rights Reserved.FileName: PageUtils.java@author: ddyao @date: 21-11-24 下午4:34 @version: 1.0
 */

package com.code.generator.generatorcode.page.util;

public class PageUtils {

    private static final ThreadLocal<PageBean> pageInfo = new ThreadLocal<>();


    public static void setPageInfo(PageBean page) {
        pageInfo.set(page);
    }

    public static void clear() {
        pageInfo.remove();
    }

    public static PageBean getPage() {
        return pageInfo.get();
    }
}
