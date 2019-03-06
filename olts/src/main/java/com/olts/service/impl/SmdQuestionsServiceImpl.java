package com.olts.service.impl;

import com.olts.mapper.SmdQuestionsMapper;
import com.olts.service.ISmdQuestionsService;
import com.olts.vo.SmdOptions;
import com.olts.vo.SmdQuestions;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * 添加选择试题
 * Created by HelloWorld on 2018/10/7.
 */
@Service("smdQuestionsService")
public class SmdQuestionsServiceImpl implements ISmdQuestionsService{
    @Resource
    private SmdQuestionsMapper smdQuestionsMapper;
    
    @Override
    public int insertSmdQuestion(SmdQuestions smdQuestion, SmdOptions options) {
        smdQuestionsMapper.insertSmdQuestion(smdQuestion);
        options.setQuestionId(smdQuestion.getId());
        int i = smdQuestionsMapper.insertSmdOptions(options);
        return i;
    }
   public int insertJudgeQuestion(SmdQuestions smdQuestions){
       int i = smdQuestionsMapper.insertJudgeQuestion(smdQuestions);
       return i;
   }

    @Override
    public SmdQuestions selectById(int id) {
        return smdQuestionsMapper.selectById(id);
    }

    @Override
    public String selectAnswerById(int id) {
        return smdQuestionsMapper.selectAnswerById(id);
    }

    @Override
    public SmdQuestions selectSMDquestionById(Integer id) {
        return this.smdQuestionsMapper.selectSMDquestionById(id);
    }

    @Override
    public int update(SmdQuestions smdQuestion) {
        return smdQuestionsMapper.updateSmdQuestion(smdQuestion);
    }

    @Override
    public int delete(Integer id) {
        return smdQuestionsMapper.delete(id);
    }

    @Override
    public List<SmdQuestions> selectBySelective(SmdQuestions smdQuestions, int pageNum, int pageSize) {
        return smdQuestionsMapper.selectBySelective(smdQuestions,pageNum,pageSize);
    }

}
