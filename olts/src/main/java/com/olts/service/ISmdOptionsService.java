package com.olts.service;

import com.olts.vo.SmdOptions;

/**
 * Created by xxxx on 2018/10/8.
 */
public interface ISmdOptionsService {


    /**
     * 根据题号查询选项
     * @return
     */
    SmdOptions selSmdOptByQid(Integer qid);


    /**
     * 添加选择题选项
     * @param choiceQuestion
     * @return
     */
    int insertSmdOptions(SmdOptions choiceQuestion);
}
