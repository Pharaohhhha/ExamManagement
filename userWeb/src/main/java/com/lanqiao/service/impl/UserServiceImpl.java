package com.lanqiao.service.impl;

import com.lanqiao.mapper.UserMapper;
import com.lanqiao.service.IUserService;
import com.lanqiao.vo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/10/14.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    UserMapper userMapper;

    @Override
    public List<User> selectAll(Integer pageNum, Integer pageSize) {
        return this.userMapper.selectAll(pageNum,pageSize);
    }
}
