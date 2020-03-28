package com.wqfang.modules.product.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 产品基础信息表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Data
@TableName("product_base")
public class BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId("id")
	private String id;
	/**
	 * 产品名称
	 */
	private String productName;
	/**
	 * 产品状态
	 */
	private Long productStatus;
	/**
	 * 产品描述
	 */
	private String productDesc;
	/**
	 * 产品协议扩展
	 */
	@TableField(exist = false)
	private ExtendAgreementEntity agreement;
	/**
	 * 创建人
	 */
	private String createUserId;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 修改人
	 */
	private String updateUserId;
	/**
	 * 修改时间
	 */
	private Date updateTime;
	/**
	 * 假删除0:不删除1:已删除
	 */
	private Long flag;

	private String productBaseCode;

}
