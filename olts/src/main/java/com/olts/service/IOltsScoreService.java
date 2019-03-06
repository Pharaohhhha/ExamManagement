package com.olts.service;

import com.olts.vo.OltsScore;
import com.olts.vo.Page;

import java.util.List;

/**
 * Created by Administrator on 2018/10/10.
 */
public interface IOltsScoreService {
    public List<OltsScore> selectByExamId(Page<OltsScore> page);
    public int countForSelective(Page<OltsScore> page);

    //根据学生id和试卷编号来更新学生主观分数
    public void updateStuFspscore(OltsScore oltsScore);

    //	插入学生成绩
    public void insertStuScore(OltsScore score);

    /**
     * 根据学生id和试卷编号来查询主观分数
     * @param oltsScore
     * @return
     */
    public OltsScore selectByIdAndNo(OltsScore oltsScore);

    /**
     * 根据试卷编号来查询主观分数
     * @param oltsScore
     * @return
     */
    public List<OltsScore> selectByNo(OltsScore oltsScore);

    /**
     * 根据学生Id来查询成绩的分页查询
     * @param page
     * @return
     */
    public List<OltsScore> selectByStuId(Page<OltsScore> page);
    /**
     * 获取个人所有分数记录
     * @param page
     * @return
     */
    public int countForStuScore(Page<OltsScore> page);

    public List<OltsScore> selectAllScore(OltsScore oltsScore);

    int insertScore(OltsScore smdScore);
}
