package com.wqfang.modules.source.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.fanfan.source.entity.SourceEntity;
import com.wqfang.fanfan.source.service.SourceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 文件资源表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 00:00:22
 */
@RestController
@RequestMapping("source/source")
public class SourceController {
    @Autowired
    private SourceService sourceService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("source:source:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sourceService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("source:source:info")
    public R info(@PathVariable("id") Integer id){
		SourceEntity source = sourceService.getById(id);

        return R.ok().put("source", source);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("source:source:save")
    public R save(@RequestBody SourceEntity source){
		sourceService.save(source);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("source:source:update")
    public R update(@RequestBody SourceEntity source){
		sourceService.updateById(source);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("source:source:delete")
    public R delete(@RequestBody Integer[] ids){
		sourceService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
