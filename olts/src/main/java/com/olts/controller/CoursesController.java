package com.olts.controller;

import com.olts.service.ICoursesService;
import com.olts.vo.Courses;
import com.olts.vo.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/courses")
public class CoursesController {
	
	@Resource
    ICoursesService coursesService;
	/**
	 * 查询出所有课程
	 */
//	@RequestMapping("/testSelectAllCourse")
//	public String testSelectAllCourse(ModelMap modeMap){
//		List<Courses> list = coursesService.testSelectAllCourse();
//		modeMap.addAttribute("cour", list);
//		return "catagory/course";
//	}
	
	/**
	 * 新增课程号
	 */
	@RequestMapping("/insertCourse")
	public String insertCourse(Courses courses, ModelMap modeMap){
		if ((courses.getCourseName()).equals(courses.getCourseName())){
			System.out.println("该课程已经存在，请重新添加"+courses.getCourseName());
		}
		coursesService.insertCourse(courses);
		return "redirect:/courses/selectAllCourse";
	}
	

	
	/**
	 * 通过id查找课程号
	 */
	@RequestMapping("/selectCoursesById/{id}")
	public String selectCoursesById(Integer id,ModelMap modeMap){
		coursesService.selectCoursesById(id);
		return "catagory/course";
	}
	
	/**
	 * 更新课程
	 */
	@RequestMapping("/update")
	@ResponseBody
	public void update(Integer arrtd, String courseName, Courses courses, ModelMap modelMap){
		System.out.println(courses);
		courses.setId(arrtd);
		courses.setTempName(courseName);
		System.out.println(arrtd+courseName);
		coursesService.update(courses);
	}
	
	/**
	 * 删除课程
	 */
	@RequestMapping("/delete")
	public String delete(Integer id, ModelMap modelMap){
		System.out.println(id);
		coursesService.delete(id);
		return "catagory/course";
	}
	

	@RequestMapping("/selectAllCourse")
	public String selectAllCourse(Courses courses, Integer pageNo, ModelMap modeMap, HttpSession session){
		
		Page<Courses> page = (Page<Courses>) session.getAttribute("coursePage");
		if(page==null || pageNo== null){
			
			page = new Page<Courses>(courses);
			page.setPageNo(1);
			page.setPageSize(5);
			int totalRow = coursesService.countForSelective(page);
			page.setTotalRow(totalRow);
		}else {
			page.setPageNo(pageNo);
		}
		
		List<Courses> list = coursesService.selectAllCourse(page);
		modeMap.addAttribute("cour", list);
		session.setAttribute("coursePage", page);
		return "forward:/views/catagory/course.jsp";
	}

	@RequestMapping("/selectBySelective")
	public String search(Courses courses, Integer pageNum, ModelMap modelMap, HttpSession session) {
		if(pageNum == null){
			pageNum = 1;
			//保存查询条件
			session.setAttribute("selective", courses);
		}else{ // 翻页
			courses = (Courses) session.getAttribute("selective");
		}
		com.github.pagehelper.Page<Courses> page = (com.github.pagehelper.Page<Courses>) this.coursesService.selectBySelective(courses, pageNum, 5);
		modelMap.addAttribute("mypage", page);
		return "catagory/courseList";
	}
}
