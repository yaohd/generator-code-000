package ${baseUrl}.${subPackage}.mapper;

import java.util.List;
import java.util.Date;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import ${baseUrl}.${subPackage}.dto.${entityName}Dto;
import ${baseUrl}.${subPackage}.entity.${entityName};
import ${baseUrl}.${subPackage}.vo.${entityName}Vo;
import ${baseUrl}.${subPackage}.vo.${entityName}QueryVo;
import org.apache.ibatis.annotations.Mapper;

/**   
 * @Description:  ${entityComment}——Mapper
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 */
@Mapper
public interface ${entityName}Mapper extends BaseMapper<${entityName}> {
	
    ${entityName}Dto detail(${entityName}Vo vo);

    List<${entityName}Dto> listPage(${entityName}QueryVo vo);

    List<${entityName}Dto> listCmb(${entityName}QueryVo vo);

}
	