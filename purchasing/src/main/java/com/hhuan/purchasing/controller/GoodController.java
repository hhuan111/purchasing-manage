package com.hhuan.purchasing.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.common.Result;
import com.hhuan.purchasing.entity.Good;
import com.hhuan.purchasing.entity.Supplier;
import com.hhuan.purchasing.mapper.GoodTypeMapper;
import com.hhuan.purchasing.service.IGoodService;
import com.hhuan.purchasing.service.ISupplierService;
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
@RequestMapping("/good")
public class GoodController {

    @Resource
    private IGoodService goodService;

    @Resource
    private GoodTypeMapper goodTypeMapper;

    @Resource
    private ISupplierService supplierService;

    @PostMapping
    public Result save(@RequestBody Good good) {
        goodService.saveOrUpdate(good);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        goodService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        goodService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(goodService.list());
    }

    @GetMapping("/goodTypes")
    public Result getGoodTypes() {
        return Result.success(goodTypeMapper.selectList(null));
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(goodService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String goodname) {
        QueryWrapper<Good> queryWrapper = new QueryWrapper<>();
        if (!"".equals(goodname)) {
            queryWrapper.like("name", goodname);
        }
        queryWrapper.orderByDesc("id");
        Page<Good> page = goodService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<Good> records = page.getRecords();
        for (Good record : records) {
            Supplier supplier = supplierService.getById(record.getSupplierId());
            if (supplier != null) {
                record.setSupplier(supplier.getName());
            }
        }
        return Result.success(page);

    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Good> list = goodService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("goodname", "商品名称");
        writer.addHeaderAlias("price", "商品单价");
        writer.addHeaderAlias("type", "商品类型");
        writer.addHeaderAlias("supplierId", "供应商");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("商品信息", "UTF-8");
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
        List<Good> goods = CollUtil.newArrayList();
        for (List<Object> row : list) {
            Good good = new Good();
            good.setName(row.get(0).toString());
            goods.add(good);
        }
        goodService.saveBatch(goods);
        return Result.success(true);
    }

}

