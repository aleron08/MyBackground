package com.ilearning.bean;

public class User {
    private Integer id;

    private String phone;

    private String pwd;

    private String name;

    private String picture;

    private String sex;

    private String school;

    private String major;

    private String hobby;

    private String state;
    
    public User() {
    	super();
    }

    public User(String phone, String pwd, String name) {
		super();
		this.phone = phone;
		this.pwd = pwd;
		this.name = name;
	}

	public User(Integer id, String phone, String pwd, String name, String picture, String sex, String school,
			String major, String hobby, String state) {
		super();
		this.id = id;
		this.phone = phone;
		this.pwd = pwd;
		this.name = name;
		this.picture = picture;
		this.sex = sex;
		this.school = school;
		this.major = major;
		this.hobby = hobby;
		this.state = state;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby == null ? null : hobby.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}