package com.olts.mapper;

import com.olts.vo.SmdOptions;
import org.springframework.stereotype.Repository;

/**
 * 添加选择题选项
 * Created by HelloWorld on 2018/10/7.
 */
@Repository
public interface SmdOptionsMapper {

    /**
     * 添加选择题选项
     * @param smdOptions
     * @return
     */
    int insertSmdOptions(SmdOptions smdOptions);
    SmdOptions selSmdOptByQid(Integer qid);
}
