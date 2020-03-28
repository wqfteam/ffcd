package com.wqfang.fanfan.table.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.fanfan.table.dao.RegionDao;
import com.wqfang.fanfan.table.entity.RegionEntity;
import com.wqfang.fanfan.table.service.RegionService;


@Service("regionService")
public class RegionServiceImpl extends ServiceImpl<RegionDao, RegionEntity> implements RegionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RegionEntity> page = this.page(
                new Query<RegionEntity>().getPage(params),
                new QueryWrapper<RegionEntity>()
        );

        return new PageUtils(page);
    }

}