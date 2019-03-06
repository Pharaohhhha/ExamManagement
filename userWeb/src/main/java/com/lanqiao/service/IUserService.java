package com.lanqiao.service;

import com.lanqiao.vo.User;

import java.util.List;

/**
 * Created by Administrator on 2018/10/14.
 */
public interface IUserService {

    List<User> selectAll(Integer pageNum,Integer pageSize);
}
