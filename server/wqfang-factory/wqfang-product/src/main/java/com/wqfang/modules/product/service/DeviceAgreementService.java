package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.DeviceAgreementEntity;

import java.util.Map;

/**
 * 设备通信协议参数
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface DeviceAgreementService extends IService<DeviceAgreementEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

