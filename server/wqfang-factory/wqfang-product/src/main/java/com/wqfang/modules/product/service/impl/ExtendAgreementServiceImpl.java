package com.wqfang.modules.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.ExtendAgreementDao;
import com.wqfang.modules.product.entity.ExtendAgreementEntity;
import com.wqfang.modules.product.service.ExtendAgreementService;


@Service("extendAgreementService")
public class ExtendAgreementServiceImpl extends ServiceImpl<ExtendAgreementDao, ExtendAgreementEntity> implements ExtendAgreementService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ExtendAgreementEntity> page = this.page(
                new Query<ExtendAgreementEntity>().getPage(params),
                new QueryWrapper<ExtendAgreementEntity>()
        );

        return new PageUtils(page);
    }

}