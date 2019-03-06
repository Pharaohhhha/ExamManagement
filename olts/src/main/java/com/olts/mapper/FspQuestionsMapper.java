package com.olts.mapper;

import com.olts.vo.Courses;
import com.olts.vo.FspQuestions;
import com.olts.vo.TechCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by HelloWorld on 2018/10/7.
 */
@Repository
public interface FspQuestionsMapper {

    /**
     * 试题表(试题表(简答题，编程题)
     * @param fspQuestion
     * @return
     */
    int insertFspQuestion(FspQuestions fspQuestion);
    List<FspQuestions> selectBySelective(@Param("fq") FspQuestions questions,
                                         @Param("pageNum") int pageNum,
                                         @Param("pageSize") int pageSize);

    int updateFspQuestion(FspQuestions questions);

    List<Courses> selectCourses();

    List<TechCategory> selectTechCategoryByCourseId(Integer integer);

    List<TechCategory> selectTechCategory();

    int deleteFspQuestion(Integer id);

    //根据ID查找题目
    public FspQuestions selectFspById(Integer id);

    FspQuestions selectByFsqId(Integer fsqId);
}
