package com.wqfang.modules.product.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 产品功能表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Data
@TableName("product_fct_base")
public class FctBaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 产品功能表id
	 */
	@TableId
	private String id;
	/**
	 * 产品关联code
	 */
	private String productBaseCode;
	/**
	 * 功能名称
	 */
	private String fctName;
	/**
	 * 功能标识符
	 */
	private String fctTag;
	/**
	 * 功能显示单位
	 */
	private String fctUnit;
	/**
	 * 功能描述
	 */
	private String fctDesc;
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
	/**
	 * 功能扩展协议
	 */
	@TableField(exist = false)
	private FctExtendAgreementEntity agreement;

}
