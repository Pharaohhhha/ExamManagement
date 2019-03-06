package com.olts.service.impl;

import com.olts.vo.Page;
import com.olts.mapper.CoursesMapper;
import com.olts.service.ICoursesService;
import com.olts.vo.Courses;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by HelloWorld on 2018/10/8.
 */
@Service("coursesService")
public class CoursesServiceImpl implements ICoursesService {
    
    @Resource
    CoursesMapper coursesMapper;
    @Override
    public List<Courses> selectAll() {
        return coursesMapper.selectAll();
    }
    //查询所有课程
    @Override
    public List<Courses> testSelectAllCourse() {

        return coursesMapper.testSelectAllCourse();
    }

    //增加课程
    @Override
    public void insertCourse(Courses courses) {
        coursesMapper.insertCourse(courses);
    }

    @Override
    public Courses selectCoursesById(Integer id) {
        return coursesMapper.selectCoursesById(id);
    }

    //更新课程
    @Override
    public void update(Courses courses) {
        coursesMapper.update(courses);
    }

    //删除课程
    @Override
    public void delete(Integer id) {

        coursesMapper.delete(id);
    }

    @Override
    public List<Courses> selectAllCourse(Page<Courses> courses) {

        return coursesMapper.selectAllCourse(courses);
    }

    @Override
    public int countForSelective(Page<Courses> courses) {
        return coursesMapper.countForSelective(courses);
    }

    @Override
    public List<Courses> selectBySelective(Courses courses,int pageNum, int pageSize) {
        return coursesMapper.selectBySelective(courses,pageNum,pageSize);
    }
}
