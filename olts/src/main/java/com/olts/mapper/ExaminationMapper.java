package com.olts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import java.util.List;

import com.olts.vo.Examination;
@Repository
public interface ExaminationMapper  {
	public void update(Examination examination);
	
	
	/**
	 * 查询所有试卷的编号
	 * @return
	 */
	public List<Examination> selectAllNo();
	
	/**
	 * 根据试卷编号查看试卷
	 * @return
	 */
	public Examination selectByNo(Examination examination);
	
	/**
	 * 加入新的试卷
	 * @param examination
	 */
	public void insertiveExamation(Examination examination);
	
	/**
	 * 修改试卷考试状态
	 */
	public void updateExamValid(Examination examination);
	
	/**
	 * 结束考试
	 */
	public void updateEndExam();

	List<Examination> selectExamination();

	Examination selectExaminationById(String examNo);
}
