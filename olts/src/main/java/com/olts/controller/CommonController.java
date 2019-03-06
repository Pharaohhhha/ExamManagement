package com.olts.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.olts.service.IExaminationService;

/**
 * Created by Administrator on 2018/10/8.
 */

@Controller
@RequestMapping("/")
public class CommonController {
	static Logger logger = Logger.getLogger(SmdQuestionsController.class);
	
	@Resource 
	IExaminationService examinationService;
	
	@RequestMapping("showRadio")
	public String showRadio() {
		logger.info("showRadio=========================");
		return "redirect:/views/question/radio_input.jsp";
	}
	
	@RequestMapping("showExamRadio")
	public String showExamRadio(ModelMap modelMap) {

		logger.info("showExamRadio=========================");
		return "redirect:/views/examination/radio_input.jsp";
	}
	
	@RequestMapping("showTemplet")
	public String showTemplet(){
		logger.info("showRadio=========================");
		return "redirect:/views/user/templet.jsp";
	}
	
	@RequestMapping("showFspAnswerRadio")
	public String showFspAnswerRadio() {
		logger.info("showExamRadio=========================");
		return "redirect:/views/examination/csp_answer_input.jsp";
	}
	
}
