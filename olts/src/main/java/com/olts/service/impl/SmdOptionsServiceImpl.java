package com.olts.service.impl;

import com.olts.mapper.SmdOptionsMapper;
import com.olts.service.ISmdOptionsService;
import com.olts.vo.SmdOptions;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by HelloWorld on 2018/10/7.
 */
@Service("smdOptionsService")
public class SmdOptionsServiceImpl implements ISmdOptionsService {

    @Resource
    SmdOptionsMapper smdOptionMapper;

    /**
     * 添加选择题选项
     * @param smdOptions
     * @return
     */
    @Override
    public int insertSmdOptions(SmdOptions smdOptions) {
        return smdOptionMapper.insertSmdOptions(smdOptions);
    }

    @Override
    public SmdOptions selSmdOptByQid(Integer qid) {
        return this.smdOptionMapper.selSmdOptByQid(qid);
    }
}
