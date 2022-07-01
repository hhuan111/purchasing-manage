package com.hhuan.purchasing.mapper;

import com.hhuan.purchasing.dto.UserPasswordDto;
import com.hhuan.purchasing.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
public interface UserMapper extends BaseMapper<User> {

    @Update("update sys_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDto userPasswordDTO);

}
