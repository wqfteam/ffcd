package com.wqfang.modules.product.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.FctExtendAgreementEntity;
import com.wqfang.modules.product.service.FctExtendAgreementService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 产品功能扩充协议表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/fctextendagreement")
public class FctExtendAgreementController {
    @Autowired
    private FctExtendAgreementService fctExtendAgreementService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:fctextendagreement:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = fctExtendAgreementService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:fctextendagreement:info")
    public R info(@PathVariable("id") String id){
		FctExtendAgreementEntity fctExtendAgreement = fctExtendAgreementService.getById(id);

        return R.ok().put("fctExtendAgreement", fctExtendAgreement);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:fctextendagreement:save")
    public R save(@RequestBody FctExtendAgreementEntity fctExtendAgreement){
		fctExtendAgreementService.save(fctExtendAgreement);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:fctextendagreement:update")
    public R update(@RequestBody FctExtendAgreementEntity fctExtendAgreement){
		fctExtendAgreementService.updateById(fctExtendAgreement);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:fctextendagreement:delete")
    public R delete(@RequestBody String[] ids){
		fctExtendAgreementService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
