<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${baseUrl}.${subPackage}.mapper.${entityName}Mapper">
	<sql id="Base_Column_List">
	${agile}
	</sql>

    <sql id="where_filters">
        <where>
            del_ind = 0
			<#list cis as ci>
				<#if ci.column!="del_ind" && ci.column!="version">
			<if test="${ci.property}  != null ">
                AND ${ci.column} = ${r'#{'}${ci.property}}
            </if>
				</#if>
			</#list>
        </where>
	</sql>

	
	<!-- 详情 -->
	<select id="detail" parameterType="${baseUrl}.${subPackage}.vo.${entityName}Vo" resultType="${baseUrl}.${subPackage}.dto.${entityName}Dto">
		select
		<include refid="Base_Column_List" />
		from ${table}
        <include refid="where_filters"/>
	</select>
	
	<!-- 列表查询 -->
	<select id="listPage" parameterType="${baseUrl}.${subPackage}.vo.${entityName}QueryVo" resultType="${baseUrl}.${subPackage}.dto.${entityName}Dto">
		select
		<include refid="Base_Column_List" />
		from ${table}
        <include refid="where_filters"/>
        order by id desc
	</select>
	
	<!-- 弹框查询 -->
	<select id="listCmb" parameterType="${baseUrl}.${subPackage}.vo.${entityName}QueryVo" resultType="${baseUrl}.${subPackage}.dto.${entityName}Dto">
		select
		<include refid="Base_Column_List" />
		from ${table}
        <include refid="where_filters"/>
        order by id desc
	</select>
	
</mapper>