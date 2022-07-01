package com.hhuan.purchasing.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.entity.Plan;
import com.hhuan.purchasing.mapper.PlanMapper;
import com.hhuan.purchasing.service.IPlanService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
@Service
public class PlanServiceImpl extends ServiceImpl<PlanMapper, Plan> implements IPlanService {

    @Resource
    private PlanMapper planMapper;

    @Override
    public Page<Plan> findPage(Page<Plan> page, String name) {
        return planMapper.findPage(page, name);
    }

}
