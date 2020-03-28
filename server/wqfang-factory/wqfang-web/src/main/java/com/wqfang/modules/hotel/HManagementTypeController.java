package com.wqfang.modules.hotel;

import java.util.Arrays;
import java.util.Map;

import com.wqfang.modules.hotel.entity.HManagementTypeEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wqfang.modules.hotel.service.HManagementTypeService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;



/**
 *
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2020-03-23 23:58:55
 */
@RestController
@RequestMapping("hotel/hmanagementtype")
public class HManagementTypeController {
    @Autowired
    private HManagementTypeService hManagementTypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("hotel:hmanagementtype:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = hManagementTypeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("hotel:hmanagementtype:info")
    public R info(@PathVariable("id") Long id){
		HManagementTypeEntity hManagementType = hManagementTypeService.getById(id);

        return R.ok().put("hManagementType", hManagementType);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("hotel:hmanagementtype:save")
    public R save(@RequestBody HManagementTypeEntity hManagementType){
		hManagementTypeService.save(hManagementType);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("hotel:hmanagementtype:update")
    public R update(@RequestBody HManagementTypeEntity hManagementType){
		hManagementTypeService.updateById(hManagementType);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("hotel:hmanagementtype:delete")
    public R delete(@RequestBody Long[] ids){
		hManagementTypeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
