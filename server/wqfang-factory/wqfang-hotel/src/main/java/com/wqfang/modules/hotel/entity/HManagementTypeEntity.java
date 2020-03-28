package com.wqfang.modules.hotel.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2020-03-23 23:58:55
 */
@Data
@TableName("h_management_type")
public class HManagementTypeEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 经营类型名字
	 */
	private String tyname;
	/**
	 * 上级ID
	 */
	private Long pid;

}
