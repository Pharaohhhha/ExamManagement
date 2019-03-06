package com.olts.service.impl;

import com.olts.mapper.CoursesMapper;
import com.olts.mapper.TechCategoryMapper;
import com.olts.service.ITechCategoryService;
import com.olts.vo.Courses;
import com.olts.vo.Page;
import com.olts.vo.TechCategory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by HelloWorld on 2018/10/8.
 */
@Service("techCategoryService")
public class TechCategoryServiceImpl implements ITechCategoryService {
    
    @Resource
    TechCategoryMapper techCategoryMapper;
    @Resource
    CoursesMapper coursesMapper;

    @Override
    public List<TechCategory> selectByCourseId(Integer courseId) {
        return techCategoryMapper.selectByCourseId(courseId);
    }

    @Override
    public List<TechCategory> selectTechCategroy(Integer courseId) {
        return techCategoryMapper.selectTechCategroy(courseId);
    }

    @Override
    public void delete(Integer courseId) {
        techCategoryMapper.delete(courseId);
    }

    @Override
    public void updateTechCategroy(TechCategory techCategory) {

        techCategoryMapper.updateTechCategroy(techCategory);

    }

    @Override
    public void insertTechCategroy(TechCategory techCategory) {

        techCategoryMapper.insertTechCategroy(techCategory);

    }

    @Override
    public void deleteTechCategroy(Integer id) {

        techCategoryMapper.deleteTechCategroy(id);
    }

    @Override
    public List<Courses> testSelectAllCourse() {

        return coursesMapper.testSelectAllCourse();
    }


    @Override
    public List<TechCategory> selectBySelective(TechCategory techCategory){
        return (List<TechCategory>) techCategoryMapper.selectBySelective(techCategory);
    };

    @Override
    public int countForSelective(Page<TechCategory> techCategory){
        return techCategoryMapper.countForSelective(techCategory);
    };
}
