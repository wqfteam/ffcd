package com.wqfang.modules.product.dao;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wqfang.modules.product.entity.BaseEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 产品基础信息表
 * 
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@Mapper
public interface BaseDao extends BaseMapper<BaseEntity> {

    void saveObj(BaseEntity baseEntity);

    BaseEntity queryInfoById(String id);

    List<BaseEntity> querySelectList(Map<String, Object> params);
}
