package com.wqfang.modules.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.product.dao.DeviceBaseDao;
import com.wqfang.modules.product.entity.DeviceBaseEntity;
import com.wqfang.modules.product.service.DeviceBaseService;


@Service("deviceBaseService")
public class DeviceBaseServiceImpl extends ServiceImpl<DeviceBaseDao, DeviceBaseEntity> implements DeviceBaseService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DeviceBaseEntity> page = this.page(
                new Query<DeviceBaseEntity>().getPage(params),
                new QueryWrapper<DeviceBaseEntity>()
        );

        return new PageUtils(page);
    }

}