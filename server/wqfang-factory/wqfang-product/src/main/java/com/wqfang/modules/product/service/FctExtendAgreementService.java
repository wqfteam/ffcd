package com.wqfang.modules.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.product.entity.FctExtendAgreementEntity;

import java.util.Map;

/**
 * 产品功能扩充协议表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
public interface FctExtendAgreementService extends IService<FctExtendAgreementEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

