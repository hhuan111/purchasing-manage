package com.hhuan.purchasing.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hhuan.purchasing.entity.Plan;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
public interface PlanMapper extends BaseMapper<Plan> {

    Page<Plan> findPage(Page<Plan> page, @Param("name") String name);

}
