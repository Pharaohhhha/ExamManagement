package com.olts.controller;

import com.olts.service.*;

import com.olts.vo.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import java.util.List;

/**
 * Created by xxxx on 2018/10/7.
 */
@Controller
@RequestMapping("/examination") // url和类绑定
@SessionAttributes({"examming"}) //自动将ModelMap中名为logUser的对象同步到HttpSession中
public class SExaminationController {

    static Logger logger = Logger.getLogger(SExaminationController.class);

    @Autowired
    private IExaminationService iExaminationService;
    @Autowired
    private ISmdQuestionsService smdQuestionsService;
    @Autowired
    private ISmdOptionsService iSmdOptionsService;
    @Autowired
    private IFspQuestionsService iFspQuestionsService;
    @Autowired
    private IOltsScoreService iOltsScoreService;
    @Autowired
    private IFspAnswerService iFspAnswerService;



    /**
     * 页面上ajax加载 考试 下拉列表框
     * @return
     */
    @RequestMapping(value = "/selExam",method = RequestMethod.GET)
    @ResponseBody  // 此注解springMVC会使用jackson.jar库将List转换成JSON, [{id:101,name:"海淀"},...]
    public List<Examination> selExam() { // @ResponseBody也可加到返回类型的前面
        return this.iExaminationService.selectExamination();
    }

    /**
     * 加载 试卷
     * @return
     */
    @RequestMapping(value = "/selExamByNo",method = RequestMethod.GET)
    @ResponseBody  // 此注解springMVC会使用jackson.jar库将List转换成JSON, [{id:101,name:"海淀"},...]
    public String selExamByNo(@RequestParam String examNo,ModelMap modelMap) {
        logger.debug("试卷号" + examNo);
        if (examNo != null) {
            Examination examination = this.iExaminationService.selectExaminationById(examNo);
//            session.setAttribute("examming", examination);
            modelMap.addAttribute("examming",examination);
            return "{\"actionFlag\": true}";
        } else {
            return "{\"actionFlag\": false}";
        }
    }

    /**
     * 页面ajax加载选择题
     * @param questionType
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/loadSmd_question",method = RequestMethod.GET)
    @ResponseBody
    public List<SmdQuestions> loadSmd_question(@RequestParam Integer questionType,ModelMap modelMap) {

        Examination exam = (Examination) modelMap.get("examming");
        //获取当前会话中的试卷的题号列表
        String sQuestions;
        if (questionType == 1){
            sQuestions = exam.getSingleId();
        }else if (questionType == 2){
            sQuestions = exam.getMultipleId();
        }else if (questionType == 3){
            sQuestions = exam.getTrueFalseId();
        }else {
            return null;
        }


        //将题号封装,依次查出对应的题目
        List<String> idList = Arrays.asList(sQuestions.split(","));
        List<SmdQuestions> smdQuestions = new ArrayList<>();
        for (String id : idList) {
            Integer sId = Integer.valueOf(id);
//            SmdQuestions sq = new SmdQuestions();
//            sq.setId(sId);
            smdQuestions.add(this.smdQuestionsService.selectSMDquestionById(sId));
        }
        return smdQuestions;
    }

    /**
     * 页面ajax加载主观题
     * @param questionType
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/loadFsq_question",method = RequestMethod.GET)
    @ResponseBody
    public List<FspQuestions> loadFsq_question(@RequestParam Integer questionType,ModelMap modelMap) {

        Examination exam = (Examination) modelMap.get("examming");
        //获取当前会话中的试卷的题号列表
        String fQuestions;
        if (questionType == 4){
            fQuestions = exam.getFillInGapsId();
        }else if (questionType == 5){
            fQuestions = exam.getSimpleAnwserId();
        }else if (questionType == 6){
            fQuestions = exam.getProgramId();
        }else {
            return null;
        }

        //将题号封装,依次查出对应的题目
        List<String> idList = Arrays.asList(fQuestions.split(","));
        List<FspQuestions> fspQuestions = new ArrayList<>();
        for (String id : idList) {
            Integer fId = Integer.valueOf(id);
            FspQuestions fq = new FspQuestions();
            fq.setId(fId);
            fspQuestions.add(this.iFspQuestionsService.selectByFsqId(fId));
        }
        return fspQuestions;
    }



    /**
     * 页面ajax加载选择题的选项
     * @param questionId
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/loadSmd_options",method = RequestMethod.GET)
    @ResponseBody
    public SmdOptions loadSmd_options(@RequestParam Integer questionId , ModelMap modelMap) {
        return this.iSmdOptionsService.selSmdOptByQid(questionId);
    }


    /**
     * 处理表单的提交
     * @param
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/postAnswers",method = RequestMethod.POST)
    @ResponseBody
    public String loadSmd_options(HttpServletRequest request , ModelMap modelMap) {
        Examination exam = (Examination) modelMap.get("examming");
        OltsUser user = (OltsUser) modelMap.get("logUser");

        Integer smd_score = 0;

        //将表单封装为Map
        Map<String,String[]> fromMap = request.getParameterMap();
        for (String key : fromMap.keySet()) {
            System.out.println("Key = " + key);

            //如果是smd问题  与正确答案进行比较
            if (key.substring(0,3).equals("smd")){
                //取出smd问题的id
                Integer smd_id = Integer.valueOf(key.substring(5,key.length()-1));

                SmdQuestions smdQuestions = this.smdQuestionsService.selectSMDquestionById(smd_id);
                //将答案数组转化为StringBuffer
                StringBuffer sb = new StringBuffer();
                for (String s : fromMap.get(key)) {
                    sb.append(s);
                    sb.append(",");
                }
                //去除最后一个逗号
                String postAnswer = sb.substring(0,sb.length()-1);
                System.out.println(postAnswer);
                System.out.println(postAnswer.replace(",",""));
                //如果答案与标准答案一致 smd_score 加分
                if (smdQuestions.getCorrect().equals(postAnswer)
                        || smdQuestions.getCorrect().equals(postAnswer.replace(",",""))){
                    if (smdQuestions.getQuestionType() == 1){
                        smd_score += 2;
                    }else if (smdQuestions.getQuestionType() == 2){
                        smd_score += 5;
                    }else if (smdQuestions.getQuestionType() == 3){
                        smd_score += 2;
                    }
                }
            }else if (key.substring(0,3).equals("fsq")) {
                //取出fsq问题的id
                Integer fsq_id = Integer.valueOf(key.substring(5,key.length()-1));

                FspQuestions fspQuestions = this.iFspQuestionsService.selectByFsqId(fsq_id);
                StringBuffer sb = new StringBuffer();
                for (String s : fromMap.get(key)) {
                    sb.append(s);
                }
                String postAnswer = sb.substring(0,sb.length());
                //封装
                FspAnswer fspAnswer = new FspAnswer();
                fspAnswer.setExam_no(exam.getExamNo());
                fspAnswer.setFspId(fsq_id);
                fspAnswer.setAnswer(postAnswer);
                fspAnswer.setUserId(user.getId());
                //插入
                int fspFlag = this.iFspAnswerService.insertiveFspAnswer(fspAnswer);
            }
        }
        //将客观题成绩插入成绩表
        OltsScore smdScore = new OltsScore();
        smdScore.setScore(smd_score *1.0);
        smdScore.setDescrpt(exam.getDescrpt());
        smdScore.setUserId(user.getId());
        smdScore.setExamNo(exam.getExamNo());
        int smdFlag = this.iOltsScoreService.insertScore(smdScore);

        return "redirect:/views/examination/postSuccess.jsp";
    }








}
