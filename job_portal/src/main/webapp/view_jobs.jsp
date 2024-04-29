 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@page import="com.entity.jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Jobs</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/view_j.jpg");
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body class="container-fluid back-img">
<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
		
		
			<div class="col-md-12">
			
				<h5 class="text-center text-white">All Jobs</h5>
				<c:if test="${not empty succMsg }">
						<div class = "alert alert-success" role = "alert">${ succMsg }</div>
						<c:remove var="succMsg"/></c:if>
				<%
				JobDAO dao = new JobDAO(DBconnect.getConn());
				List<jobs> list  = dao.getAllJobs();
				for(jobs j : list){
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
					
					
					<h6><%=j.getTitle()%></h6>
					<p><%= j.getDescription()%></p>
					
					<div class="row gx-2">
					
						<div class="form-group col-md-3">
						<label>Location</label>
							<input type="text" class="form-control for-control-sm"
								value="<%=j.getLocation() %>" readonly>
						</div>
						<div class="form-group col-md-3 ">
						<label>Category</label>
							<input type="text" class="form-control for-control-sm"
								value="<%=j.getCategory() %>" readonly>
						</div>
						<div class="form-group col-md-2">
						<label>Status:</label>
							<input type="text" class="form-control for-control-sm"
								value="<%=j.getStatus() %>" readonly>
						</div>
						<div class="form-group col-md-4">
						<label>Published Date</label>
							<input type="text" class="form-control for-control-sm"
								value="<%=j.getPdate() %>" readonly>
						</div>
					</div>
					<!-- <h6>Publish Date:<%=j.getPdate() %></h6> -->
					<br>
					<div class="text-center">
						<a href="edit_job.jsp?id=<%=j.getId() %>" class="btn btn-m bg-success text-white">Edit</a> <a
							href="delete?id=<%=j.getId() %>" class="btn btn-m bg-danger text-white">Delete</a>
					</div>
					
				</div>
			
				</div>
					<%} %>
				
			</div>
			
			
		</div>
		
	</div>
	
	
</body>
</html>