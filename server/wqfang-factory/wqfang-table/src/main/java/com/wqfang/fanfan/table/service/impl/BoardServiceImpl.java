package com.wqfang.fanfan.table.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.Query;

import com.wqfang.fanfan.table.dao.BoardDao;
import com.wqfang.fanfan.table.entity.BoardEntity;
import com.wqfang.fanfan.table.service.BoardService;


@Service("boardService")
public class BoardServiceImpl extends ServiceImpl<BoardDao, BoardEntity> implements BoardService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BoardEntity> page = this.page(
                new Query<BoardEntity>().getPage(params),
                new QueryWrapper<BoardEntity>()
        );

        return new PageUtils(page);
    }

}