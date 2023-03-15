package ${baseUrl}.${subPackage}.dto;

import java.io.Serializable;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder;
import java.math.BigDecimal;

/**   
 * @Description:  ${entityComment}
 * @Author:       ${author}   
 * @CreateDate:   ${createDate}
 * @Version:      ${version}
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(value="${entityName}Dto",description="${entityComment}响应数据")
@SuppressWarnings("serial")
public class ${entityName}Dto implements Serializable {

<#list cis as ci>

    <#--<#if (ci.property!="id" && ci.property!="createTime" && ci.property!="updateTime" &&-->
    <#--ci.property!="createUser" && ci.property!="updateUser" && ci.property!="expdId"-->
    <#--&& ci.property!="tenantId"&& ci.property!="version" && ci.property!="delInd")>-->
	/**
	 * ${ci.comment}
	 */
	@ApiModelProperty(value = "${ci.comment}",required = false)
	private ${ci.javaType} ${ci.property};
    <#--</#if>-->

</#list>
}
	