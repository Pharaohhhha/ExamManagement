package com.olts.service;

import java.util.List;

import com.olts.vo.FspAnswer;

public interface IFspAnswerService {

	//插入学生主观题答案
	public String insertAnswer(FspAnswer fspanswer);
	
	//根据学生编号，试卷编号，试题编号查询学生主观题答案
	public FspAnswer select(FspAnswer fsp);
	
	//根据学生编号，试卷编号查询学生主观题答案	
	public List<FspAnswer> selectAll(FspAnswer fsp);

    int insertiveFspAnswer(FspAnswer fspAnswer);
}
