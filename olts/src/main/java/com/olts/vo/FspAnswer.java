 package com.olts.vo;

public class FspAnswer {
	private Integer Id;
	private String answer;// 答案
	private Integer fspId;// 填空题，简答题，编程题的题号
	private String exam_no;// 考试编号
	Integer userId;// 用户编号
	
	private FspQuestions fspQuestions;
	
	public FspAnswer() {
		super();
	}

	public FspAnswer(Integer id, String answer, Integer fspId, String exam_no,
			Integer userId) {
		super();
		Id = id;
		this.answer = answer;
		this.fspId = fspId;
		this.exam_no = exam_no;
		this.userId = userId;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getFspId() {
		return fspId;
	}

	public void setFspId(Integer fspId) {
		this.fspId = fspId;
	}

	public String getExam_no() {
		return exam_no;
	}

	public void setExam_no(String exam_no) {
		this.exam_no = exam_no;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public FspQuestions getFspQuestions() {
		return fspQuestions;
	}

	public void setFspQuestions(FspQuestions fspQuestions) {
		this.fspQuestions = fspQuestions;
	}

	@Override
	public String toString() {
		return "FspAnswer [Id=" + Id + ", answer=" + answer + ", fspId="
				+ fspId + ", exam_no=" + exam_no + ", userId=" + userId + "]";
	}

}
