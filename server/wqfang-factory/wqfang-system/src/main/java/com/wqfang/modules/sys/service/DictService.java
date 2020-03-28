package com.wqfang.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.modules.sys.entity.DictEntity;

import java.util.Map;

/**
 * 字典表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:54:34
 */
public interface DictService extends IService<DictEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

