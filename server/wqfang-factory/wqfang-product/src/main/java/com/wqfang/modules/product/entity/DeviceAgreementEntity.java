package com.wqfang.modules.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 设备通信协议参数
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Data
@TableName("product_device_agreement")
public class DeviceAgreementEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private String id;
	/**
	 * 设备Id
	 */
	private String productDeviceBaseId;
	/**
	 * ip地址
	 */
	private String ip;
	/**
	 * 端口
	 */
	private String post;
	/**
	 * 串口端口名称
	 */
	private String serialPort;

}
