package com.olts.mapper;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.olts.vo.FspAnswer;
import com.olts.vo.OltsUser;
import com.olts.vo.Page;

//扫描映射器接口的时候自动加
@Repository
public interface UserMapper extends BaseMapper<OltsUser, Integer>{
	public OltsUser login(OltsUser user);
	
	public OltsUser stulogin(OltsUser user);
	
	//新增用户
	public void insertUser(OltsUser user);
	
	
	//新增用户（list）
	public void savaUser2(List<OltsUser> list);
	
	//根据试卷号查学生主观答卷
	public List<OltsUser> selectStudentAndAnswer(FspAnswer fspAnswer);
	
	//修改用户信息
	public void updateUserInfo(OltsUser user);
	
	//修改用户的联系方式
	public void updateUserContact(OltsUser user);
	
	//修改用户全部信息
	public void updateUser(OltsUser user);
	
	//得到所有用户信息
	public List<OltsUser> selectAllUser(Page<OltsUser> user);
	
	//得到用户数量
	public int countForUser(Page<OltsUser> house);
	
	//根据id删除用户数据
	public void deleteUserById(Integer id);
	
//	根据id批量删除用户
	public void delSelectUser(int[] delID);
}
