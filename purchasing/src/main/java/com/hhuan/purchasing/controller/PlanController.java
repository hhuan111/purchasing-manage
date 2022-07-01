package com.hhuan.purchasing.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.common.Result;
import com.hhuan.purchasing.entity.Plan;
import com.hhuan.purchasing.service.IPlanService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
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
@RequestMapping("/plan")
public class PlanController {

    @Resource
    private IPlanService planService;

    @PostMapping
    public Result save(@RequestBody Plan plan) {
        planService.saveOrUpdate(plan);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        planService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        planService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(planService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(planService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {
        //QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        //if (!"".equals(name)) {
        //   queryWrapper.like("name", name);
        //}
        //queryWrapper.orderByDesc("id");
        //return Result.success(orderService.page(new Page<>(pageNum, pageSize), queryWrapper));
        Page<Plan> page = planService.findPage(new Page<>(pageNum, pageSize), name);
        return Result.success(page);

    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Plan> list = planService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("name", "采购计划名称");
        writer.addHeaderAlias("departmentId", "采购单位");
        writer.addHeaderAlias("total", "采购总额");
        writer.addHeaderAlias("information", "采购计划信息");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("采购计划信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }

    /**
     * excel 导入
     *
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 方式1：(推荐) 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        //List<User> list = reader.readAll(User.class);

        List<List<Object>> list = reader.read(1);
        List<Plan> orders = CollUtil.newArrayList();
        for (List<Object> row : list) {
            Plan plan = new Plan();
            plan.setName(row.get(0).toString());
            plan.setInformation(row.get(1).toString());
            orders.add(plan);
        }
        planService.saveBatch(orders);
        return Result.success(true);
    }

}

