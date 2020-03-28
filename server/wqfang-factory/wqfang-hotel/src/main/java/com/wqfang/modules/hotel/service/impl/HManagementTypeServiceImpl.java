package com.wqfang.modules.hotel.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.modules.hotel.dao.HManagementTypeDao;
import com.wqfang.modules.hotel.entity.HManagementTypeEntity;
import com.wqfang.modules.hotel.service.HManagementTypeService;


@Service("hManagementTypeService")
public class HManagementTypeServiceImpl extends ServiceImpl<HManagementTypeDao, HManagementTypeEntity> implements HManagementTypeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<HManagementTypeEntity> page = this.page(
                new Query<HManagementTypeEntity>().getPage(params),
                new QueryWrapper<HManagementTypeEntity>()
        );

        return new PageUtils(page);
    }

}