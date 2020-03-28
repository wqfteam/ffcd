package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.FctBaseEntity;

import java.util.Map;

/**
 * 产品功能表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface FctBaseService extends IService<FctBaseEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveObj(FctBaseEntity fctBase);

    FctBaseEntity getObjById(String id);

    void updateObjectById(FctBaseEntity fctBase);
}

