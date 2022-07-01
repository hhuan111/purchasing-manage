package com.hhuan.purchasing.service.impl;

import com.hhuan.purchasing.entity.Supplier;
import com.hhuan.purchasing.mapper.SupplierMapper;
import com.hhuan.purchasing.service.ISupplierService;
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
public class SupplierServiceImpl extends ServiceImpl<SupplierMapper, Supplier> implements ISupplierService {

    @Resource
    private SupplierMapper supplierMapper;



}
