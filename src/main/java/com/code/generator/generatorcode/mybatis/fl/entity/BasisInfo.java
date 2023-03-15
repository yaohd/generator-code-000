package com.code.generator.generatorcode.mybatis.fl.entity;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Copyright: Copyright (c) 2019
 * 
 * <p>
 * 说明： 自动生成需要的基本信息
 * </P>
 * 
 * @version: v2.1.0
 * @author: ydd
 * 
 *          Modification History: Date Author Version Description
 *          ---------------------------------------------------------------* 2019年4月9日 ydd v2.1.0 initialize
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasisInfo implements Serializable {
    private static final long serialVersionUID = 123123L;

    private String project;

    private String author;

    private String version;

    private String dbUrl;

    private String dbName;

    private String dbPassword;

    private String database;

    private String table;

    private String entityName;

    private String objectName;

    private String entityComment;

    private String createTime;

    private String createDate;

    private String agile;

    private String idType;

    private String idJdbcType;

    private List<PropertyInfo> cis;

    private String sign;
    
    private String swaggerTags;
    

    private String subPackage;

    private String baseUrl;
    
    public BasisInfo(String project, String author, String version, String dbUrl, String dbName, String dbPassword,
        String database, String createTime,String createDate, String agile,String baseUrl) {
        super();
        this.project = project;
        this.author = author;
        this.version = version;
        this.dbUrl = dbUrl;
        this.dbName = dbName;
        this.dbPassword = dbPassword;
        this.database = database;
        this.createTime = createTime;
        this.createDate = createDate;
        this.agile = agile;
        this.baseUrl = baseUrl;
    }

}
