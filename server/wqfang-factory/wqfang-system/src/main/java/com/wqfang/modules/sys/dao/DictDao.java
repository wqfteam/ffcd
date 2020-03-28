package com.wqfang.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wqfang.modules.sys.entity.DictEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 字典表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:54:34
 */
@Mapper
public interface DictDao extends BaseMapper<DictEntity> {
	
}
