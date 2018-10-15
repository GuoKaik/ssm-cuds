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
				<button type="button" class="btn btn-primary" id="emp_add_btn">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
		<div class="col-lg-10 col-md-offset-1">
			<table class="table" id="emp_table">
			<thead>
				<tr>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
		</div>
		</div>
		<div class="row">
		<div class="col-lg-4 col-md-offset-1" id="pageInfo">
			
		</div>
		<div class="col-lg-6" id="navPage">
			
		</div>
		</div>
		<!--员工添加弹出框-->
		<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
		      </div>
		      <div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
					    <label class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="emp_name" name="empName" placeholder="empName">
					    </div>
					 </div>
					<div class="form-group">
					    <label class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="email" class="form-control" id="emp_email" name="email" placeholder="Email">
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Deptment</label>
					    <div class="col-sm-10">
					      <select class="form-control" name="dId" id="select_department">
						</select>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">gender</label>
					    <div class="col-sm-10">
						    <input type="radio" name="gender" id="gender1" value="M"> 男
							<input type="radio" name="gender" id="gender2" value="F"> 女
					    </div>
				  </div>
				</form>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" id="emp_addForm_btn">添加</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 更该员工信息弹出框 -->
		<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
		      </div>
		      <div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
					    <label class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="emp_update_name" name="empName" placeholder="empName">
					    </div>
					 </div>
					<div class="form-group">
					    <label class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="email" class="form-control" id="emp_update_email" name="email" placeholder="Email">
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Deptment</label>
					    <div class="col-sm-10">
					      <select class="form-control" name="dId" id="select_update_department">
						</select>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">gender</label>
					    <div class="col-sm-10">
						    <input type="radio" name="gender" id="gender1" value="M"> 男
							<input type="radio" name="gender" id="gender2" value="F"> 女
					    </div>
				  </div>
				</form>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" id="emp_addForm_btn">添加</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<script>
		$(function(){
			empsQuery(1);
		})
		function empsQuery(pageNum){
			$.ajax({
				url:"${app_path }/emps",
				data:"pn="+pageNum,
				dataType:"json",
				success:function(result){
					empsCallback(result);
					pageinfoCallBack(result);
					pageNavCallBack(result);
				}
			})
		}
		function empsCallback(result){
			$("#emp_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var empId = $("<td></td>").append(item.empId);
				var empName = $("<td></td>").append(item.empName);
				var email = $("<td></td>").append(item.email);
				var gender = $("<td></td>").append(item.gender=="F"?"女":"男");
				var deptName = $("<td></td>").append(item.department.deptName);
				//<button type="button" class="btn btn-primary btn-sm glyphicon glyphicon-pencil">编辑</button>
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm glyphicon glyphicon-pencil").append("编辑").on("click",function(){
					empEdit(item.empId);
				});
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm glyphicon glyphicon-trash").append("删除");
				var btntd = $("<td></td>").append(editBtn).append(delBtn);
			$("<tr></tr>").append(empId)
						.append(empName)
						.append(gender)
						.append(email)
						.append(deptName)
						.append(btntd)
						.appendTo("#emp_table tbody");
			})
		}
		function pageinfoCallBack(result){
			$("#pageInfo").empty();
			var pageNum = result.extend.pageInfo.pageNum;
			var pages = result.extend.pageInfo.pages;
			var total = result.extend.pageInfo.total;
			$("#pageInfo").append($("<h5></h5>").append("当前第"+pageNum+"页，总共"+pages+"页，总记录数"+total+"条"))
		}
		function pageNavCallBack(result){
			var pageNum = result.extend.pageInfo.pageNum;
			$("#navPage").empty();
			var navigatepageNums = result.extend.pageInfo.navigatepageNums;
			var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
			var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
			var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
			var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
			firstPage.click(function(){
				empsQuery(1)
			})
			
			prePage.click(function(){
				if(result.extend.pageInfo.hasPreviousPage){
					empsQuery(pageNum-1)
				}
			})
			
			lastPage.click(function(){
				empsQuery(result.extend.pageInfo.pages)
			})
			
			nextPage.click(function(){
				if(result.extend.pageInfo.hasNextPage){
					empsQuery(pageNum+1)
				}
			})
			var ul = $("<ul></ul>").addClass("pagination")
				.append(firstPage)
				.append(prePage);
			$.each(navigatepageNums,function(index,item){
				var li = $("<li></li>").append($("<a></a>").append(item));
				if(pageNum == item){
					li.addClass("active");
				}
				li.click(function(){
					empsQuery(item)
				})
				ul.append(li);
			})
				ul.append(nextPage)
				.append(lastPage);
			var navDom = $("<nav></nav>").append(ul);
			navDom.appendTo("#navPage")
		}
		$("#emp_add_btn").click(function(){
			getDeptName();
			$("#empAddModal").modal({
				backdrop:"static"
			})
		})
		$("#emp_addForm_btn").click(function(){
			var data = $("#empAddModal form").serialize();
			$.ajax({
				url:"${app_path }/emps",
				data:data,
				type:"post",
				dataType:"json",
				success:function(result){
					$("#empAddModal").modal("hide");
					empsQuery(9999);
				}
			})
		})
		
		function getDeptName(){
			$.ajax({
				url:"${app_path }/getDeptName",
				data:"",
				dataType:"json",
				success:function(result){
					empAddDepartmentCallBack(result);
				}
			})
		}
		function empAddDepartmentCallBack(result){
			$.each(result.extend.depts,function(index,item){
				$("#select_department").append($("<option></option>").append(item.deptName).attr("value",item.deptId))
			})
		}
		function empEdit(empId){
			$.ajax({
				url:"${app_path }/emps/"+empId,
				//data:"empId="+empId,
				type:"GET",
				dataType:"json",
				success:function(result){
					$("#emp_update_name").val(result.extend.employee.empName);
					$("#emp_update_email").val(result.extend.employee.email);
					$("#select_update_department").val(result.extend.employee.empName);
					$("#empUpdateModal").modal({
						backdrop:"static"
					})
				}
			})
			
		}
	</script>
</body>
</html>