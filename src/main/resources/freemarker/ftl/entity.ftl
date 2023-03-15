package ${baseUrl}.${subPackage}.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;

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
@TableName(value = "${table}")
public class ${entityName} implements Serializable {
<#--不继承BaseEntity类-->
<#--public class ${entityName} implements Serializable {-->

	private static final long serialVersionUID = ${agile}L;

<#list cis as ci>

<#--继承BaseEntity类-->
	<#--<#if (ci.property!="id" && ci.property!="createTime" && ci.property!="updateTime" &&-->
	<#--ci.property!="createUser" && ci.property!="updateUser" && ci.property!="expdId"-->
	<#--&& ci.property!="tenantId"&& ci.property!="version" && ci.property!="delInd")>-->
	/**
	 * ${ci.comment}
	 */
	@TableField(value = "${ci.column}")
	private ${ci.javaType} ${ci.property};
	<#--</#if>-->

<#--不继承BaseEntity类-->
<#--	/**
	 * ${ci.comment}
	 */
	@TableField(value = "${ci.column}")
	private ${ci.javaType} ${ci.property};-->

	
</#list>
}
	