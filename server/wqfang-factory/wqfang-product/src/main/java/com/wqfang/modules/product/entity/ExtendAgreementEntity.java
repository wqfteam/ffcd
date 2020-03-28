package com.wqfang.modules.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 产品协议信息扩充表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Data
@TableName("product_extend_agreement")
public class ExtendAgreementEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 产品扩充表主键
	 */
	@TableId
	private String id;
	/**
	 * 产品关联code
	 */
	private String productBaseCode;
	/**
	 * 产品协议类型
	 */
	private String agreementTypeId;

}
