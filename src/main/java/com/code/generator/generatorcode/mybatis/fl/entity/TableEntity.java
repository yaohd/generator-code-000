package com.code.generator.generatorcode.mybatis.fl.entity;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TableEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	private String className = "BizOrgBscInfo";
	private String table = "biz_org_bsc_info";
	private String classComment = "企业基本信息";
}
