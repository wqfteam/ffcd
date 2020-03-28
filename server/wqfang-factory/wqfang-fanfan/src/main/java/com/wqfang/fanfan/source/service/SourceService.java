package com.wqfang.fanfan.source.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.fanfan.source.entity.SourceEntity;

import java.util.Map;

/**
 * 文件资源表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 00:00:22
 */
public interface SourceService extends IService<SourceEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

