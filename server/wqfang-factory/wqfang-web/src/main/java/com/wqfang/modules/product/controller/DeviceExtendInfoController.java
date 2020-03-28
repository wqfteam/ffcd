package com.wqfang.modules.product.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.DeviceExtendInfoEntity;
import com.wqfang.modules.product.service.DeviceExtendInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 设备信息扩展表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/deviceextendinfo")
public class DeviceExtendInfoController {
    @Autowired
    private DeviceExtendInfoService deviceExtendInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:deviceextendinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = deviceExtendInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:deviceextendinfo:info")
    public R info(@PathVariable("id") String id){
		DeviceExtendInfoEntity deviceExtendInfo = deviceExtendInfoService.getById(id);

        return R.ok().put("deviceExtendInfo", deviceExtendInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:deviceextendinfo:save")
    public R save(@RequestBody DeviceExtendInfoEntity deviceExtendInfo){
		deviceExtendInfoService.save(deviceExtendInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:deviceextendinfo:update")
    public R update(@RequestBody DeviceExtendInfoEntity deviceExtendInfo){
		deviceExtendInfoService.updateById(deviceExtendInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:deviceextendinfo:delete")
    public R delete(@RequestBody String[] ids){
		deviceExtendInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
