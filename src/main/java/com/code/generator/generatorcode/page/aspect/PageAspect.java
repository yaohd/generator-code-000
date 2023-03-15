/*
 * Copyright (c) 2019-2025  All Rights Reserved.FileName: PageCompoent.java@author: ddyao @date: 21-11-24 下午4:29 @version: 1.0
 */

package com.code.generator.generatorcode.page.aspect;

import com.code.generator.generatorcode.page.util.PageBean;
import com.code.generator.generatorcode.page.util.PageUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;


@Slf4j
@Aspect
@Component
public class PageAspect {

    @Pointcut("@annotation(com.code.generator.generatorcode.page.annotation.PageTool)")
    public void pagePointCut() {
    }

    @Before("pagePointCut()")
    public void before(JoinPoint joinPoint) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if (null != request) {
            String current = request.getParameter("current");
            if (StringUtils.isEmpty(current)) {
                current = "1";
            }
            String size = request.getParameter("size");
            if (StringUtils.isEmpty(size)) {
                size = "10";
            }
            PageBean page = null;
            try {
                page = new PageBean(Integer.valueOf(current), Integer.valueOf(size));
            } catch (Exception e) {
                log.error("对象构建转换异常current:{},size:{},error:{}", current, size, page);
                page = new PageBean(1, 10);
            }
            PageUtils.setPageInfo(page);
        }
    }


}
