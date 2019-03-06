package com.olts.controller;

import com.olts.service.ITechCategoryService;
import com.olts.vo.Courses;
import com.olts.vo.TechCategory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 普通的javabean作为控制器,用spring-mvc的注解
 * 
 * @Controller注解来标识本类是一个SpringMVC Controller 对象
 * @author gg
 *
 */
	@Controller
	@RequestMapping("/techCate")
	public class TechCategoryController {
		
		@Resource
        ITechCategoryService techCategoryService;
		
		//通过课程ID显示所有知识点
		@RequestMapping("/selectTechCategroy")
		public @ResponseBody List<TechCategory> selectTechCategroy(Integer courseId, ModelMap modeMap){
			/*System.out.println("<<<<<<<<<<");
			System.out.println(courseId);
			System.out.println("<<<<<<<<<<");*/
			List<TechCategory> list = techCategoryService.selectTechCategroy(courseId);
				System.out.println(courseId);
				
			modeMap.addAttribute("tech", list);
			return list;
				
		}
		
		//对应课程增加知识点
		@RequestMapping("/insertTechCategroy")
		public String insertTechCategroy(TechCategory techCategory, ModelMap modeMap){
			techCategoryService.insertTechCategroy(techCategory);
			
			return "JSP页面模板";
		}
		
		//更改知识点
		@RequestMapping("/updateTechCategroy")
		public String updateTechCategroy(TechCategory techCategory, ModelMap modelMap){
			System.out.println(techCategory);
			techCategoryService.updateTechCategroy(techCategory);
			
			return "JSP页面模板";
		
	    }
		
		//删除知识点
		@RequestMapping("/deleteTechCategroy")
		public String deleteTechCategroy(Integer id, ModelMap modelMap){
			System.out.println(id);
			techCategoryService.deleteTechCategroy(id);
			return "JSP页面模板";
		}
		/*
		@RequestMapping("/delete")
		public String delete(Integer courseId, ModelMap modelMap){
			System.out.println(courseId);
			techCategoryService.deleteTechCategroy(courseId);
			return "catagory/questCatagory_input";
		}*/
		
		//增加所有课程
		@RequestMapping("/testSelectAllCourse")
		public @ResponseBody List<Courses> testSelectAllCourse(ModelMap modeMap){
			List<Courses> list = techCategoryService.testSelectAllCourse();
			modeMap.addAttribute("cour", list);
			return list;
		}
	@RequestMapping("/selectBySelective")
	public String selectBySelective(TechCategory techCategory, Integer pageNo, ModelMap modeMap, HttpSession session){


		List<TechCategory> list = techCategoryService.selectBySelective(techCategory);
		modeMap.addAttribute("tech", list);
		return "JSP页面模板";
	}

	}

