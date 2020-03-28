package com.wqfang.fanfan.extend.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.fanfan.extend.dao.ExtendFieidDao;
import com.wqfang.fanfan.extend.entity.ExtendFieidEntity;
import com.wqfang.fanfan.extend.service.ExtendFieidService;


@Service("extendFieidService")
public class ExtendFieidServiceImpl extends ServiceImpl<ExtendFieidDao, ExtendFieidEntity> implements ExtendFieidService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ExtendFieidEntity> page = this.page(
                new Query<ExtendFieidEntity>().getPage(params),
                new QueryWrapper<ExtendFieidEntity>()
        );

        return new PageUtils(page);
    }

}