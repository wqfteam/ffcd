package com.wqfang.modules.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 产品设备信息表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Data
@TableName("product_device_base")
public class DeviceBaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private String id;
	/**
	 * 产品关联code
	 */
	private String productBaseCode;
	/**
	 * 设备名称
	 */
	private String deviceName;
	/**
	 * 设备上线时间
	 */
	private Date deviceOnlineTime;

	/**
	 * 设备状态
	 */
	private String deviceStatus;
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
	 * 产品
	 */
	private BaseEntity baseEntity;

}
