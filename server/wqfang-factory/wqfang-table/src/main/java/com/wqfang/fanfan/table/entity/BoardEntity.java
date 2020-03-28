package com.wqfang.fanfan.table.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 餐桌表
 * 
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 22:15:07
 */
@Data
@TableName("table_board")
public class BoardEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 餐桌Id
	 */
	@TableId
	private Integer tableId;
	/**
	 * 餐桌名称
	 */
	private String tableName;
	/**
	 * 餐桌编码
	 */
	private String tableNum;
	/**
	 * 容纳人数
	 */
	private Integer tablePeopleNum;
	/**
	 * 是否有效
	 */
	private Long tableIsFlag;
	/**
	 * 服务费
	 */
	private BigDecimal tableServiceCharge;
	/**
	 * 起点彩品数量
	 */
	private Integer tableFoodCount;
	/**
	 * 最低消费
	 */
	private BigDecimal tableMinCharge;
	/**
	 * 餐桌状态
	 */
	private Integer tableStatus;
	/**
	 * 扩展表类型
	 */
	private String extendsTableType;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 修改时间
	 */
	private Date modifyTime;

}
