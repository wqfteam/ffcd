package com.wqfang.modules.hotel.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.hotel.entity.HManagementTypeEntity;

import java.util.Map;

/**
 * 
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2020-03-23 23:58:55
 */
public interface HManagementTypeService extends IService<HManagementTypeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

