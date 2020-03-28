package com.wqfang.modules.sys.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.additional.query.impl.QueryChainWrapper;
import com.wqfang.modules.sys.entity.SysConfigEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wqfang.modules.sys.entity.DictEntity;
import com.wqfang.modules.sys.service.DictService;
import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;



/**
 * 字典表
 *
 * @author wqfang
 * @email admin@admin.com
 * @date 2019-09-19 20:09:23
 */
@RestController
@RequestMapping("sys/dict")
public class DictController {
    @Autowired
    private DictService dictService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:dict:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = dictService.queryPage(params);

        return R.ok().put("page", page);
    }
    /**
     * 列表
     */
    @RequestMapping("/allList")
    @RequiresPermissions("sys:dict:list")
    public R allList(@RequestParam Map<String, Object> params){
//        PageUtils page = dictService.queryPage(params);
        QueryWrapper<DictEntity> eq = new QueryWrapper<DictEntity>().eq("type", params.get("type"));
        if(params.get("name") != null){
            eq.like("name",params.get("name"));
        }
        List<DictEntity> list = dictService.list(eq);

        return R.ok().put("list", list);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:dict:info")
    public R info(@PathVariable("id") String id){
        DictEntity dict = dictService.getById(id);

        return R.ok().put("dict", dict);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:dict:save")
    public R save(@RequestBody DictEntity dict){
        dictService.save(dict);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:dict:update")
    public R update(@RequestBody DictEntity dict){
        dictService.updateById(dict);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:dict:delete")
    public R delete(@RequestBody String[] ids){
        dictService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
