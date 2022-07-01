package com.hhuan.purchasing.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.common.Result;
import com.hhuan.purchasing.entity.Dept;
import com.hhuan.purchasing.entity.Purchase;
import com.hhuan.purchasing.service.IDeptService;
import com.hhuan.purchasing.service.IPurchaseService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
@RestController
@RequestMapping("/purchase")
public class PurchaseController {

    @Resource
    private IPurchaseService purchaseService;

    @Resource
    private IDeptService deptService;

    @PostMapping
    public Result save(@RequestBody Purchase purchase) {
        purchaseService.saveOrUpdate(purchase);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        purchaseService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        purchaseService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(purchaseService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(purchaseService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {
        QueryWrapper<Purchase> queryWrapper = new QueryWrapper<>();
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        queryWrapper.orderByDesc("id");
        Page<Purchase> page = purchaseService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<Purchase> records = page.getRecords();
        for (Purchase record : records) {
            Dept dept = deptService.getById(record.getDepartmentId());
            if (dept != null) {
                record.setDepartment(dept.getName());
            }
        }
        return Result.success(page);
    }

}

