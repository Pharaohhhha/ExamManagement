package com.olts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olts.service.IExaminationService;
import com.olts.service.IFspQuestionsService;
import com.olts.service.ISmdQuestionsService;
import com.olts.service.IUserService;
import com.olts.vo.Examination;
import com.olts.vo.FspQuestions;
import com.olts.vo.OltsUser;
import com.olts.vo.SmdQuestions;

/**
 * Created by Administrator on 2018/10/8.
 */

@Controller
@RequestMapping("/admin")
public class ExaminationController {
	@Resource 
	IExaminationService examinationService;
	@Resource 
	ISmdQuestionsService smdQuestionsService;
	@Resource
	IFspQuestionsService fspQuestionsService;
	
	
	@RequestMapping("/selExamNo")
	public @ResponseBody List<Examination> selExamNo() {
		List<Examination> listExam = examinationService.selectAllNo();
		System.out.println("........."+listExam);
		return listExam;
	}
	
	@RequestMapping("/beginExam")
	public String beginExam(Examination examination,ModelMap modelMap){
		
		Examination showExam =examinationService.selectByNo(examination);
		showExam.setValidFlag(1);
		examinationService.updateExamValid(showExam);
		modelMap.addAttribute("success", "考试开始   试卷编号："+showExam.getExamNo());
		return "examination/radio_input";
	}
		
		
	
	@RequestMapping("/endExam")
	public void endExam(ModelMap modelMap,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		examinationService.updateEndExam();
		out.println("考试结束");
		out.close();
	}
	/**
	 * 加入试卷
	 * @return
	 */
	@RequestMapping("/addExamination")
	public @ResponseBody String addExamination(Examination examination,int questionType,String questionIds) {
		questionIds = questionIds.trim();
		Examination exam =examinationService.selectByNo(examination);	
		if(exam==null){
			if(questionType==1){  //插入单选题	
				examination.setSingleId(questionIds);//避免第一根据试卷号插入数据的时候没有插入其他数据
				examinationService.insertiveExamation(examination);
				return "成功加入试卷";
			}
			if(questionType==2){  //插入多选题
				examination.setMultipleId(questionIds);
				examinationService.insertiveExamation(examination);
				return "成功加入试卷";			
			}
			if(questionType==3){  //插入判断题
				examination.setTrueFalseId(questionIds);
				examinationService.insertiveExamation(examination);
				return "成功加入试卷";
			}
			if(questionType==4){  //插入填空题
				examination.setFillInGapsId(questionIds);
				examinationService.insertiveExamation(examination);
				return "成功加入试卷";
			}
			if(questionType==5){  //插入简单题
				examination.setSimpleAnwserId(questionIds);
				examinationService.insertiveExamation(examination);
				return "成功加入试卷";
			}
			if(questionType==6){    //插入编程题
				examination.setProgramId(questionIds);
				examinationService.insertiveExamation(examination);
				return "成功加入试卷";
			}
		}else { //加入试题
			if(questionType==1){
				//获取单选题的题号
				String strSingleId = exam.getSingleId();
				if(strSingleId==null){
					exam.setSingleId(questionIds);
				}else{
					String str1 =strSingleId+","+questionIds;
					exam.setSingleId(str1);
				}
				examinationService.update(exam);
				return "成功加入试卷";
			}
			if(questionType==2){
				//获取多选题的题号
				String strMultipleId = exam.getMultipleId();
				//null,新增题目后，从数据库取出来为空的，再次加入其他题型后，前面为空
				if(strMultipleId==null){
					exam.setMultipleId(questionIds);
				}else{
					String str2 =strMultipleId+","+questionIds;
					exam.setMultipleId(str2);
				}
				examinationService.update(exam);
				return "成功加入试卷";
			}
			if(questionType==3){
				//获取判断题的题号
				String strTrueFalseId = exam.getTrueFalseId();
				if(strTrueFalseId==null){
					exam.setTrueFalseId(questionIds);
				}else{
					String str3 =strTrueFalseId+","+questionIds;
					exam.setTrueFalseId(str3);
				}
				examinationService.update(exam);
				return "成功加入试卷";
			}
			if(questionType==4){
				//获取填空题的题号
				String strFillInGapsId = exam.getFillInGapsId();
				if(strFillInGapsId==null){
					exam.setFillInGapsId(questionIds);
				}else{
					String str4 =strFillInGapsId+","+questionIds;
					exam.setFillInGapsId(str4);
				}
				examinationService.update(exam);
				return "成功加入试卷";
				
			}
			if(questionType==5){
				//获取简答题的题号
				String strSimpleAnwserId = exam.getSimpleAnwserId();
				if(strSimpleAnwserId==null){
					exam.setSimpleAnwserId(questionIds);
				}else{
					String str5 =strSimpleAnwserId+","+questionIds;
					exam.setSimpleAnwserId(str5);
				}
				examinationService.update(exam);
				return "成功加入试卷";
			}
			if(questionType==6){
				//获取编程题的题号
				String strProgramId = exam.getProgramId();
				if(strProgramId==null){
					exam.setProgramId(questionIds);
				}else{
					String str6 =strProgramId+","+questionIds;
					exam.setProgramId(str6);
				}
				examinationService.update(exam);
				return "成功加入试卷";
			}
		}
		return "加入试卷失败"; 		
	}
	
