package com.wqfang.modules.table.controller;

import com.wqfang.common.utils.PageUtils;
import com.wqfang.common.utils.R;
import com.wqfang.fanfan.table.entity.BoardEntity;
import com.wqfang.fanfan.table.service.BoardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 餐桌表
 *
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 22:15:07
 */
@RestController
@RequestMapping("table/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("table:board:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = boardService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{tableId}")
    @RequiresPermissions("table:board:info")
    public R info(@PathVariable("tableId") Integer tableId){
		BoardEntity board = boardService.getById(tableId);

        return R.ok().put("board", board);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("table:board:save")
    public R save(@RequestBody BoardEntity board){
		boardService.save(board);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("table:board:update")
    public R update(@RequestBody BoardEntity board){
		boardService.updateById(board);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("table:board:delete")
    public R delete(@RequestBody Integer[] tableIds){
		boardService.removeByIds(Arrays.asList(tableIds));

        return R.ok();
    }

}
