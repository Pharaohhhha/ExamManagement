package com.olts.controller;

import com.github.pagehelper.Page;
import com.olts.service.ICoursesService;
import com.olts.service.IFspQuestionsService;
import com.olts.service.ISmdQuestionsService;
import com.olts.service.ITechCategoryService;
import com.olts.vo.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by TCCCC on 2018/10/8/008.
 */
@Controller
@RequestMapping("/question")
public class SmdQuestionsController {

    @Resource
    ISmdQuestionsService smdQuestionsService;
    @Resource
    IFspQuestionsService fspQuestionsService;
    @Resource
    ICoursesService coursesService;
    @Resource
    ITechCategoryService techCategoryService;
    /**
     * 增加
     * @param smdQuestion
     * @return
     */
    @RequestMapping("/insertSmdQuestion")
    public String insert(SmdQuestions smdQuestion, SmdOptions smdOptions, ModelMap modelMap) {
        int i = this.smdQuestionsService.insertSmdQuestion(smdQuestion,smdOptions);

        if(i==1){
           modelMap.addAttribute("flag","true");
            //3添加成功

        }else {
            modelMap.addAttribute("flag","false");
        }
        return "forward:/views/question/index1.jsp";
    }
    @RequestMapping("/insertjudgeQuestion")
    public String insert(SmdQuestions smdQuestion,ModelMap modelMap) {
        int i = this.smdQuestionsService.insertJudgeQuestion(smdQuestion);
        if(i==1){
            modelMap.addAttribute("flag","true");
            //3添加成功
        }else {
            modelMap.addAttribute("flag","false");
        }
        return "forward:/views/question/index3.jsp";
    }
    @RequestMapping("/insertFspQuestion")
    public String insertFspQuestion(FspQuestions fspQuestion, ModelMap modelMap){
        int i = this.fspQuestionsService.insertFspQuestion(fspQuestion);
        if(i==1){
            modelMap.addAttribute("flag","true");
            //3添加成功
        }else {
            modelMap.addAttribute("flag","false");
        }
        return "forward:/views/question/index4.jsp";
    }
    /**
     * 页面上ajax加载
     * @return
     */
    @RequestMapping(value = "/load_courses") //此方法只能处理GET方式的请求
    @ResponseBody  // 此注解springMVC会使用jackson.jar库将List转换成JSON, [{id:101,name:"海淀"},...]
    public List<Courses> selectAll() { // @ResponseBody也可加到返回类型的前面
        List<Courses> courses = this.coursesService.selectAll();
        return courses;
    }

    /**
     * 页面上ajax加载
     * @param courseId
     * @return
     */
    @RequestMapping(value = "/load_techCategories",method = RequestMethod.GET)
    @ResponseBody
    public List<TechCategory> loadStreetsByDistrictId(@RequestParam("id") Integer courseId) {
        List<TechCategory> techCategories = this.techCategoryService.selectByCourseId(courseId);
        return  techCategories;
    }


    @RequestMapping(value = "/selCourse",method = RequestMethod.GET)
    @ResponseBody
    public List<Courses> loadCourse() { // @ResponseBody也可加到返回类型的前面
        return this.coursesService.selectAll();
    }

    @RequestMapping(value = "/selTechCategory",method = RequestMethod.GET)
    @ResponseBody
    public List<TechCategory> loadTechCategoryByCourse(@RequestParam("id") Integer courseId) { // @ResponseBody也可加到返回类型的前面
        return techCategoryService.selectByCourseId(courseId);
    }

    @RequestMapping("/search")
    public String search(SmdQuestions smdQuestion, Integer pageNum, ModelMap modelMap, HttpSession session) {
        // 查询
        if(pageNum == null){
            pageNum = 1;
            //保存查询条件
            session.setAttribute("selective", smdQuestion);
        }else{ // 翻页
            smdQuestion = (SmdQuestions) session.getAttribute("selective");
        }
        Page<SmdQuestions> page = (Page<SmdQuestions>) this.smdQuestionsService.selectBySelective(smdQuestion, pageNum, 5);
        modelMap.addAttribute("page2", page);

        return "question/a";


    }
    @RequestMapping("/update")
    public String update(SmdQuestions smdQuestions) {
        // 查询
        int i = smdQuestionsService.update(smdQuestions);
        return "question/selectSmdQuestion";
    }

    @RequestMapping(value = "/delete")
    public String delect(Integer id) { // @ResponseBody也可加到返回类型的前面
        this.smdQuestionsService.delete(id);
        return "question/selectSmdQuestion";
    }
}
