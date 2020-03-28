package com.wqfang.fanfan.table.dao;

import com.wqfang.fanfan.table.entity.BoardEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 餐桌表
 * 
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 22:15:07
 */
@Mapper
public interface BoardDao extends BaseMapper<BoardEntity> {
	
}
