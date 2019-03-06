package com.olts.mapper;

import java.util.List;

import com.olts.vo.FspAnswer;

public interface FspAnswerMapper {

	//插入学生主观题答案
	public int insertFspAnswer(FspAnswer fspAnswer);
	
	//根据学生编号，试卷编号，试题编号查询学生主观题答案
	public FspAnswer select(FspAnswer fsp);
	
	//根据学生编号，试卷编号查询学生主观题答案	
	public List<FspAnswer> selectAll(FspAnswer fsp);

    int insertiveFspAnswer(FspAnswer fspAnswer);
}
