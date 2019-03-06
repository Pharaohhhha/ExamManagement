package com.olts.controller;

import com.github.pagehelper.Page;
import com.olts.service.IFspQuestionsService;
import com.olts.vo.Courses;
//import com.olts.vo.Examination;
import com.olts.vo.FspQuestions;
import com.olts.vo.TechCategory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zc1 on 2018/10/9.
 */
@Controller
@RequestMapping("/fspQuestion")
public class FspQuestionController {

    static Logger logger = Logger.getLogger(FspQuestionController.class);

    @Autowired
    IFspQuestionsService fspQuestionsService;

    @RequestMapping(value = "/selCourse",method = RequestMethod.GET)
    @ResponseBody
    public List<Courses> loadCourse() { // @ResponseBody也可加到返回类型的前面
        return this.fspQuestionsService.selectCourses();
    }

    @RequestMapping(value = "/selTechCategory",method = RequestMethod.GET)
    @ResponseBody
    public List<TechCategory> loadTechCategoryByCourse(@RequestParam("id") Integer courseId) { // @ResponseBody也可加到返回类型的前面
        return fspQuestionsService.selectTechCategoryByCourseId(courseId);
    }

    @RequestMapping(value = "/selAllTechCategory",method = RequestMethod.GET)
    @ResponseBody
    public List<TechCategory> loadTechCategory() { // @ResponseBody也可加到返回类型的前面
        return this.fspQuestionsService.selectTechCategory();
    }

    @RequestMapping("/search")
    public String search(FspQuestions fspQuestions, Integer pageNum, ModelMap modelMap, HttpSession session) {
        // 查询
        if(pageNum == null){
            pageNum = 1;
            //保存查询条件
            session.setAttribute("selective", fspQuestions);
        }else{ // 翻页
            fspQuestions = (FspQuestions) session.getAttribute("selective");
        }
        Page<FspQuestions> page = (Page<FspQuestions>) this.fspQuestionsService.selectBySelective(fspQuestions, pageNum, 6);
        modelMap.addAttribute("page", page);

        return "question/selectFspQuestion";
    }

    @RequestMapping("/update")
    public String update(FspQuestions fspQuestions,ModelMap modelMap) {
        // 查询
        modelMap.addAttribute("flaggg","false");
        int i = fspQuestionsService.update(fspQuestions);
        if(i==1){
            modelMap.addAttribute("flaggg","true");
            //3添加成功
        }
        return "question/selectFspQuestion";
    }

    @RequestMapping(value = "/delete")
    public String delect(Integer id,ModelMap modelMap) { // @ResponseBody也可加到返回类型的前面
        int delete = this.fspQuestionsService.delete(id);
        modelMap.addAttribute("flagg","false");

        if(delete==1){
            modelMap.addAttribute("flagg","true");
            //3添加成功
        }

        return "question/selectFspQuestion";
    }

}
