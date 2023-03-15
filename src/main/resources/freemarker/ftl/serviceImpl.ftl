package ${baseUrl}.${subPackage}.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import ${baseUrl}.${subPackage}.dto.${entityName}Dto;
import ${baseUrl}.${subPackage}.dto.${entityName}LogicDto;
import ${baseUrl}.${subPackage}.entity.${entityName};
import ${baseUrl}.${subPackage}.vo.${entityName}Vo;
import ${baseUrl}.${subPackage}.vo.${entityName}QueryVo;
import ${baseUrl}.${subPackage}.service.${entityName}Service;
import ${baseUrl}.${subPackage}.mapper.${entityName}Mapper;
import com.bigtreefinance.common.utils.BeanUtils;
import com.github.pagehelper.PageInfo;
import com.bigtreefinance.standard.exception.BusinessException;
import com.bigtreefinance.common.constants.ResultConsts;
<#--import com.bigtreefinance.cpmb.config.constant.BindUserInfo;-->

/**
 * @Description:  ${entityComment}——SERVICEIMPL
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 */
@Service
public class ${entityName}ServiceImpl extends ServiceImpl<${entityName}Mapper, ${entityName}> implements ${entityName}Service {
    @Autowired
    private ${entityName}Mapper mapper;
    @SuppressWarnings("unused")
    private static final Logger log = LoggerFactory.getLogger(${entityName}ServiceImpl.class);
	
    @Override
    public ${entityName}LogicDto add(@Valid ${entityName}Vo vo) {
        UserContext userContext = UserContextHolder.get();
    	<#--vo = BindUserInfo.bindUser(vo,userContext,false);-->
        ${entityName} entity = BeanUtils.copyProperties(vo, ${entityName}.class);
        // TODO
        if(mapper.detail(vo)!=null) {
    		throw new BusinessException(ResultConsts.ERROR_STATUS, "记录已存在");
    	}
        return ${entityName}LogicDto.builder().sucFlag(save(entity)).build();
    }

    @Override
    public ${entityName}LogicDto modifyById(@Valid ${entityName}Vo vo) {
    	UserContext userContext = UserContextHolder.get();
    	<#--vo = BindUserInfo.bindUser(vo,userContext,false);-->
    	if(vo.getId()==null) {
    		throw new BusinessException(ResultConsts.ERROR_STATUS, "唯一标识id不能为空");
    	}
        ${entityName} entity = BeanUtils.copyProperties(vo, ${entityName}.class);
        return ${entityName}LogicDto.builder().sucFlag(updateById(entity)).build();
    }

    @Override
    public ${entityName}LogicDto delete(Integer id) {
    	if(id==null) {
    		throw new BusinessException(ResultConsts.ERROR_STATUS, "唯一标识id不能为空");
    	}
        return ${entityName}LogicDto.builder().sucFlag(removeById(id)).build();
    }

    @Override
    public ${entityName}Dto detailByNo(String no) {
        return null;
    }

    @Override
    public ${entityName}Dto detailById(Integer id) {
    	if(id==null) {
    		throw new BusinessException(ResultConsts.ERROR_STATUS, "唯一标识id不能为空");
    	}
    	${entityName}Vo vo = ${entityName}Vo.builder().build();
        vo.setId(id);
        ${entityName}Dto result = mapper.detail(vo);
        return result;
    }

    /**
	 * 条件查询列表
	 */
    @Override
    public List<${entityName}Dto> list(${entityName}QueryVo vo){
        return mapper.listPage(vo);
    }

    @Override
    public PageInfo<${entityName}Dto> listPage(${entityName}QueryVo vo) {
        UserContext userContext = UserContextHolder.get();
        <#--vo = BindUserInfo.bindUser(vo,userContext,false);-->
        PageInfo<${entityName}Dto> result = new PageInfo<>(mapper.listPage(vo));
        return result;
    }

    @Override
    public PageInfo<${entityName}Dto> listCmb(${entityName}QueryVo vo) {
        UserContext userContext = UserContextHolder.get();
        <#--vo = BindUserInfo.bindUser(vo,userContext,false);-->
        PageInfo<${entityName}Dto> result = new PageInfo<>(mapper.listCmb(vo));
        return result;
    }

    
}