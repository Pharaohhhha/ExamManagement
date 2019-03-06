package com.olts.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.olts.mapper.FspAnswerMapper;
import com.olts.service.IFspAnswerService;
import com.olts.vo.FspAnswer;
@Service("FspAnswerService")
public class FspAnswerServiceImpl implements IFspAnswerService{
	
	@Resource
	FspAnswerMapper fspAnswerMapper;

	//插入学生主观题答案
	@Override
	public String insertAnswer(FspAnswer fspanswer) {
		String massage="";
		int statu=fspAnswerMapper.insertFspAnswer(fspanswer);
		if(statu>0){
			massage="插入学生答案成功";
		}else{
			massage="插入学生答案失败";
		}
		System.out.println(statu);
		return massage;
	}

	@Override
	public FspAnswer select(FspAnswer fsp) {
		FspAnswer fspAnswer=fspAnswerMapper.select(fsp);
		return fspAnswer;
	}

	@Override
	public List<FspAnswer> selectAll(FspAnswer fsp) {
		List<FspAnswer> list=new ArrayList<FspAnswer>();
		list=fspAnswerMapper.selectAll(fsp);
		return list;
	}

	@Override
	public int insertiveFspAnswer(FspAnswer fspAnswer) {
		return this.fspAnswerMapper.insertiveFspAnswer(fspAnswer);
	}

}
