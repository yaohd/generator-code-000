package com.code.generator.generatorcode.mybatis.fl.test;

import com.code.generator.generatorcode.mybatis.fl.entity.BasisInfo;
import com.code.generator.generatorcode.mybatis.fl.entity.TableEntity;
import com.code.generator.generatorcode.mybatis.fl.util.EntityInfoUtil;
import com.code.generator.generatorcode.mybatis.fl.util.Generator;
import com.code.generator.generatorcode.mybatis.fl.util.MySqlToJavaUtil;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>
 * 说明： 自动生成工具
 * </P>
 */
public class MyGenerator {
    // 基础信息：项目名、作者、版本
    public static final String PROJECT = "system_log_info";
    public static final String AUTHOR = "ddyao";
    public static final String VERSION = "v1.0.0";
    // 数据库连接信息：连接URL、用户名、秘密、数据库名
    public static final String URL = "jdbc:mysql://localhost:3306/yao?autoReconnect=true&zeroDateTimeBehavior=convertToNull&characterEncoding=utf-8&useSSL=false&serverTimezone=UTC";
    public static final String NAME = "root";
    public static final String PASS = "root";
    public static final String DATABASE = "yao";
    // 类信息：类名、对象名（一般是【类名】的首字母小些）、类说明、时间
    public static final String DATE = "2021/11/24";
    public static final String TIME = new Date().toString();
    public static final String AGILE = new Date().getTime() + "";
    // 路径信息，分开路径方便聚合工程项目，微服务项目


    public static final String BASE_URL = "com.example.demo11";
    // 项目路径
    public static final String BASE_PATH = "D:\\new2021workspace\\boot-workspace\\demo11\\";

    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date d = new Date();
        String dtime = sdf.format(d);
        sdf = new SimpleDateFormat("yyyy/MM/dd");
        String ddate = sdf.format(d);

        List<String> tableNameList = new ArrayList<>();
        tableNameList.add("systemLogInfo=system_log_info=系统日志表");

        for (String tableName : tableNameList) {
            String[] split = tableName.split("=");
            List<TableEntity> tables = new ArrayList<>();
            tables.add(new TableEntity(split[0], split[1], split[2]));
            for (TableEntity entity : tables) {
                BasisInfo bi = new BasisInfo(PROJECT, AUTHOR, VERSION, URL, NAME, PASS, DATABASE, dtime, ddate, AGILE, BASE_URL);
                bi.setTable(entity.getTable());
                bi.setSign(getSign(entity.getTable()));
                bi.setSubPackage("systemLogInfo");
                bi.setSwaggerTags(entity.getClassComment() + "服务接口");
                bi.setEntityName(MySqlToJavaUtil.getClassName(entity.getTable()));
                bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(entity.getTable()));
                bi.setEntityComment(entity.getClassComment());
                try {
                    bi = EntityInfoUtil.getInfo(bi);
                    System.err.println(Generator.createEntity(BASE_PATH + PROJECT + "-service" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createDao(BASE_PATH + PROJECT + "-service" + File.separator + "src\\main\\java\\", bi).toString());
                    // mapper.xml
                    System.err.println(Generator.createDaoImpl(BASE_PATH + PROJECT + "-service" + File.separator + "src\\main\\resources\\mapper\\", bi).toString());
                    System.err.println(Generator.createService(BASE_PATH + PROJECT + "-service" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createServiceImpl(BASE_PATH + PROJECT + "-service" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createApiImpl(BASE_PATH + PROJECT + "-service" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createVo(BASE_PATH + PROJECT + "-api" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createDto(BASE_PATH + PROJECT + "-api" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createApi(BASE_PATH + PROJECT + "-api" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createController(BASE_PATH + PROJECT + "-web" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createLogicDto(BASE_PATH + PROJECT + "-api" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createQueryVo(BASE_PATH + PROJECT + "-api" + File.separator + "src\\main\\java\\", bi).toString());
                    System.err.println(Generator.createUpdateVo(BASE_PATH + PROJECT + "-api" + File.separator + "src\\main\\java\\", bi).toString());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }


    }

    /**
     * 获取表的区分字段
     *
     * @param tableName 表名, eg: gen_test_demo
     * @return 区分字段 eg: test
     */
    private static String getSign(String tableName) {
        String[] split = tableName.split("_");
        if (split.length == 3) {
            return split[1];
        } else if (split.length == 4) {
            return split[1] + "_" + split[2];
        }
        return split[1];
    }


}
