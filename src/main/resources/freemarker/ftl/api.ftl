package ${baseUrl}.${subPackage}.api;

import ${baseUrl}.${subPackage}.dto.${entityName}Dto;
import ${baseUrl}.${subPackage}.dto.${entityName}LogicDto;
import ${baseUrl}.${subPackage}.vo.${entityName}Vo;
import ${baseUrl}.${subPackage}.vo.${entityName}QueryVo;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageParam;

/**   
 * @Description:  ${entityComment}——Api
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 */
public interface ${entityName}Api {
	/**
	 * @method: add
	 * @description：${entityComment}新增
	 * @auther: ${author}
	 * @date: ${createTime}
	 */
    public ${entityName}LogicDto add(${entityName}Vo vo);

    /**
    * @method: modifyById
    * @description：${entityComment}更新
    * @auther: ${author}
    * @date: ${createTime}
    */
    public ${entityName}LogicDto modifyById(${entityName}Vo vo);

    /**
    * @method: delete
    * @description：${entityComment}删除
    * @auther: ${author}
    * @date: ${createTime}
    */
    public ${entityName}LogicDto delete(Integer id);
    
	/**
	 * 通过${entityComment}编号查询${entityComment}详情
	 */

    /**
    * @method: ${entityName}LogicDto
    * @description：通过${entityComment}编号查询${entityComment}详情
    * @auther: ${author}
    * @date: ${createTime}
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
    public PageInfo<${entityName}Dto> listPage(${entityName}QueryVo vo,PageParam pageParam);
    
	/**
	 * ${entityComment}弹框列表
	 */
    public PageInfo<${entityName}Dto> listCmb(${entityName}QueryVo vo,PageParam pageParam);
}
