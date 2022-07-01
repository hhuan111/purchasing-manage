package com.hhuan.purchasing.service;

import com.hhuan.purchasing.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);

}
