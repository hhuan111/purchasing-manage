package com.hhuan.purchasing.utils;

import cn.hutool.core.date.DateUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.hhuan.purchasing.entity.User;
import com.hhuan.purchasing.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Slf4j
@Component
public class TokenUtils {

    @Autowired
    private UserMapper userMapper;

    private static UserMapper staticUserMapper;

    //@Resource
    //private IUserService userService;

    @PostConstruct
    public void init(){
        staticUserMapper = userMapper;
    }

    /**
     * 生成token
     *
     * @return
     */
    public static String genToken(String userId, String sign) {
        return JWT.create().withAudience(userId) // 将 user id 保存到 token 里面,作为载荷
                .withExpiresAt(DateUtil.offsetHour(new Date(), 2)) // 2小时后token过期
                .sign(Algorithm.HMAC256(sign)); // 以 password 作为 token 的密钥
    }

    public static User getUser() {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
            String aud =JWT.decode(token).getAudience().get(0);
            Integer userId=Integer.valueOf(aud);
            return staticUserMapper.selectById(userId);
            // if (StrUtil.isNotBlank(token)) {
            //    String userId = JWT.decode(token).getAudience().get(0);
            //   return staticUserService.getById(Integer.valueOf(userId));
            //}
        } catch (Exception e) {
            log.error("解析token失败",e);
            return null;
        }
        //return null;
    }
}
