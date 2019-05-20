package com.ilearning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilearning.bean.User;
import com.ilearning.bean.UserExample;
import com.ilearning.bean.UserExample.Criteria;
import com.ilearning.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> getAll() {
		return userMapper.selectByExample(null);
	}
	
	/**
	 * 添加新用户
	 * @param user
	 */
	public void addUser(User user) {
		userMapper.insertSelective(user);
	}
	
	/**
	 * 检查手机号是否被注册
	 * 没有该手机号：返回true
	 * @param phone
	 * @return
	 */
	public boolean checkPhone(String phone) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		long count = userMapper.countByExample(example);
		return count == 0;
	}

}
