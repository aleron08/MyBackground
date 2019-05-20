package com.ilearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ilearning.bean.Msg;
import com.ilearning.bean.User;
import com.ilearning.bean.UserExample;
import com.ilearning.bean.UserExample.Criteria;
import com.ilearning.dao.UserMapper;
import com.ilearning.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	/**
	 * 检查手机号是否注册
	 * @param phone
	 * @return
	 */
	@RequestMapping("/checkphone")
	@ResponseBody
	public Msg checkPhone(@RequestParam("phone")String phone) {
		if (userService.checkPhone(phone)) {
			return Msg.succeed();
		}else {
			return Msg.failed();
		}
	}
	
	/**
	 * 用户查询
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/users")
	@ResponseBody
	public Msg getUsersWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn, 
			Model model){
		//在查询之前调用PageHelper分页查询插件
		PageHelper.startPage(pn, 8);
		//降序排列
		PageHelper.orderBy("id desc");
		//startPage方法后面紧跟的这个查询就是分页查询
		List<User> users = userService.getAll();
		//使用PageInfo包装查询的结果d
		PageInfo<User> pageInfo = new PageInfo<User>(users,5);
		return Msg.succeed().add("pageInfo", pageInfo);
	}
	
	
	@RequestMapping(value="/users", method=RequestMethod.POST)
	@ResponseBody
	public Msg addUser(User user) {
		userService.addUser(user);
		return Msg.succeed();
	}
	
	/**
	 * 分页查询用户数据
	 */
	//@RequestMapping("/users")
	public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn, 
			Model model) {
		//在查询之前调用PageHelper分页查询插件
		PageHelper.startPage(pn, 8);
		//startPage方法后面紧跟的这个查询就是分页查询
		List<User> users = userService.getAll();
		//使用PageInfo包装查询的结果
		PageInfo<User> pageInfo = new PageInfo<User>(users,5);
		model.addAttribute("pageInfo",pageInfo);
		return "list";
	}
}
