package com.hhuan.purchasing.service;

import com.hhuan.purchasing.dto.UserDto;
import com.hhuan.purchasing.dto.UserPasswordDto;
import com.hhuan.purchasing.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
public interface IUserService extends IService<User> {

    UserDto login(UserDto userDto);

    User register(UserDto userDto);

    void updatePassword(UserPasswordDto userPasswordDTO);

}
