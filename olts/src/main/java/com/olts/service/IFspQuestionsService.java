package com.olts.service;

import com.olts.vo.Courses;
import com.olts.vo.FspQuestions;
import com.olts.vo.TechCategory;

import java.util.List;


/**
 * 选择试题表
 * Created by HelloWorld on 2018/10/7.
 */

public interface IFspQuestionsService {
    int insertFspQuestion(FspQuestions fspQuestion);
    List<FspQuestions> selectBySelective(FspQuestions questions, int pageNum, int pageSize);

    int updateFspQuestion(FspQuestions questions);

    List<Courses> selectCourses();

    List<TechCategory> selectTechCategoryByCourseId(Integer integer);

    List<TechCategory> selectTechCategory();

    int update(FspQuestions fspQuestions);

    int delete(Integer id);

    //根据题目ID查找
    public FspQuestions selectFspById(Integer id);

    FspQuestions selectByFsqId(Integer fsqId);

    List<FspQuestions> selectBySelective(FspQuestions questions);
}
