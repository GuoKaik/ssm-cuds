<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%pageContext.setAttribute("app_path",request.getContextPath()); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${app_path }/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
 	<script src="${app_path }/static/js/jQuery-v3.3.1.js"></script>
    <script src="${app_path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>人员信息</title>
</head>
<body>
	<div calss="container">
		<div class="row">
			<div class="col-lg-11 col-md-offset-1">
				<h1>SSM-CUDS</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-offset-8">
				<button type="button" class="btn btn-primary">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
		<div class="col-lg-10 col-md-offset-1">
			<table class="table">
				<tr>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
					<th>${emp.empId }</th>
					<th>${emp.empName }</th>
					<th>${emp.gender=='M'?'男':'女' }</th>
					<th>${emp.email }</th>
					<th>${emp.department.deptName }</th>
					<th>
						<button type="button" class="btn btn-primary btn-sm glyphicon glyphicon-pencil">编辑</button>
						<button type="button" class="btn btn-primary btn-sm glyphicon glyphicon-trash">删除</button>
					</th>
				</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		<div class="row">
		<div class="col-lg-4 col-md-offset-1">
			<h5>当前第${pageInfo.pageNum }页，总共${pageInfo.pages }页，总记录数${pageInfo.total }条</h5>
		</div>
			<div class="col-lg-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li><a href="${app_path }/emps?pn=1">首页</a></li>
				  	<c:if test="${pageInfo.hasPreviousPage }">
				  		<li>
					      <a href="${app_path }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				  	</c:if>
				    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
				    	<c:if test="${page_num==pageInfo.pageNum }">
				    		<li class="active"><a href="#">${page_num }</a></li>
				    	</c:if>
				    	<c:if test="${page_num!=pageInfo.pageNum }">
				    		<li><a href="${app_path }/emps?pn=${page_num }">${page_num }</a></li>
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${app_path }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <li><a href="${app_path }/emps?pn=${pageInfo.pages }">尾页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>