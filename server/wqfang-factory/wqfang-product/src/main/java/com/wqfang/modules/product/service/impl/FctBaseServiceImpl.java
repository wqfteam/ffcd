package com.wqfang.modules.product.service.impl;

import com.wqfang.modules.product.entity.FctExtendAgreementEntity;
import com.wqfang.modules.product.service.FctExtendAgreementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.FctBaseDao;
import com.wqfang.modules.product.entity.FctBaseEntity;
import com.wqfang.modules.product.service.FctBaseService;
import org.springframework.transaction.annotation.Transactional;


@Service("fctBaseService")
public class FctBaseServiceImpl extends ServiceImpl<FctBaseDao, FctBaseEntity> implements FctBaseService {
    @Autowired
    private FctExtendAgreementService agreementService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FctBaseEntity> page = this.page(
                new Query<FctBaseEntity>().getPage(params),
                new QueryWrapper<FctBaseEntity>().eq("product_base_code",params.get("productBaseCode"))
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional
    public void saveObj(FctBaseEntity fctBase) {
        this.baseMapper.saveObj(fctBase);
        FctExtendAgreementEntity agreement = fctBase.getAgreement();
        agreement.setProductFctBaseId(fctBase.getId());
        agreementService.save(agreement);
    }

    @Override
    public FctBaseEntity getObjById(String id) {
        return this.baseMapper.queryObjById(id);
    }

    @Override
    @Transactional
    public void updateObjectById(FctBaseEntity fctBase) {
        this.baseMapper.updateById(fctBase);
        FctExtendAgreementEntity agreement = fctBase.getAgreement();
        if(agreement.getId() == null){
            Map map=new HashMap();
            map.put("product_fct_base_id",fctBase.getId());
            agreementService.removeByMap(map);
            agreement.setProductFctBaseId(fctBase.getId());
            agreementService.save(agreement);
        }else{
            agreementService.updateById(agreement);
        }
    }
}