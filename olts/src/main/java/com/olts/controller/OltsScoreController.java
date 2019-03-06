package com.olts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import com.olts.service.IExaminationService;
import com.olts.service.IFspAnswerService;
import com.olts.service.IOltsScoreService;
import com.olts.service.ISmdQuestionsService;
import com.olts.service.IUserService;
import com.olts.vo.Examination;
import com.olts.vo.FspAnswer;
import com.olts.vo.OltsScore;
import com.olts.vo.OltsUser;
import com.olts.vo.Page;
import com.olts.vo.SmdQuestions;

/**
 * 普通的javabean作为控制器,用spring-mvc的注解
 * 
 * @Controller注解来标识本类是一个SpringMVC Controller 对象
 * @author gg
 *
 */
@Controller
@RequestMapping("/admin")
public class OltsScoreController {
	
	@Resource
	IExaminationService examination;
	@Resource
	ISmdQuestionsService smdQuestion;
	@Resource
	IFspAnswerService fspAnswer;
	@Resource
	IOltsScoreService oltsService;
	@Resource
	IOltsScoreService oltsScoreService;
	//获得客观题的答案
	@RequestMapping("insertSmdAnswer")
	public @ResponseBody void insertSmdAnswer(OltsScore os,String answer,HttpServletResponse response) throws IOException{
		//因为IExaminationService中是传入一个Examination实体类来查找试卷的，所以先取到OltsScore里的ExamNo，
		//组成一个实体类之后去IExaminationService中查找相应的试卷
		Examination examSelect = new Examination();
		examSelect.setExamNo(os.getExamNo());
		Examination exam = examination.selectByNo(examSelect);
//		得到单选题的答案
		String single = exam.getSingleId();
		String [] singles = single.split(",");
		String sAnswer = null;
		for(String s : singles){
			int sInt = Integer.parseInt(s);
			String singleAnswer = smdQuestion.selectAnswerById(sInt);
			if(sAnswer == null){
				sAnswer = singleAnswer;
			}else{
				sAnswer = sAnswer+","+singleAnswer;
			}
		}

//		得到多选题的答案
		String multiple = exam.getMultipleId();
		String [] multiples = multiple.split(",");
		String mAnswer = null;
		for(String m :multiples){
			int mInt = Integer.parseInt(m);
			String multipleAnswer = smdQuestion.selectAnswerById(mInt);
			if(mAnswer == null){
				mAnswer = "," + multipleAnswer;
			}else{
				mAnswer = mAnswer +","+multipleAnswer;
			}
		}
		
//		得到判断题答案
		String tf = exam.getTrueFalseId();
		String [] tfs = tf.split(",");
		String tAnswer = null;
		for(String t : tfs){
			int tInt = Integer.parseInt(t);
			String tfAnswer = smdQuestion.selectAnswerById(tInt);
			if(tAnswer == null){
				tAnswer = "," + tfAnswer;
			}else{
				tAnswer = tAnswer +","+tfAnswer;
			}
		}
		
//		得到客观题总分
		String smd = sAnswer+mAnswer+tAnswer;
		System.out.println(smd);
		String [] smds = smd.split(",");
		String [] answers = answer.split(",");
		Double count = 0.0;
		for(int i=0;i<smds.length;i++){
			if(smds[i].equals(answers[i])){
				count += 5;
			}
		}
		System.out.println(count+"+++++++");
		PrintWriter out = response.getWriter();
		OltsScore oltsScore = oltsService.selectByIdAndNo(os);
		if(oltsScore==null){
			os.setScore(count);
			oltsService.insertStuScore(os);
			out.print("true");
		}else{
			out.print("false");
		}	
		out.close();
	}
	
	@RequestMapping("/addFspScore")
	public @ResponseBody void addFspScore(OltsScore oltsScore){		
		oltsScoreService.updateStuFspscore(oltsScore);	
	}
	
	@RequestMapping("insertFspAnswer")
	public String insertFspAnswer(HttpServletRequest request){
		Map<String, String[]> map = request.getParameterMap();
		
		String[] examid = map.get("examid");
		String[] userid = map.get("userid");
		
		for (String in : map.keySet()) {
			String[] str = map.get(in);
			if(!in.equals("userid")){
				if(!in.equals("examid")){
//					System.out.println(examid[0]+"******************************"+userid[0]);
					FspAnswer fsp = new FspAnswer(null,str[0],Integer.parseInt(in),examid[0],Integer.parseInt(userid[0]));
					fspAnswer.insertAnswer(fsp);
//					System.out.println(in + "     " + str[0]);
				}
			}
		}
		return "redirect:/views/user/changeStuInfo.jsp";
	}
	@RequestMapping("/cheackGrade")
	public String cheackGrade(OltsScore oltsScore,Integer pageNo,ModelMap modelMap,HttpSession session){
		Page<OltsScore> page = (Page<OltsScore>) session.getAttribute("OsPage");
		
		if(page==null || pageNo==null){
			page=new Page<OltsScore>(oltsScore);
			page.setPageNo(1);
			page.setPageSize(5);
			int totalRow=oltsScoreService.countForSelective(page);
			page.setTotalRow(totalRow);
		}
		else{
			page.setPageNo(pageNo);
		}
		List<OltsScore> list=oltsScoreService.selectByExamId(page);
		
		modelMap.addAttribute("examNo",oltsScore.getExamNo());
		session.setAttribute("OsPage",page);
		modelMap.addAttribute("list", list);
		return "examination/export_score_input_success";
	}	
}
