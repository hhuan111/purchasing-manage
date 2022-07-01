package com.hhuan.purchasing.dto;

import com.hhuan.purchasing.entity.Menu;
import lombok.Data;

import java.util.List;

@Data
public class UserDto {

    private String username;
    private String password;
    private String nickname;
    private String email;
    private String phone;
    private String department;
    private String address;
    private String ava;
    private String role;
    private String token;
    private List<Menu> menus;

}
