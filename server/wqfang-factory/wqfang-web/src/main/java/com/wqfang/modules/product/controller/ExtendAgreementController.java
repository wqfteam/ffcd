package com.wqfang.modules.product.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.ExtendAgreementEntity;
import com.wqfang.modules.product.service.ExtendAgreementService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 产品协议信息扩充表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/extendagreement")
public class ExtendAgreementController {
    @Autowired
    private ExtendAgreementService extendAgreementService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:extendagreement:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = extendAgreementService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:extendagreement:info")
    public R info(@PathVariable("id") String id){
		ExtendAgreementEntity extendAgreement = extendAgreementService.getById(id);

        return R.ok().put("extendAgreement", extendAgreement);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:extendagreement:save")
    public R save(@RequestBody ExtendAgreementEntity extendAgreement){
		extendAgreementService.save(extendAgreement);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:extendagreement:update")
    public R update(@RequestBody ExtendAgreementEntity extendAgreement){
		extendAgreementService.updateById(extendAgreement);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:extendagreement:delete")
    public R delete(@RequestBody String[] ids){
		extendAgreementService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
