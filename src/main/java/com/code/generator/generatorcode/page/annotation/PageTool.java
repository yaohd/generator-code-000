/*
 * Copyright (c) 2019-2025  All Rights Reserved.FileName: FunderPage.java@author: ddyao @date: 21-11-24 下午4:29 @version: 1.0
 */

package com.code.generator.generatorcode.page.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface PageTool {
}
