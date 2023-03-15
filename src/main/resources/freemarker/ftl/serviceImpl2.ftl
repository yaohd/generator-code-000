package ${baseUrl};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import ${baseUrl}.${entityName};
import ${baseUrl}.${entityName}Service;
import ${baseUrl}.${entityName}Mapper;

/**   
 *  
 * @Description:  ${entityComment}——SERVICEIMPL
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 *    
 */
@Service
public class ${entityName}ServiceImpl  extends ServiceImpl<${entityName}Mapper,${entityName}> implements ${entityName}Service {
}