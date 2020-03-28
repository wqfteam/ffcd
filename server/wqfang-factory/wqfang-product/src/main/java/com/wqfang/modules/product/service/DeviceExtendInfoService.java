package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.DeviceExtendInfoEntity;

import java.util.Map;

/**
 * 设备信息扩展表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface DeviceExtendInfoService extends IService<DeviceExtendInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

