package com.wqfang.modules.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 产品功能扩充协议表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Data
@TableName("product_fct_extend_agreement")
public class FctExtendAgreementEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private String id;
	/**
	 * 产品功能Id
	 */
	private String productFctBaseId;
	/**
	 * 操作类型
	 */
	private String operateType;
	/**
	 * 寄存器地址
	 */
	private String registerAddress;
	/**
	 * 原始数据类型
	 */
	private String originalDataType;
	/**
	 * 数据范围开始
	 */
	private Integer rangeStart;
	/**
	 * 数据范围结束
	 */
	private String rangeEnd;
	/**
	 * 数据获取类型
	 */
	private String dataGetType;
	/**
	 * 交换寄存器内高低字节
	 */
	private String swapHighByte;
	/**
	 * 交换寄存器顺序
	 */
	private String swapRegisterSort;
	/**
	 * 缩放因子
	 */
	private String zoom;

}
