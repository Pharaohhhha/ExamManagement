package com.olts.service.impl;

import javax.annotation.Resource;

import java.util.List;


import org.springframework.stereotype.Service;

import com.olts.mapper.ExaminationMapper;
import com.olts.service.IExaminationService;
import com.olts.vo.Examination;
@Service("examinationService")
public class ExaminationServiceImpl implements IExaminationService{
	@Resource
	ExaminationMapper examinationMpper;

	@Override
	public void update(Examination examination) {
		examinationMapper.update(examination);
		
	}
	
	@Resource
	ExaminationMapper examinationMapper;
	
	@Override
	public List<Examination> selectAllNo(){
		
		return examinationMapper.selectAllNo();
	}

	@Override
	public Examination selectByNo(Examination examination) {
		
		return examinationMapper.selectByNo(examination);
		
	}

	@Override
	public void insertiveExamation(Examination examination) {
	
		examinationMapper.insertiveExamation(examination);
	}

	@Override
	public void updateExamValid(Examination examination) {
		// TODO Auto-generated method stub
		examinationMapper.updateExamValid(examination);
	}

	@Override
	public void updateEndExam() {
		// TODO Auto-generated method stub
		examinationMapper.updateEndExam();
	}

	@Override
	public List<Examination> selectExamination() {
		return examinationMapper.selectExamination();
	}

	@Override
	public Examination selectExaminationById(String examNo) {
		return examinationMapper.selectExaminationById(examNo);
	}


}
