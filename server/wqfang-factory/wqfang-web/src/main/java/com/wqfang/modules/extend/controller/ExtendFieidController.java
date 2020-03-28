package com.wqfang.modules.extend.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.fanfan.extend.entity.ExtendFieidEntity;
import com.wqfang.fanfan.extend.service.ExtendFieidService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 扩展字段表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 00:08:40
 */
@RestController
@RequestMapping("extend/extendfieid")
public class ExtendFieidController {
    @Autowired
    private ExtendFieidService extendFieidService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("extend:extendfieid:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = extendFieidService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("extend:extendfieid:info")
    public R info(@PathVariable("id") Integer id){
		ExtendFieidEntity extendFieid = extendFieidService.getById(id);

        return R.ok().put("extendFieid", extendFieid);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("extend:extendfieid:save")
    public R save(@RequestBody ExtendFieidEntity extendFieid){
		extendFieidService.save(extendFieid);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("extend:extendfieid:update")
    public R update(@RequestBody ExtendFieidEntity extendFieid){
		extendFieidService.updateById(extendFieid);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("extend:extendfieid:delete")
    public R delete(@RequestBody Integer[] ids){
		extendFieidService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
