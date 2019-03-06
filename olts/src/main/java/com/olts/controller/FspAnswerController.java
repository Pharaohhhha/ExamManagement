package com.olts.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olts.service.IOltsScoreService;
import com.olts.service.IUserService;
import com.olts.vo.Examination;
import com.olts.vo.FspAnswer;
import com.olts.vo.OltsScore;
import com.olts.vo.OltsUser;

/**
 * 普通的javabean作为控制器,用spring-mvc的注解
 * 
 * @Controller注解来标识本类是一个SpringMVC Controller 对象
 * @author gg
 *
 */
@Controller
@RequestMapping("/admin")
public class FspAnswerController {

	@Resource
	IUserService userService;
	@Resource
	IOltsScoreService oltsScoreService;
	
	
	
	@RequestMapping("/showStuFspAnswer")
	public String showStuFspAnswer(FspAnswer fspAnswer,ModelMap modelMap){	
		List<OltsUser> student = userService.selectStudentAndAnswer(fspAnswer);
		
		OltsScore oltsScore = new OltsScore();
		oltsScore.setExamNo(fspAnswer.getExam_no());
		List<OltsScore> listScore = oltsScoreService.selectByNo(oltsScore);
		
		modelMap.addAttribute("stuList", student);
		modelMap.addAttribute("listScore", listScore);
		
		return "examination/csp_answer_list";	
	}
	
}
