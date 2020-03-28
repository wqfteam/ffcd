package com.wqfang.modules.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.FctExtendAgreementDao;
import com.wqfang.modules.product.entity.FctExtendAgreementEntity;
import com.wqfang.modules.product.service.FctExtendAgreementService;


@Service("fctExtendAgreementService")
public class FctExtendAgreementServiceImpl extends ServiceImpl<FctExtendAgreementDao, FctExtendAgreementEntity> implements FctExtendAgreementService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FctExtendAgreementEntity> page = this.page(
                new Query<FctExtendAgreementEntity>().getPage(params),
                new QueryWrapper<FctExtendAgreementEntity>()
        );

        return new PageUtils(page);
    }

}