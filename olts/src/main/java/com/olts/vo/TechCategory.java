package com.olts.vo;

/**
 * 知识点分类表
 * 
 * @author gg
 *
 */
public class TechCategory {
	private Integer id;
	private String techCtgr;
	private Integer courseId;
	private Courses courses;
	public TechCategory() {
		super();
	}

	public TechCategory(Integer id, String techCtgr, Integer courseId) {
		super();
		this.id = id;
		this.techCtgr = techCtgr;
		this.courseId = courseId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTechCtgr() {
		return techCtgr;
	}

	public void setTechCtgr(String techCtgr) {
		this.techCtgr = techCtgr;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Override
	public String toString() {
		return "TechCategory [id=" + id + ", techCtgr=" + techCtgr
				+ ", courseId=" + courseId + "]";
	}

}
