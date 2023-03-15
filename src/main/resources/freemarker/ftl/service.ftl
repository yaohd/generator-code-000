package ${baseUrl}.${subPackage}.service;

import javax.validation.Valid;
import com.baomidou.mybatisplus.extension.service.IService;
import ${baseUrl}.${subPackage}.dto.${entityName}Dto;
import ${baseUrl}.${subPackage}.dto.${entityName}LogicDto;
import ${baseUrl}.${subPackage}.entity.${entityName};
import ${baseUrl}.${subPackage}.vo.${entityName}Vo;
import ${baseUrl}.${subPackage}.vo.${entityName}QueryVo;
import com.github.pagehelper.PageInfo;

/**   
 * @Description:  ${entityComment}——SERVICE
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 */
public interface ${entityName}Service extends IService<${entityName}> {
	
	/**
	 * ${entityComment}新增
	 */
    public ${entityName}LogicDto add(@Valid ${entityName}Vo vo);
    
	/**
	 * ${entityComment}更新
	 */
    public ${entityName}LogicDto modifyById(@Valid ${entityName}Vo vo);
    
	/**
	 * ${entityComment}删除
	 */
    public ${entityName}LogicDto delete(Integer id);
    
	/**
	 * 通过${entityComment}编号查询${entityComment}详情
	 */
	public ${entityName}Dto detailByNo(String no);
	
	/**
	 * 通过${entityComment}id查询${entityComment}详情
	 */
    public ${entityName}Dto detailById(Integer id);


	/**
	 * 条件查询列表
	 */
    public List<${entityName}Dto> list(${entityName}QueryVo vo);

    
	/**
	 * ${entityComment}列表
	 */
    public PageInfo<${entityName}Dto> listPage(${entityName}QueryVo vo);
    
	/**
	 * ${entityComment}弹框列表
	 */
    public PageInfo<${entityName}Dto> listCmb(${entityName}QueryVo vo);

}