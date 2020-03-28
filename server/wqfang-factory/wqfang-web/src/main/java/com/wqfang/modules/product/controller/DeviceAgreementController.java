package com.wqfang.modules.product.controller;


import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.DeviceAgreementEntity;
import com.wqfang.modules.product.service.DeviceAgreementService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 设备通信协议参数
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/deviceagreement")
public class DeviceAgreementController {
    @Autowired
    private DeviceAgreementService deviceAgreementService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:deviceagreement:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = deviceAgreementService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:deviceagreement:info")
    public R info(@PathVariable("id") String id){
		DeviceAgreementEntity deviceAgreement = deviceAgreementService.getById(id);

        return R.ok().put("deviceAgreement", deviceAgreement);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:deviceagreement:save")
    public R save(@RequestBody DeviceAgreementEntity deviceAgreement){
		deviceAgreementService.save(deviceAgreement);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:deviceagreement:update")
    public R update(@RequestBody DeviceAgreementEntity deviceAgreement){
		deviceAgreementService.updateById(deviceAgreement);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:deviceagreement:delete")
    public R delete(@RequestBody String[] ids){
		deviceAgreementService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
