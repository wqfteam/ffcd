package com.wqfang.modules.product.service.impl;

import com.wqfang.modules.product.entity.ExtendAgreementEntity;
import com.wqfang.modules.product.service.ExtendAgreementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.BaseDao;
import com.wqfang.modules.product.entity.BaseEntity;
import com.wqfang.modules.product.service.BaseService;
import org.springframework.transaction.annotation.Transactional;


@Service("baseService")
public class BaseServiceImpl extends ServiceImpl<BaseDao, BaseEntity> implements BaseService {
    @Autowired
    private ExtendAgreementService service;
    @Override
    @Transactional
    public Boolean saveObj(BaseEntity baseEntity) {
        String productBaseCode=UUID.randomUUID().toString().replaceAll("\\-", "");
        baseEntity.setProductBaseCode(productBaseCode);
        this.baseMapper.saveObj(baseEntity);
        if(baseEntity != null){
            ExtendAgreementEntity agreement = baseEntity.getAgreement();
            agreement.setId(UUID.randomUUID().toString().replaceAll("\\-", ""));
            agreement.setProductBaseCode(baseEntity.getId());
            service.save(agreement);
        }
        return true;
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BaseEntity> page = this.page(
                new Query<BaseEntity>().getPage(params),
                new QueryWrapper<BaseEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public BaseEntity queryInfoById(String id) {
        return this.baseMapper.queryInfoById(id);
    }

    @Override
    public void updateObjById(BaseEntity base) {
        ExtendAgreementEntity agreement = base.getAgreement();
        service.updateById(agreement);
        this.baseMapper.updateById(base);
    }

}