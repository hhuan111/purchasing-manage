package com.hhuan.purchasing.service;

import com.hhuan.purchasing.entity.Role;
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
public interface IRoleService extends IService<Role> {

    List<Integer> getRoleMenu(Integer roleId);

    void setRoleMenu(Integer roleId, List<Integer> menuIds);

}
