package com.wqfang.modules.product.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.modules.product.entity.FctBaseEntity;
import com.wqfang.modules.product.service.FctBaseService;
import com.wqfang.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 产品功能表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 16:53:34
 */
@RestController
@RequestMapping("product/fctbase")
public class FctBaseController extends AbstractController{
    @Autowired
    private FctBaseService fctBaseService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("product:fctbase:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = fctBaseService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("product:fctbase:info")
    public R info(@PathVariable("id") String id){
		FctBaseEntity fctBase = fctBaseService.getObjById(id);

        return R.ok().put("fctBase", fctBase);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("product:fctbase:save")
    public R save(@RequestBody FctBaseEntity fctBase){
        fctBase.setCreateUserId(getUserId());
		fctBaseService.saveObj(fctBase);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("product:fctbase:update")
    public R update(@RequestBody FctBaseEntity fctBase){
		fctBaseService.updateObjectById(fctBase);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("product:fctbase:delete")
    public R delete(@RequestBody String[] ids){
		fctBaseService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
