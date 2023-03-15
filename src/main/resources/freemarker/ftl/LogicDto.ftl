package ${baseUrl}.${subPackage}.dto;

import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder;
import java.util.Date;


/**
 * 逻辑处理响应数据 : 增删改
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(value="${entityName}LogicDto",description="逻辑响应数据")
@SuppressWarnings("serial")
public class ${entityName}LogicDto implements Serializable{

	@ApiModelProperty(value = "操作标识")
	private Boolean sucFlag;
	
	@Builder.Default
	@ApiModelProperty(value = "返回信息")
	private String msg = "SUCCESS";
	
}