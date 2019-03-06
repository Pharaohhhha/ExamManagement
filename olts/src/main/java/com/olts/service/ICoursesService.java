package com.olts.service;

import com.olts.vo.Page;
import com.olts.vo.Courses;


import java.util.List;

/**
 * Created by HelloWorld on 2018/10/8.
 */
public interface ICoursesService {
    
    List<Courses> selectAll();

    /**
     * 加载科目
     * @return
     */
    public List<Courses> testSelectAllCourse();

    /**
     * 新增课程名
     * @param courses
     */
    public void insertCourse(Courses courses);

    /**
     * 查询所有课程
     * @return
     */
/*	public List<Courses> selectAllCourses();*/

    /**
     * 通过id查找
     */
    public Courses selectCoursesById(Integer id);

    /**
     * 更新
     */
    public void update(Courses courses);

    /**
     * 通过id删除
     * @param id
     */
    public void delete(Integer id);

    public List<Courses> selectAllCourse(Page<Courses> courses);

    public int countForSelective(Page <Courses> courses);

    /*List<Courses>  selectBySelective(Courses courses);*/
    List<Courses>  selectBySelective(Courses courses,int pageNum,int pageSize);

}
