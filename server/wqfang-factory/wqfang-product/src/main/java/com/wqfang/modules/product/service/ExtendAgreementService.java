package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.ExtendAgreementEntity;

import java.util.Map;

/**
 * 产品协议信息扩充表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface ExtendAgreementService extends IService<ExtendAgreementEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

