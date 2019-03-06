package com.olts.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.stereotype.Service;

import com.olts.mapper.UserMapper;
import com.olts.service.IUserService;
import com.olts.vo.FspAnswer;
import com.olts.vo.OltsUser;
import com.olts.vo.Page;

@Service("userService")
public class UserServiceImpl implements IUserService {
	// 可以为属性注入依赖
	@Resource
	UserMapper userMapper;

	// 把事务控制在Service层，这个业务方法有可能要多个数据库操作完成，所有操作要在一个事务完成，粗粒度
	// 如果一个service类需要用到多个Mapper映射器接口，那么你可注入多个
	@Override
	public OltsUser selectForLogin(OltsUser user) {
		return userMapper.login(user);
	}

	@Override
	public void insertUser(OltsUser user) {
		userMapper.insertUser(user);
		
	}

	@Override
	public void updateUserInfo(OltsUser user) {
		userMapper.updateUserInfo(user);
	}

	@Override
	public void updateUserContact(OltsUser user) {
		userMapper.updateUserContact(user);
	}

	//查找所有用户信息
	@Override
	public List<OltsUser> selectAllUser(Page<OltsUser> page) {
		return userMapper.selectAllUser(page);
	}

	@Override
	public int countForUser(Page<OltsUser> page) {
		return userMapper.countForUser(page);
	}

	@Override
	public void deleteUserById(Integer id) {
		userMapper.deleteUserById(id);
	}

	@Override
	public void updateUser(OltsUser user) {
		userMapper.updateUser(user);
		
	}

	@Override
	public void delSelectUser(int[] delID) {
		userMapper.delSelectUser(delID);
	}

	@Override
	public OltsUser stulogin(OltsUser user) {
		OltsUser stu = userMapper.stulogin(user);
		return stu;
	}
	
	@Override
	public List<OltsUser> selectStudentAndAnswer(FspAnswer fspAnswer) {
		return userMapper.selectStudentAndAnswer(fspAnswer);
	}
}
