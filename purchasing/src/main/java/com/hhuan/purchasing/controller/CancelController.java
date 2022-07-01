package com.hhuan.purchasing.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.common.Result;
import com.hhuan.purchasing.entity.Cancel;
import com.hhuan.purchasing.entity.Dept;
import com.hhuan.purchasing.service.ICancelService;
import com.hhuan.purchasing.service.IDeptService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
@RestController
@RequestMapping("/cancel")
public class CancelController {

    @Resource
    private ICancelService cancelService;

    @Resource
    private IDeptService deptService;

    @PostMapping
    public Result save(@RequestBody Cancel cancel) {
        cancelService.saveOrUpdate(cancel);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        cancelService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        cancelService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(cancelService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(cancelService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {
        QueryWrapper<Cancel> queryWrapper = new QueryWrapper<>();
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        queryWrapper.orderByDesc("id");
        Page<Cancel> page = cancelService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<Cancel> records = page.getRecords();
        for (Cancel record : records) {
            Dept dept = deptService.getById(record.getDepartmentId());
            if (dept != null) {
                record.setDepartment(dept.getName());
            }
        }
        return Result.success(page);
    }

}
