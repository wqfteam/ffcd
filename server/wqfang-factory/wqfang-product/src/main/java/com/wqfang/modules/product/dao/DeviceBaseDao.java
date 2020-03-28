package com.wqfang.modules.product.dao;

import com.wqfang.modules.product.entity.DeviceBaseEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 产品设备信息表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Mapper
public interface DeviceBaseDao extends BaseMapper<DeviceBaseEntity> {
	
}
