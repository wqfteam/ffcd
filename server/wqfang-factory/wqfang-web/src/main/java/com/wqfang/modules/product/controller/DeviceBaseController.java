package com.wqfang.modules.product.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.DeviceBaseEntity;
import com.wqfang.modules.product.service.DeviceBaseService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;


/**
 * 产品设备信息表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/devicebase")
public class DeviceBaseController {
    @Autowired
    private DeviceBaseService deviceBaseService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:devicebase:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = deviceBaseService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:devicebase:info")
    public R info(@PathVariable("id") String id){
		DeviceBaseEntity deviceBase = deviceBaseService.getById(id);

        return R.ok().put("deviceBase", deviceBase);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:devicebase:save")
    public R save(@RequestBody DeviceBaseEntity deviceBase){
        deviceBase.setCreateTime(new Date());
		deviceBaseService.save(deviceBase);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:devicebase:update")
    public R update(@RequestBody DeviceBaseEntity deviceBase){
		deviceBaseService.updateById(deviceBase);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:devicebase:delete")
    public R delete(@RequestBody String[] ids){
		deviceBaseService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
