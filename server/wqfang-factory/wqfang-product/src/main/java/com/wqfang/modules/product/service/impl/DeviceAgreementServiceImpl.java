package com.wqfang.modules.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.DeviceAgreementDao;
import com.wqfang.modules.product.entity.DeviceAgreementEntity;
import com.wqfang.modules.product.service.DeviceAgreementService;


@Service("deviceAgreementService")
public class DeviceAgreementServiceImpl extends ServiceImpl<DeviceAgreementDao, DeviceAgreementEntity> implements DeviceAgreementService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DeviceAgreementEntity> page = this.page(
                new Query<DeviceAgreementEntity>().getPage(params),
                new QueryWrapper<DeviceAgreementEntity>()
        );

        return new PageUtils(page);
    }

}