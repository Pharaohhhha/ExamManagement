package com.olts.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.olts.mapper.FspAnswerMapper;
import com.olts.mapper.OltsScoreMapper;
import com.olts.service.IOltsScoreService;
import com.olts.vo.OltsScore;
import com.olts.vo.Page;
@Service("oltsScoreService")
public class OltsScoreServiceImpl implements IOltsScoreService{
	@Resource
	OltsScoreMapper oltsScoreMapper;
	@Resource
	FspAnswerMapper fspAnswerMapper;
	
	@Override
	public List<OltsScore> selectByExamId(Page<OltsScore> page){
		
		return oltsScoreMapper.selectByExamId(page);
	}
	public int countForSelective(Page<OltsScore> page){
		return oltsScoreMapper.countForSelective(page);
	}
	
	@Override
	public void updateStuFspscore(OltsScore oltsScore) {
		oltsScoreMapper.updateStuFspscore(oltsScore);
	}
	
	@Override
	public void insertStuScore(OltsScore score) {
		oltsScoreMapper.insertStuScore(score);	
	}
	@Override
	public OltsScore selectByIdAndNo(OltsScore oltsScore) {
		return oltsScoreMapper.selectByIdAndNo(oltsScore);
	}
	
	@Override
	public List<OltsScore> selectByNo(OltsScore oltsScore) {
		return oltsScoreMapper.selectByNo(oltsScore);
	}
	@Override
	public List<OltsScore> selectByStuId(Page<OltsScore> page) {
		return oltsScoreMapper.selectByStuId(page);
	}
	@Override
	public int countForStuScore(Page<OltsScore> page) {
		
		return oltsScoreMapper.countForStuScore(page);
	}
	@Override
	public List<OltsScore> selectAllScore(OltsScore oltsScore) {
		// TODO Auto-generated method stub
		return oltsScoreMapper.selectAllScore(oltsScore);
	}

	@Override
	public int insertScore(OltsScore oltsScore) {
		return oltsScoreMapper.insertScore(oltsScore);
	}



}
