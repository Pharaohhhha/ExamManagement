package com.olts.mapper;

import com.olts.vo.SmdOptions;
import com.olts.vo.SmdQuestions;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by HelloWorld on 2018/10/7.
 */
@Repository
public interface SmdQuestionsMapper {

    /**
     * 试题表(s:单选题，m:多选, d:判断题)
     * @param smdQuestion
     * @return
     */
    int insertSmdQuestion(SmdQuestions smdQuestion);

    /**
     * 选项
     * @param smdOptions
     * @return
     */
    int insertSmdOptions(SmdOptions smdOptions);


    /**
     * 根据题目的id得到客观题的答案
     */
    public String selectAnswerById(int id);


    /**
     * 根据客观题id查询客观题
     * @param id
     * @return
     */
    public SmdQuestions selectById(int id);

    int insertJudgeQuestion(SmdQuestions smdQuestions);

    SmdQuestions selectSMDquestionById(Integer id);

    List<SmdQuestions> selectBySelective(@Param("sq") SmdQuestions smdQuestions,
                                         @Param("pageNum") int pageNum,
                                         @Param("pageSize") int pageSize);

    int updateSmdQuestion(SmdQuestions smdQuestion);

    int delete(Integer id);
}
