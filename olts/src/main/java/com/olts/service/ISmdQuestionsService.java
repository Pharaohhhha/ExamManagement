package com.olts.service;

import com.olts.vo.SmdOptions;
import com.olts.vo.SmdQuestions;

import java.util.List;

/**
 * 选择试题表
 * Created by HelloWorld on 2018/10/7.
 */

public interface ISmdQuestionsService {
    int insertSmdQuestion(SmdQuestions smdQuestion, SmdOptions options);

    int insertJudgeQuestion(SmdQuestions smdQuestions);

    /**
     * 根据客观题id查询客观题
     * @param id
     * @return
     */
    public SmdQuestions selectById(int id);

    /**
     * 根据题目的id得到客观题的答案
     */
    public String selectAnswerById(int id);

    SmdQuestions selectSMDquestionById(Integer id);


    int update(SmdQuestions smdQuestion);

    int delete(Integer id);

    List<SmdQuestions> selectBySelective(SmdQuestions smdQuestions, int pageNum, int pageSize);
}
