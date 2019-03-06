package com.olts.service;



import java.util.List;

import com.olts.vo.Examination;

public interface IExaminationService {
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
	 * 开始考试
	 */
	public void updateExamValid(Examination examination);
	
	/**
	 * 结束考试
	 */
	public void updateEndExam();


	/**
	 * 查看所有的试卷号
	 * @return
	 */
	List<Examination> selectExamination();

	/*
    * 根据试卷号查询试卷
    * */
	Examination selectExaminationById(String examNo);
}
