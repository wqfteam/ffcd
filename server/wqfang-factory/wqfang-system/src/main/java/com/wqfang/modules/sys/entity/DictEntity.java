package com.wqfang.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 字典表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:54:34
 */
@Data
@TableName("sys_dict")
public class DictEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private String id;
	/**
	 * 字典名称
	 */
	private String name;
	/**
	 * 字典值
	 */
	private String value;
	/**
	 * 字典类型
	 */
	private String type;
	/**
	 * 字典编码
	 */
	private String code;
	/**
	 * 字典描述
	 */
	private String dictDesc;

}
