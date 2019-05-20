package com.ilearning.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//状态码：100-成功	200-失败
	private int code;
	//提示信息
	private String info;
	//返回的数据
	private Map<String, Object> data = new HashMap<String, Object>();
	
	public static Msg succeed() {
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setInfo("成功！");
		return msg;
	}

	public static Msg failed() {
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setInfo("失败！");
		return msg;
	}
	
	public Msg add(String key, Object value) {
		this.getData().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
}
