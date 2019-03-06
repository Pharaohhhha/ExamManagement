package com.olts.vo;

import java.util.Date;
import java.util.List;

public class Examination {
	private String examNo;// 考试编号系统生成（考点简称+YYYYMMDD+班级号）
	private Integer userId;// 出题老师的编号
	private Date examDate;// 考试时间
	private String singleId;// 所有单选题答题的题号，逗号分隔 1,2,5,9,
	private String multipleId;// 所有多选题答题的题号，逗号分隔
	private String trueFalseId;// 所有判断题答题的题号，逗号分隔
	// --以下几题为主观题，不能系统打分
	private String fillInGapsId;// 所有填空题答题的题号，逗号分隔
	private String simpleAnwserId;// 所有简答题答题的题号，逗号分隔
	private String programId;// 所有编程题答题的题号，逗号分隔
	private String descrpt;
	private Integer validFlag;// 试卷有效状态标识：1有效，0/空无效

	private List<SmdQuestions> smdQuestions;
	private List<FspQuestions> fspQuestions;
	
	private List<FspAnswer> fspAnswer;
	
	@Override
	public String toString() {
		return "Examination [examNo=" + examNo + ", userId=" + userId
				+ ", examDate=" + examDate + ", singleId=" + singleId
				+ ", multipleId=" + multipleId + ", trueFalseId=" + trueFalseId
				+ ", fillInGapsId=" + fillInGapsId + ", simpleAnwserId="
				+ simpleAnwserId + ", programId=" + programId + ", descrpt="
				+ descrpt + ", validFlag=" + validFlag + "]";
	}

	public Examination() {
		super();
	}

	public Examination(String examNo, Integer userId, Date examDate,
			String singleId, String multipleId, String trueFalseId,
			String fillInGapsId, String simpleAnwserId, String programId,
			String descrpt, Integer validFlag) {
		super();
		this.examNo = examNo;
		this.userId = userId;
		this.examDate = examDate;
		this.singleId = singleId;
		this.multipleId = multipleId;
		this.trueFalseId = trueFalseId;
		this.fillInGapsId = fillInGapsId;
		this.simpleAnwserId = simpleAnwserId;
		this.programId = programId;
		this.descrpt = descrpt;
		this.validFlag = validFlag;
	}

	public String getExamNo() {
		return examNo;
	}

	public void setExamNo(String examNo) {
		this.examNo = examNo;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getSingleId() {
		return singleId;
	}

	public void setSingleId(String singleId) {
		this.singleId = singleId;
	}

	public String getMultipleId() {
		return multipleId;
	}

	public void setMultipleId(String multipleId) {
		this.multipleId = multipleId;
	}

	public String getTrueFalseId() {
		return trueFalseId;
	}

	public void setTrueFalseId(String trueFalseId) {
		this.trueFalseId = trueFalseId;
	}

	public String getFillInGapsId() {
		return fillInGapsId;
	}

	public void setFillInGapsId(String fillInGapsId) {
		this.fillInGapsId = fillInGapsId;
	}

	public String getSimpleAnwserId() {
		return simpleAnwserId;
	}

	public void setSimpleAnwserId(String simpleAnwserId) {
		this.simpleAnwserId = simpleAnwserId;
	}

	public String getProgramId() {
		return programId;
	}

	public void setProgramId(String programId) {
		this.programId = programId;
	}

	public String getDescrpt() {
		return descrpt;
	}

	public void setDescrpt(String descrpt) {
		this.descrpt = descrpt;
	}

	public Integer getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(Integer validFlag) {
		this.validFlag = validFlag;
	}

	public List<SmdQuestions> getSmdQuestions() {
		return smdQuestions;
	}

	public void setSmdQuestions(List<SmdQuestions> smdQuestions) {
		this.smdQuestions = smdQuestions;
	}

	public List<FspQuestions> getFspQuestions() {
		return fspQuestions;
	}

	public void setFspQuestions(List<FspQuestions> fspQuestions) {
		this.fspQuestions = fspQuestions;
	}


}
