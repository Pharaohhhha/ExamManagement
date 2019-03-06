package com.olts.mapper;

import java.util.List;

import com.olts.vo.OltsScore;
import com.olts.vo.Page;

public interface OltsScoreMapper extends BaseMapper<OltsScore, Integer> {
	public List<OltsScore> selectByExamId(Page<OltsScore> page);
	public int countForSelective(Page<OltsScore> page);
	
	//根据学生id和试卷编号来更新学生主观分数
	public void updateStuFspscore(OltsScore oltsScore);
	
	public OltsScore selectByExamId(OltsScore oltsScore);
	
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

    public int insertScore(OltsScore oltsScore);

}
