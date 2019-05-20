<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<link href="/MyBackground/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。可以根据需要只加载单个插件。 -->
    <script src="/MyBackground/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>后台用户查询</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="user_add_btn">新增</button>
				<button class="btn btn-danger" id="user_del_btn">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table id="user_table" class="table table-hover">
					<thead>
						<tr>
							<th>id</th>
							<th>phone</th>
							<th>name</th>
							<th>sex</th>
							<th>school</th>
							<th>major</th>
							<th>state</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div id="page_info" class="col-md-6">
				
			</div>
			<div id="page_nav" class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul id="page_nav_ul" class="pagination">
				  	
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- Modal:新增用户 -->
	<div class="modal fade" id="user_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">新增用户</h4>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal" id="user_add_form">
	      		<div class="form-group">
				    <label class="col-sm-2 control-label">Phone</label>
				    <div class="col-sm-10">
				    	<input type="tel" name="phone" class="form-control" id="phone_input" placeholder="请输入11位数字">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label">Password</label>
				    <div class="col-sm-10">
				    	<input type="password" name="pwd" class="form-control" id="pwd_input" placeholder="请输入6-16位字符">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label">Name</label>
				    <div class="col-sm-10">
				    	<input type="text" name="name" class="form-control" id="name_input" placeholder="请输入10位以下字符">
						<span class="help-block"></span>
					</div>
				</div>
			 	<div class="form-group">
				    <label class="col-sm-2 control-label">Sex</label>
				    <div class="col-sm-10">
				   		<label class="radio-inline">
				   			<input type="radio" name="sex" id="sex1_input" value="M">男
				   		</label>
				   		<label class="radio-inline">
			    			<input type="radio" name="sex" id="sex2_input" value="W">女
			    		</label>
			    	</div>
				</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label">School</label>
				    <div class="col-sm-10">
				    	<input type="text" name="school" class="form-control" id="school_input" placeholder="School">
					</div>
				</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label">Major</label>
				    <div class="col-sm-10">
				    	<input type="text" name="major" class="form-control" id="major_input" placeholder="Major">
					</div>
				</div>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="user_save_btn">Save</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		//1.页面加载完成后，发送ajax请求，拿到分页数据
		$(function(){
			to_page(1);
			$('#user_add_btn').click(function(){
				//清除表单数据
				//$('#user_add_modal')[0].reset();
				$('#user_add_modal').modal({
					backdrop:'static'
				});
			});
			//表单校验事件，sava按钮点击事件
			add_user_event();
			
		});
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/MyBackground/users",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					build_user_table(result);
					build_page_info(result);
					build_page_nav(result);	
				}
			});
		}
		//构建用户表
		function build_user_table(result){
			//清空用户表的body
			$("#user_table tbody").empty();
			var users = result.data.pageInfo.list;
			//遍历
			$.each(users, function(index, item){
				var id= $("<td></td>").append(item.id);
				var phone= $("<td></td>").append(item.phone);
				var name= $("<td></td>").append(item.name);
				var sex= $("<td></td>").append(item.sex == 'M'?"男":"女");
				var school= $("<td></td>").append(item.school);
				var major= $("<td></td>").append(item.major);
				var state= $("<td></td>").append(item.state);
				/* 
					<button class="btn btn-primary btn-xs">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
					</button>
					<button class="btn btn-danger btn-xs">
						<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
					</button>
				*/
				var btnEdit_Del = '<td><button class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>'
						+' <button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button></td>';
				$("<tr></tr>").append(id)
					.append(phone)
					.append(name)
					.append(sex)
					.append(school)
					.append(major)
					.append(state)
					.append(btnEdit_Del)
					.appendTo("#user_table tbody");
			});
		}
		//显示分页信息
		function build_page_info(result){
			$("#page_info").empty();
			$("#page_info").append("查询到"+result.data.pageInfo.total+"条记录，共"
					+result.data.pageInfo.pages+"页");
		}
		//构建分页栏
		function build_page_nav(result){
			//清空分页栏
			$("#page_nav_ul").empty();
			var ul= $("#page_nav_ul");
			var firstPageLi= $("<li></li>").append($("<a></a>").append("首页"));
			var prePageLi= $("<li></li>").append($("<a></a>").append("&laquo;"));
			var nextPageLi= $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi= $("<li></li>").append($("<a></a>").append("末页"));
			
			if(result.data.pageInfo.hasPreviousPage){
				ul.append(firstPageLi).append(prePageLi);
				//首页
				firstPageLi.click(function(){
					to_page(1);
				});
				//上一页
				prePageLi.click(function(){
					to_page(result.data.pageInfo.pageNum-1);
				});
			}
			//遍历页码
			$.each(result.data.pageInfo.navigatepageNums,function(index,item){
				var numLi= $("<li></li>").append($("<a></a>").append(item));
				if(result.data.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			})
			if(result.data.pageInfo.hasNextPage){
				ul.append(nextPageLi).append(lastPageLi);
				//下一页
				nextPageLi.click(function(){
					to_page(result.data.pageInfo.pageNum+1);
				});
				//末页
				lastPageLi.click(function(){
					to_page(result.data.pageInfo.pages);
				});
			}
		}
		//发送新增用户请求
		function add_user(){
			$.ajax({
				url:"${APP_PATH}/MyBackground/users",
				data:$('#user_add_form').serialize(),//序列化表单，用于ajax请求
				type:"POST",
				success:function(result){
					alert(result.info);
					$('#user_add_modal').modal('hide');
					to_page(1);
				}
			});
		}
		//用户注册事件管理
		function add_user_event(){
			var valPhone;
			var valPwd;
			var valName;
			//失焦事件：验证手机号
			 $('#phone_input').focusout(function(){
				 var phone = $('#phone_input').val();
				 var regPhone = /(^[0-9]{11}$)/;//正则表达式：11位数字
				 valPhone = element_validate('#phone_input',regPhone.test(phone),"手机号格式不正确");
				 if(valPhone){//如果通过正则表达式验证，再进行查重验证
						$.ajax({
							url:"${APP_PATH}/MyBackground/checkphone",
							data:"phone="+phone,//序列化表单，用于ajax请求
							type:"GET",
							success:function(result){
								//若状态码100，表示该手机号未注册
								valPhone = element_validate('#phone_input',result.code == 100,"手机号已注册");
							}
						});
					}
			 });
			//失焦事件：验证密码
			 $('#pwd_input').focusout(function(){
				 var pwd = $('#pwd_input').val();
				 var regPwd = /(^[a-zA-Z0-9_-]{6,16}$)/;//6-16位字符
				 valPwd = element_validate('#pwd_input',regPwd.test(pwd),"密码格式不正确");
			 });
			//失焦事件：验证用户名
			$('#name_input').focusout(function(){
				var name = $('#name_input').val();
				var regName = /(^[\u4E00-\u9FA5A-Za-z0-9]{1,8}$)/;//1-8个字符
				valName = element_validate('#name_input',regName.test(name),"用户名格式不正确");
			});
			//点击事件:提交注册信息
			$('#user_save_btn').click(function(){
				//三个输入框都验证通过：添加用户
				if(valPhone && valPwd && valName){
					add_user();
				}else{
					alert("保存失败");
				}				
			});
		}
		function element_validate(element, status, errorMsg){
			//移除当前元素的校验状态
			$(element).parent().removeClass("has-success has-error");
			if(status){
				$(element).parent().addClass('has-success');
				$(element).next('span').text("");
				return true;
			}else{
				$(element).parent().addClass('has-error');
				$(element).next('span').text(errorMsg);
				return false;
			}
		}
		
	</script>
</body>
</html>