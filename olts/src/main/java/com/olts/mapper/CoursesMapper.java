package com.olts.mapper;

import com.olts.vo.Courses;
import com.olts.vo.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by HelloWorld on 2018/10/8.
 */
@Repository
public interface CoursesMapper {
    
    List<Courses> selectAll();
    /**
     * 查询科目表
     * @return
     */
    List<Courses> testSelectAllCourse();

    /**
     * 新增课程名
     * @param courses
     */
    public void insertCourse(Courses courses);

    /**
     * 查询所有课程
     * @return
     */
	/*public List<Courses> selectAllCourses();*/

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

    /*
   *
   * */
    List<Courses> selectBySelective(@Param("c")Courses courses,
                                    @Param("pageNum") int pageNum,
                                    @Param("pageSize") int pageSize);
}
