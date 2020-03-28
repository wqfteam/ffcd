package com.wqfang.fanfan.table.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.fanfan.table.entity.RegionEntity;

import java.util.Map;

/**
 * 餐桌区域表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 22:15:07
 */
public interface RegionService extends IService<RegionEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

