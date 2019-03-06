package com.lanqiao.controller;

import com.github.pagehelper.Page;
import com.lanqiao.service.IUserService;
import com.lanqiao.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/10/14.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    IUserService userService;

    @RequestMapping("search")
    public String searchAll(Integer pageNum, ModelMap map){
        if(pageNum == null){
            pageNum = 1;
        }
        Page<User> page = (Page<User>) this.userService.selectAll(pageNum, 2);
        map.addAttribute("page",page);
        return "message";
    }
}
