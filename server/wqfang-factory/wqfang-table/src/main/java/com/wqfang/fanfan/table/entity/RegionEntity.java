package com.wqfang.fanfan.table.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 餐桌区域表
 * 
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 22:15:07
 */
@Data
@TableName("table_region")
public class RegionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer regionId;
	/**
	 * 名称
	 */
	private String regionName;
	/**
	 * 服务费用
	 */
	private BigDecimal regionServiceCharge;
	/**
	 * 最低消费
	 */
	private BigDecimal regionMinCharge;
	/**
	 * 开启餐前结账
	 */
	private Long regionFrontAccount;
	/**
	 * 扫码点餐验证码
	 */
	private Long regionQr;
	/**
	 * 座位数
	 */
	private String regionSeatNum;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改时间
	 */
	private String modifyTime;
	/**
	 * 扩展表类型
	 */
	private String extendType;

}
