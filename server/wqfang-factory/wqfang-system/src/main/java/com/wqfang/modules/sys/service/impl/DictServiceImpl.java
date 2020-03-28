package com.wqfang.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;
import com.wqfang.modules.sys.dao.DictDao;
import com.wqfang.modules.sys.entity.DictEntity;
import com.wqfang.modules.sys.service.DictService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("dictService")
public class DictServiceImpl extends ServiceImpl<DictDao, DictEntity> implements DictService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DictEntity> page = this.page(
                new Query<DictEntity>().getPage(params),
                new QueryWrapper<DictEntity>()
        );

        return new PageUtils(page);
    }

}