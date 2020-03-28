package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.BaseEntity;

import java.util.List;
import java.util.Map;

/**
 * 产品基础信息表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface BaseService extends IService<BaseEntity> {
    /**
     * 自定义保存
     * @param baseEntity
     * @return
     */
    Boolean saveObj(BaseEntity baseEntity);

    PageUtils queryPage(Map<String, Object> params);

    BaseEntity queryInfoById(String id);

    void updateObjById(BaseEntity base);

}