	@RequestMapping("selectExam")
	public String selectExam(ModelMap modelmap){
		List<Examination> exam = new ArrayList<Examination>();
		exam = examinationService.selectAllNo();
		for(Examination e : exam){
			if(e.getValidFlag() == 1){
				List<SmdQuestions> listSmd =  new ArrayList<>();
				
				List<FspQuestions> listFsp =  new ArrayList<>();
				//获取单选题的题号
				String strSingleId = e.getSingleId();
				//获取多选题的题号
				String strMultipleId = e.getMultipleId();	
				//获取判断题的题号
				String strTrueFalseId = e.getTrueFalseId();
				//拼接得到客观题的题号数组
				String strSmd=strSingleId+","+strMultipleId+","+strTrueFalseId;
				String[] arrSmd = strSmd.split(",");
				for(int i=0;i<arrSmd.length;i++){
					
					SmdQuestions smdQuestions = smdQuestionsService.selectById(Integer.parseInt(arrSmd[i]));
					listSmd.add(smdQuestions);
				}
				e.setSmdQuestions(listSmd);
				
				//获取填空题的题号
				String strFillInGapsId = e.getFillInGapsId();
				//获取简答题的题号
				String strSimpleAnwserId = e.getSimpleAnwserId();
				//获取编程题的题号
				String strProgramId = e.getProgramId();
				//拼接得到主观题的题号数组
				String strFsp = strFillInGapsId+","+strSimpleAnwserId+","+strProgramId;	
				String[] arrFsp = strFsp.split(",");
				for(int j=0;j<arrFsp.length;j++){
					FspQuestions fspQuestions = fspQuestionsService.selectFspById(Integer.parseInt(arrFsp[j]));
					listFsp.add(fspQuestions);
				}
				e.setFspQuestions(listFsp);
				
				modelmap.addAttribute("examinations", e);
				return "examination/radio_list";
			}
		}
		modelmap.addAttribute("error", "error");
		return "examination/radio_list";
	}
	
