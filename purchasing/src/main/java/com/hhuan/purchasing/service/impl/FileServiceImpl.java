package com.hhuan.purchasing.service.impl;

import com.hhuan.purchasing.entity.Files;
import com.hhuan.purchasing.mapper.FileMapper;
import com.hhuan.purchasing.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, Files> implements IFileService {

}
