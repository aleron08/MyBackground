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
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
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
						<c:forEach items="${pageInfo.list }" var="user">
							<tr>
								<th>${user.id }</th>
								<th>${user.phone }</th>
								<th>${user.name }</th>
								<th>${user.sex }</th>
								<th>${user.school }</th>
								<th>${user.major }</th>
								<th>${user.state }</th>
								<th>
									<button class="btn btn-primary btn-xs">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										编辑
									</button>
									<button class="btn btn-danger btn-xs">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										删除
									</button>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				共查询到${pageInfo.total }条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li><a href="${APP_PATH }/MyBackground/users?pn=1">首页</a></li>
				  	<c:if test="${pageInfo.hasPreviousPage }">
					  	<li>
					      <a href="${APP_PATH }/MyBackground/users?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				  	</c:if>
				    <c:forEach items="${pageInfo.navigatepageNums }" var="pn">
				    	<c:if test="${pn == pageInfo.pageNum }">
				    		<li class="active"><a href="#">${pn }</a></li>
				    	</c:if>
				    	<c:if test="${pn != pageInfo.pageNum }">
				    		<li><a href="${APP_PATH }/MyBackground/users?pn=${pn }">${pn }</a></li>
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage }">
				    	<li>
					      <a href="${APP_PATH }/MyBackground/users?pn=${pageInfo.pageNum+1 }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <li><a href="${APP_PATH }/MyBackground/users?pn=${pageInfo.pages }">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>