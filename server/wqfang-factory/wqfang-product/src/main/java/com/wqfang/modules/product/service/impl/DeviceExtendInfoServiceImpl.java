package com.wqfang.modules.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.DeviceExtendInfoDao;
import com.wqfang.modules.product.entity.DeviceExtendInfoEntity;
import com.wqfang.modules.product.service.DeviceExtendInfoService;


@Service("deviceExtendInfoService")
public class DeviceExtendInfoServiceImpl extends ServiceImpl<DeviceExtendInfoDao, DeviceExtendInfoEntity> implements DeviceExtendInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DeviceExtendInfoEntity> page = this.page(
                new Query<DeviceExtendInfoEntity>().getPage(params),
                new QueryWrapper<DeviceExtendInfoEntity>()
        );

        return new PageUtils(page);
    }

}