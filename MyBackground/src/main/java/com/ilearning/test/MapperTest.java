package com.ilearning.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ilearning.bean.User;
import com.ilearning.dao.UserMapper;

/**
 * 测试dao层
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	UserMapper userMapper;
	
	/**
	 * 测试UserMapper
	 */	
	@Test
	public void testUser() {
		System.out.println(userMapper);
		
		try {
			userMapper.insertSelective(new User("15972571147", "cold08", "alan"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			userMapper.insertSelective(new User("110", "cold08", "police"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
