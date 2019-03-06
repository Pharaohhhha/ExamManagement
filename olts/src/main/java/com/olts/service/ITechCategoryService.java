package com.olts.service;
import com.olts.vo.Page;
import com.olts.vo.Courses;
import com.olts.vo.TechCategory;

import java.util.List;

/**
 * Created by HelloWorld on 2018/10/8.
 */
public interface ITechCategoryService {
    
    List<TechCategory> selectByCourseId(Integer courseId);
    /**
     * 加载知识点
     * @return
     */
    public List<TechCategory> selectTechCategroy(Integer courseId);

    /**
     * 通过外键删除
     * @param courseId
     */
    public void delete(Integer courseId);


    /**
     * 通过id删除知识点
     */

    public void deleteTechCategroy(Integer id);

    /**
     * 更改知识点
     *
     */
    public void updateTechCategroy(TechCategory techCategory);

    /**
     * 通过courseId增加知识点
     *
     */

    public void insertTechCategroy(TechCategory techCategory);

    List<Courses> testSelectAllCourse();

    List<TechCategory> selectBySelective(TechCategory techCategory);

    int countForSelective(Page <TechCategory> techCategory);
}
