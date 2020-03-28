package com.wqfang.fanfan.extend.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 扩展字段表
 * 
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 00:08:40
 */
@Data
@TableName("fanfan_extend_fieid")
public class ExtendFieidEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 字段名称
	 */
	private String fieid;
	/**
	 * 字段标题
	 */
	private String fieidTitle;
	/**
	 * 关联类型
	 */
	private String fieidType;

	private String fieidVal;

}
