package com.code.generator.generatorcode.mybatis.fl.util;

import com.code.generator.generatorcode.mybatis.fl.entity.BasisInfo;
import com.code.generator.generatorcode.mybatis.fl.entity.JsonResult;
import com.code.generator.generatorcode.mybatis.fl.entity.PropertyInfo;

import java.util.List;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>
 * 说明： 获取文件路径调用创建文件
 * </P>
 *
 * @version: v2.1.0
 * @author: ydd
 *
 *          Modification History: Date Author Version Description
 *          ---------------------------------------------------------------* 2019年4月9日 ydd v2.1.0 initialize
 */
public class Generator {
    // 路径信息
    public static final String ENTITY = "entity";
    public static final String VO = "vo";
    public static final String DTO = "dto";
    public static final String DAO = "dao";
    public static final String DAO_IMPL = "daoImpl";
    public static final String SERVICE = "service";
    public static final String SERVICE_IMPL = "serviceImpl";
    public static final String CONTROLLER = "controller";
    public static final String API = "api";
    public static final String API_IMPL = "apiImpl";
    public static final String LOGIC_DTO = "logicDto";
    public static final String QUERY_VO = "queryVo";
    public static final String UPDATE_VO = "updateVo";

    // ①创建实体类
    public static JsonResult createEntity(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), ENTITY, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "entity.ftl", fileUrl);
    }

    // ①创建VO类
    public static JsonResult createVo(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), VO, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "vo.ftl", fileUrl);
    }

    // ①创建DTO类
    public static JsonResult createDto(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), DTO, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "dto.ftl", fileUrl);
    }

    // ②创建DAO
    public static JsonResult createDao(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), DAO, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "dao.ftl", fileUrl);
    }

    // ③创建mapper配置文件
    public static JsonResult createDaoImpl(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), DAO_IMPL, bi.getSubPackage());
        List<PropertyInfo> list = bi.getCis();
        String agile = "";
        for (PropertyInfo propertyInfo : list) {
            agile = agile + propertyInfo.getColumn() + ", ";
        }
        agile = agile.substring(0, agile.length() - 2);
        bi.setAgile(agile);
        return FreemarkerUtil.createFile(bi, "mapper.ftl", fileUrl);
    }

    // ④创建SERVICE
    public static JsonResult createService(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), SERVICE, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "service.ftl", fileUrl);
    }

    // ⑤创建SERVICE_IMPL
    public static JsonResult createServiceImpl(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), SERVICE_IMPL, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "serviceImpl.ftl", fileUrl);
    }

    // ④创建API
    public static JsonResult createApi(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), API, bi.getSubPackage());
        System.out.println(fileUrl);
        return FreemarkerUtil.createFile(bi, "api.ftl", fileUrl);
    }

    // ⑤创建API_IMPL
    public static JsonResult createApiImpl(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), API_IMPL, bi.getSubPackage());
        return FreemarkerUtil.createFile(bi, "apiImpl.ftl", fileUrl);
    }

    // ⑥创建CONTROLLER
    public static JsonResult createController(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), CONTROLLER, bi.getSubPackage());
        return FreemarkerUtil.createFile(bi, "controller.ftl", fileUrl);
    }

    // ⑥创建logicDto
    public static JsonResult createLogicDto(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), LOGIC_DTO, bi.getSubPackage());
        return FreemarkerUtil.createFile(bi, "logicDto.ftl", fileUrl);
    }

    // ⑥创建queryVo
    public static JsonResult createQueryVo(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), QUERY_VO, bi.getSubPackage());
        return FreemarkerUtil.createFile(bi, "queryVo.ftl", fileUrl);
    }

    // ⑥创建updateVo
    public static JsonResult createUpdateVo(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getBaseUrl(), bi.getEntityName(), UPDATE_VO, bi.getSubPackage());
        return FreemarkerUtil.createFile(bi, "updateVo.ftl", fileUrl);
    }

    // 生成文件
    public static String getGeneratorFileUrl(String url, String packageUrl, String entityName, String type, String subPackage) {
        if (type.equals("entity")) {
            return url + pageToUrl(packageUrl, subPackage) + "entity/" + entityName + ".java";
        } else if (type.equals("vo")) {
            return url + pageToUrl(packageUrl, subPackage) + "vo/" + entityName + "Vo.java";
        } else if (type.equals("queryVo")) {
            return url + pageToUrl(packageUrl, subPackage) + "vo/" + entityName + "QueryVo.java";
        } else if (type.equals("dto")) {
            return url + pageToUrl(packageUrl, subPackage) + "dto/" + entityName + "Dto.java";
        } else if (type.equals("dao")) {
            return url + pageToUrl(packageUrl, subPackage) + "mapper/" + entityName + "Mapper.java";
        } else if (type.equals("daoImpl")) {
            return url + entityName + "Mapper.xml";
        } else if (type.equals("service")) {
            return url + pageToUrl(packageUrl, subPackage) + "service/" + entityName + "Service.java";
        } else if (type.equals("serviceImpl")) {
            return url + pageToUrl(packageUrl, subPackage) + "service/impl/" + entityName + "ServiceImpl.java";
        } else if (type.equals("controller")) {
            return url + pageToUrl(packageUrl, subPackage) + "controller/" + entityName + "Controller.java";
        } else if (type.equals("api")) {
            return url + pageToUrl(packageUrl, subPackage) + "api/" + entityName + "Api.java";
        } else if (type.equals("apiImpl")) {
            return url + pageToUrl(packageUrl, subPackage) + "api/impl/" + entityName + "ApiImpl.java";
        } else if (type.equals("logicDto")) {
            return url + pageToUrl(packageUrl, subPackage) + "dto/" + entityName + "LogicDto.java";
        } else if (type.equals("updateVo")) {
            return url + pageToUrl(packageUrl, subPackage) + "vo/" + entityName + "UpdateVo.java";
        }
        return null;
    }

    public static String pageToUrl(String url, String subPackage) {
        return url.replace(".", "/") + "/" + subPackage + "/";
    }
}
