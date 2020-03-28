package com.wqfang.modules.table.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.fanfan.table.entity.RegionEntity;
import com.wqfang.fanfan.table.service.RegionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 餐桌区域表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 22:15:07
 */
@RestController
@RequestMapping("table/region")
public class RegionController {
    @Autowired
    private RegionService regionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("table:region:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = regionService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{regionId}")
    @RequiresPermissions("table:region:info")
    public R info(@PathVariable("regionId") Integer regionId){
		RegionEntity region = regionService.getById(regionId);

        return R.ok().put("region", region);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("table:region:save")
    public R save(@RequestBody RegionEntity region){
		regionService.save(region);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("table:region:update")
    public R update(@RequestBody RegionEntity region){
		regionService.updateById(region);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("table:region:delete")
    public R delete(@RequestBody Integer[] regionIds){
		regionService.removeByIds(Arrays.asList(regionIds));

        return R.ok();
    }

}
