package com.hhuan.purchasing.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.entity.Plan;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
public interface IPlanService extends IService<Plan> {

    Page<Plan> findPage(Page<Plan> page, String name);

}
