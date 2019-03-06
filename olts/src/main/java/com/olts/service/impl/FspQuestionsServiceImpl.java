package com.olts.service.impl;

import com.olts.mapper.FspQuestionsMapper;
import com.olts.service.IFspQuestionsService;
import com.olts.vo.Courses;
import com.olts.vo.FspQuestions;
import com.olts.vo.SmdQuestions;
import com.olts.vo.TechCategory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * 添加选择试题
 * Created by HelloWorld on 2018/10/7.
 */
@Service("fspQuestionsService")
public class FspQuestionsServiceImpl implements IFspQuestionsService {
    @Resource
    private FspQuestionsMapper fspQuestionsMapper;

    @Override
    public int insertFspQuestion(FspQuestions fspQuestion) {
        return fspQuestionsMapper.insertFspQuestion(fspQuestion);
    }
    @Override
    public List<FspQuestions> selectBySelective(FspQuestions questions, int pageNum, int pageSize) {
        return fspQuestionsMapper.selectBySelective(questions,pageNum,pageSize);
    }

    @Override
    public int updateFspQuestion(FspQuestions questions) {
        return fspQuestionsMapper.updateFspQuestion(questions);
    }

    @Override
    public List<Courses> selectCourses() {
        return fspQuestionsMapper.selectCourses();
    }

    @Override
    public List<TechCategory> selectTechCategoryByCourseId(Integer integer) {
        return fspQuestionsMapper.selectTechCategoryByCourseId(integer);
    }

    @Override
    public List<TechCategory> selectTechCategory() {
        return fspQuestionsMapper.selectTechCategory();
    }

    @Override
    public int update(FspQuestions fspQuestions) {
        return fspQuestionsMapper.updateFspQuestion(fspQuestions);
    }

    @Override
    public int delete(Integer id) {
        return fspQuestionsMapper.deleteFspQuestion(id);
    }

    @Override
    public FspQuestions selectFspById(Integer id) {
        return fspQuestionsMapper.selectFspById(id);
    }

    @Override
    public FspQuestions selectByFsqId(Integer fsqId){
        return fspQuestionsMapper.selectByFsqId(fsqId);
    }


    @Override
    public List<FspQuestions> selectBySelective(FspQuestions questions) {
        return fspQuestionsMapper.selectBySelective(questions,1,100);
    }
}
