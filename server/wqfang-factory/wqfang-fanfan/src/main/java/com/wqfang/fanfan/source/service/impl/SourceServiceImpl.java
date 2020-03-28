package com.wqfang.fanfan.source.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.fanfan.source.dao.SourceDao;
import com.wqfang.fanfan.source.entity.SourceEntity;
import com.wqfang.fanfan.source.service.SourceService;


@Service("sourceService")
public class SourceServiceImpl extends ServiceImpl<SourceDao, SourceEntity> implements SourceService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SourceEntity> page = this.page(
                new Query<SourceEntity>().getPage(params),
                new QueryWrapper<SourceEntity>()
        );

        return new PageUtils(page);
    }

}