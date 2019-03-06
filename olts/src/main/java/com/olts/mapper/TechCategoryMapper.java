package com.olts.mapper;

import com.olts.vo.Page;
import com.olts.vo.TechCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by HelloWorld on 2018/10/8.
 */
@Repository
public interface TechCategoryMapper {

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
     * 更改知识点
     *
     */
    public void updateTechCategroy(TechCategory techCategory);


    /**
     * 通过courseId增加知识点
     *
     */

    public void insertTechCategroy(TechCategory techCategory);

    /**
     * 通过id删除知识点
     */

    public void deleteTechCategroy(Integer id);

    public List<TechCategory> selectTech(Integer courseId, Page <TechCategory> techCategory);

    public int countForSelective(Page<TechCategory> techCategory);

    List<TechCategory> selectBySelective(TechCategory techCategory);

}
