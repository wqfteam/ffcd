package com.wqfang.fanfan.extend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.fanfan.extend.entity.ExtendFieidEntity;

import java.util.Map;

/**
 * 扩展字段表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 00:08:40
 */
public interface ExtendFieidService extends IService<ExtendFieidEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

