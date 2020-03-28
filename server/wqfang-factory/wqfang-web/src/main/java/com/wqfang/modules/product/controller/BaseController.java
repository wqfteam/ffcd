package com.wqfang.modules.product.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.BaseEntity;
import com.wqfang.modules.product.service.BaseService;
import com.wqfang.modules.product.service.ExtendAgreementService;
import com.wqfang.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;



/**
 * 产品基础信息表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/base")
public class BaseController extends AbstractController {
    @Autowired
    private BaseService baseService;
    @Autowired
    private ExtendAgreementService extendAgreementService;


    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:base:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = baseService.queryPage(params);

        return R.ok().put("page", page);
    }
    /**
     * 列表
     */
    @RequestMapping("/productSelectlist")
    @RequiresPermissions("product:base:list")
    public R productSelectlist(@RequestParam Map<String, Object> params) {
        QueryWrapper<BaseEntity> eq = new QueryWrapper<BaseEntity>();
        if(params.get("productName") != null){
            eq.like("product_name",params.get("productName"));
        }
        List<BaseEntity> list = baseService.list(eq);

        return R.ok().put("base", list);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:base:info")
    public R info(@PathVariable("id") String id) {
        BaseEntity base= baseService.queryInfoById(id);
        return new R().put("base",base);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:base:save")
    public R save(@RequestBody BaseEntity base) {
        base.setCreateUserId(getUserId());
        baseService.saveObj(base);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:base:update")
    public R update(@RequestBody BaseEntity base) {
        base.setUpdateUserId(getUserId());
        baseService.updateObjById(base);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:base:delete")
    public R delete(@RequestBody String[] ids) {
        baseService.removeByIds(Arrays.asList(ids));


        return R.ok();
    }

}
