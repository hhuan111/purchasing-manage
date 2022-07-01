package com.hhuan.purchasing.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.common.Result;
import com.hhuan.purchasing.entity.Dept;
import com.hhuan.purchasing.mapper.DeptTypeMapper;
import com.hhuan.purchasing.service.IDeptService;
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
@RequestMapping("/dept")
public class DeptController {

    @Resource
    private IDeptService deptService;

    @Resource
    private DeptTypeMapper deptTypeMapper;

    @PostMapping
    public Result save(@RequestBody Dept dept) {
        deptService.saveOrUpdate(dept);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        deptService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        deptService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(deptService.list());
    }

    @GetMapping("/deptTypes")
    public Result getDeptTypes() {
        return Result.success(deptTypeMapper.selectList(null));
    }


    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(deptService.getById(id));
    }


    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {
        QueryWrapper<Dept> queryWrapper = new QueryWrapper<>();
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        queryWrapper.orderByDesc("id");
        return Result.success(deptService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
     * 导出接口
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Dept> list = deptService.list();
        // 通过工具类创建writer 写出到磁盘路径
        //ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("name", "单位名称");
        writer.addHeaderAlias("code", "机构代码");
        writer.addHeaderAlias("actor", "单位性质");
        writer.addHeaderAlias("address", "地址");
        writer.addHeaderAlias("charger", "负责人");
        writer.addHeaderAlias("phone", "联系方式");
        writer.addHeaderAlias("email", "单位邮箱");
        writer.addHeaderAlias("telephone", "办公电话");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("单位信息", "UTF-8");
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
        List<Dept> departments = CollUtil.newArrayList();
        for (List<Object> row : list) {
            Dept dept = new Dept();
            dept.setName(row.get(0).toString());
            dept.setCode(row.get(1).toString());
            dept.setActor(row.get(2).toString());
            dept.setAddress(row.get(3).toString());
            dept.setCharger(row.get(4).toString());
            dept.setPhone(row.get(5).toString());
            dept.setEmail(row.get(6).toString());
            dept.setTelephone(row.get(7).toString());
            departments.add(dept);
        }
        deptService.saveBatch(departments);
        return Result.success(true);
    }

}

