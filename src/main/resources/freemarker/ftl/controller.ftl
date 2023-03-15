package ${baseUrl}.${subPackage}.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.code.generator.generatorcode.result.ResultUtil;
import com.code.generator.generatorcode.page.annotation.PageTool;
import ${baseUrl}.${subPackage}.dto.${entityName}Dto;
import ${baseUrl}.${subPackage}.dto.${entityName}LogicDto;
import ${baseUrl}.${subPackage}.vo.${entityName}Vo;
import ${baseUrl}.${subPackage}.vo.${entityName}QueryVo;
import ${baseUrl}.${subPackage}.service.${entityName}Service;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**   
 * @Description:  ${entityComment}接口层
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 */
@RestController
@Api(produces="application/json",tags = "API-所有服务",consumes="application/json")
public class ${entityName}Controller {
    @Autowired
    private ${entityName}Service service;
    protected static final String TAGS = "${swaggerTags}";
    @SuppressWarnings("unused")
    private static final Logger log = LoggerFactory.getLogger(${entityName}Controller.class);
    
    @ApiOperation(tags = TAGS,value = "${entityComment}新增",notes="${entityComment}新增",position = 1,response = ${entityName}LogicDto.class)
    @PostMapping(value = "/v1/${table}")
    public Object add(@ApiParam(required=true) @RequestBody @Valid ${entityName}Vo vo) {
    	${entityName}LogicDto dto=service.add(vo);
		return ResultUtil.success(dto);
    }
    
    @ApiOperation(tags = TAGS,value = "${entityComment}更新",notes="${entityComment}更新",position = 2,response = ${entityName}LogicDto.class)
    @PatchMapping(value = "/v1/${table}")
    public Object modifyById(@ApiParam(required=true)  @Valid @RequestBody ${entityName}Vo vo) {
    	${entityName}LogicDto dto=service.modifyById(vo);
	    return ResultUtil.success(dto);
    }
    
    @ApiOperation(tags = TAGS,value = "${entityComment}删除",notes="${entityComment}删除",position = 3,response = ${entityName}LogicDto.class)
	@ApiImplicitParam(name = "id", value = "${entityComment}id", required = true)
    @DeleteMapping(value = "/v1/${table}/{id}")
    public Object delete(@PathVariable Integer id) {
    	${entityName}LogicDto dto = service.delete(id);
	    return ResultUtil.success(dto);
    }
    
    @ApiOperation(tags = TAGS,value = "${entityComment}详情",notes="通过${entityComment}编号查询${entityComment}详情",position = 4,response = ${entityName}Dto.class)
   	@ApiImplicitParam(name = "no", value = "${entityComment}编号", required = true)
    @GetMapping(value = "/v1/${table}_no/{no}")
    public Object detailByNo(@PathVariable String no) {
        ${entityName}Dto dto = service.detailByNo(no);
        return ResultUtil.success(dto);
    }
    
    @ApiOperation(tags = TAGS,value = "${entityComment}详情",notes="通过${entityComment}id查询${entityComment}详情",position = 5,response = ${entityName}Dto.class)
   	@ApiImplicitParam(name = "id", value = "${entityComment}id", required = true)
    @GetMapping(value = "/v1/${table}_id/{id}")
    public Object detailById(@PathVariable Integer id) {
    	${entityName}Dto dto = service.detailById(id);
        return ResultUtil.success(dto);
    }
    
    @SuppressWarnings("deprecation")
	@PageTool
    @ApiOperation(tags = TAGS,value = "${entityComment}列表",notes="${entityComment}列表",position = 6,response = ${entityName}Dto.class)
    @GetMapping(value = "/v1/${table}_page")
    public Object listPage(@ApiParam(required=false)  ${entityName}QueryVo vo) {
    	PageInfo<${entityName}Dto> dto = service.listPage(vo);
		return ResultUtil.success(dto);
    }
    
    @SuppressWarnings("deprecation")
	@PageTool
    @ApiOperation(tags = TAGS,value = "${entityComment}列表",notes="${entityComment}弹框列表",position = 7,response = ${entityName}Dto.class)
    @GetMapping(value = "/v1/${table}_cmb")
    public Object listCmb(@ApiParam(required=false)  ${entityName}QueryVo vo) {
    	PageInfo<${entityName}Dto> dto = service.listCmb(vo);
		return ResultUtil.success(dto);
    }

    
}
