package com.olts.controller;

import com.olts.service.IOltsUserService;
import com.olts.vo.OltsUser;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 *
 * @author 123
 * @date 2018/10/7
 */
@Controller
@RequestMapping("/user") // url和类绑定
public class OltsUserController {

    static Logger logger = Logger.getLogger(OltsUserController.class);

    @Autowired
    private IOltsUserService iOltsUserService;


    @RequestMapping("/login")  // /user/login
    public String login(OltsUser user, ModelMap modelMap, HttpSession session) {
        logger.debug("登录：" + user);
        OltsUser usersInfo = iOltsUserService.selectByLogin(user);
        if (usersInfo != null) {
            session.setAttribute("logUser", usersInfo);
            modelMap.put("userJudge", "T");
            return "forward:/index.jsp";
        } else {
            modelMap.put("userJudge", "F");
            return "forward:/login.jsp";
        }
        // 会被InternalResourceViewResolver解析成一个页面：(prefix + string + suffix) = /views/success.jsp
        // springmvc默认页面导航为请求转发
    }

}