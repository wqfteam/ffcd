package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.DeviceBaseEntity;

import java.util.Map;

/**
 * 产品设备信息表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface DeviceBaseService extends IService<DeviceBaseEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