	@RequestMapping("updateExam")
	public String updateExam(Examination examination,int questionType,String questionIds){
		questionIds = questionIds.trim();
		Examination exam =examinationService.selectByNo(examination);	
			if(questionType==1){
				//获取单选题的题号
				String strSingleId = exam.getSingleId();
				if(strSingleId==null){
					exam.setSingleId(questionIds);
				}else{
					strSingleId +=",";
					if(strSingleId.contains(questionIds)){
						strSingleId = strSingleId.replace(questionIds+",", "");
					}
					strSingleId = StringUtils.removeEnd(strSingleId, ",");
					String str1 =strSingleId;
					if(str1==null){
						return "forward:/admin/showExam";
					}else{
						exam.setSingleId(str1);
					}
				}
				examinationService.update(exam);
				//return "admin/showExam";
			}
			if(questionType==2){
				//获取多选题的题号
				String strMultipleId = exam.getMultipleId();
				//null,新增题目后，从数据库取出来为空的，再次加入其他题型后，前面为空
				if(strMultipleId==null){
					exam.setMultipleId(questionIds);
				}else{
					strMultipleId +=",";
					if(strMultipleId.contains(questionIds)){
						strMultipleId = strMultipleId.replace(questionIds+",", "");
					}
					strMultipleId = StringUtils.removeEnd(strMultipleId, ",");
					String str2 =strMultipleId;
					if(str2==null){
						return "forward:/admin/showExam";
					}else{
						exam.setMultipleId(str2);
					}
				}
				examinationService.update(exam);
				//return "admin/showExam";
			}
			if(questionType==3){
				//获取判断题的题号
				String strTrueFalseId = exam.getTrueFalseId();
				if(strTrueFalseId==null){
					exam.setTrueFalseId(questionIds);
				}else{
					strTrueFalseId +=",";
					if(strTrueFalseId.contains(questionIds)){
						strTrueFalseId = strTrueFalseId.replace(questionIds+",", "");
					}
					strTrueFalseId = StringUtils.removeEnd(strTrueFalseId, ",");
					String str3 =strTrueFalseId;
					if(str3==null){
						return "forward:/admin/showExam";
					}else{
					exam.setTrueFalseId(str3);}
				}
				examinationService.update(exam);
				//return "admin/showExam";
			}
			if(questionType==4){
				//获取填空题的题号
				String strFillInGapsId = exam.getFillInGapsId();
				if(strFillInGapsId==null){
					exam.setFillInGapsId(questionIds);
				}else{
					strFillInGapsId+=",";
					if(strFillInGapsId.contains(questionIds)){
						strFillInGapsId = strFillInGapsId.replace(questionIds+",", "");
					}
					strFillInGapsId = StringUtils.removeEnd(strFillInGapsId, ",");
					String str4 =strFillInGapsId;
					if(str4==null){
						return "forward:/admin/showExam";
					}else{
					exam.setFillInGapsId(str4);}
				}
				examinationService.update(exam);
				//return "admin/showExam";
				
			}
			if(questionType==5){
				//获取简答题的题号
				String strSimpleAnwserId = exam.getSimpleAnwserId();
				if(strSimpleAnwserId==null){
					exam.setSimpleAnwserId(questionIds);
				}else{
					strSimpleAnwserId +=",";
					if(strSimpleAnwserId.contains(questionIds)){
						strSimpleAnwserId = strSimpleAnwserId.replace(questionIds+",", "");
					}
					strSimpleAnwserId = StringUtils.removeEnd(strSimpleAnwserId, ",");
					String str5 =strSimpleAnwserId;
					if(str5==null){
						return "forward:/admin/showExam";
					}else{
					exam.setSimpleAnwserId(str5);}
				}
				examinationService.update(exam);
				//return "admin/showExam";
			}
			if(questionType==6){
				//获取编程题的题号
				String strProgramId = exam.getProgramId();
				if(strProgramId==null){
					exam.setProgramId(questionIds);
				}else{
					strProgramId +=",";
					if(strProgramId.contains(questionIds)){
						strProgramId = strProgramId.replace(questionIds+",", "");
					}
					strProgramId = StringUtils.removeEnd(strProgramId, ",");
					String str6 =strProgramId;
					if(str6==null){//验证主客观题有没有空，如果为空，直接删试卷，
						return "forward:/admin/showExam";
					}else{
					exam.setProgramId(str6);}
				}
				examinationService.update(exam);
			}
			return "forward:/admin/showExam";
		//return "forward:/views/examination/exam_manage_input.jsp"; 		
	}
	
	@RequestMapping("showExam")
	public String showExam(Examination examination,ModelMap modelmap){
		
		Examination e  = examinationService.selectByNo(examination);
	
				List<SmdQuestions> listSmd =  new ArrayList<>();
				
				List<FspQuestions> listFsp =  new ArrayList<>();
				//获取单选题的题号
				String strSingleId = e.getSingleId();
				//获取多选题的题号
				String strMultipleId = e.getMultipleId();	
				//获取判断题的题号
				String strTrueFalseId = e.getTrueFalseId();
				//拼接得到客观题的题号数组
				String strSmd=strSingleId+","+strMultipleId+","+strTrueFalseId;
				String[] arrSmd = strSmd.split(",");
				for(int i=0;i<arrSmd.length;i++){
					
					SmdQuestions smdQuestions = smdQuestionsService.selectById(Integer.parseInt(arrSmd[i]));
					listSmd.add(smdQuestions);
				}
				e.setSmdQuestions(listSmd);
				
				//获取填空题的题号
				String strFillInGapsId = e.getFillInGapsId();
				//获取简答题的题号
				String strSimpleAnwserId = e.getSimpleAnwserId();
				//获取编程题的题号
				String strProgramId = e.getProgramId();
				//拼接得到主观题的题号数组
				String strFsp = strFillInGapsId+","+strSimpleAnwserId+","+strProgramId;	
				String[] arrFsp = strFsp.split(",");
				for(int j=0;j<arrFsp.length;j++){
					FspQuestions fspQuestions = fspQuestionsService.selectFspById(Integer.parseInt(arrFsp[j]));
					listFsp.add(fspQuestions);
				}
				e.setFspQuestions(listFsp);
				
				modelmap.addAttribute("examinations", e);
				return "examination/exam_manage_list";

	}
}
