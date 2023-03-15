package ${baseUrl}.${subPackage}.api.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiImplicitParam;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import ${baseUrl}.${subPackage}.dto.${entityName}Dto;
import ${baseUrl}.${subPackage}.dto.${entityName}LogicDto;
import ${baseUrl}.${subPackage}.entity.${entityName};
import ${baseUrl}.${subPackage}.vo.${entityName}Vo;
import ${baseUrl}.${subPackage}.vo.${entityName}QueryVo;
import ${baseUrl}.${subPackage}.api.${entityName}Api;
import ${baseUrl}.${subPackage}.service.${entityName}Service;
import ${baseUrl}.${subPackage}.mapper.${entityName}Mapper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageParam;

/**   
 * @Description:  ${entityComment}——ApiImpl
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 * 暴露的为dubbo服务
 */
@Service
@Api(produces="application/json",tags = "DUBBO-所有服务",consumes="application/json")
public class ${entityName}ApiImpl extends ServiceImpl<${entityName}Mapper, ${entityName}> implements ${entityName}Api {
    @Autowired
    private ${entityName}Service service;
    protected static final String TAGS = "dubbo-${swaggerTags}";
    @SuppressWarnings("unused")
    private static final Logger log = LoggerFactory.getLogger(${entityName}ApiImpl.class);
	
    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}新增",notes="${entityComment}新增",position = 1,response = ${entityName}Dto.class)
    public ${entityName}LogicDto add(${entityName}Vo vo) {
        return service.add(vo);
    }

    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}更新",notes="${entityComment}更新",position = 2,response = ${entityName}Dto.class)
    public ${entityName}LogicDto modifyById(${entityName}Vo vo) {
      	return service.modifyById(vo);
    }

    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}删除",notes="${entityComment}删除",position = 3,response = ${entityName}Dto.class)
	@ApiImplicitParam(name = "id", value = "${entityComment}id", required = true)
    public ${entityName}LogicDto delete(Integer id) {
    	return service.delete(id);
    }
	
    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}详情",notes="通过${entityComment}编号查询${entityComment}详情",position = 4,response = ${entityName}Dto.class)
   	@ApiImplicitParam(name = "no", value = "${entityComment}编号", required = true)
    public ${entityName}Dto detailByNo(String no) {
    	return service.detailByNo(no);
    }

    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}详情",notes="通过${entityComment}id查询${entityComment}详情",position = 5,response = ${entityName}Dto.class)
   	@ApiImplicitParam(name = "id", value = "${entityComment}id", required = true)
    public ${entityName}Dto detailById(Integer id) {
    	return service.detailById(id);
    }

    /**
	 * 条件查询列表
	 */
    @Override
    public List<${entityName}Dto> list(${entityName}QueryVo vo){
        return service.list(vo);
    }

    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}列表",notes="${entityComment}列表",position = 6,response = ${entityName}Dto.class)
    public PageInfo<${entityName}Dto> listPage(${entityName}QueryVo vo,PageParam pageParam) {
        return service.listPage(vo);
    }
	
    @Override
    @ApiOperation(tags = TAGS,value = "${entityComment}列表",notes="${entityComment}弹框列表",position = 7,response = ${entityName}Dto.class)
    public PageInfo<${entityName}Dto> listCmb(${entityName}QueryVo vo,PageParam pageParam) {
        return service.listCmb(vo);
    }
    
}