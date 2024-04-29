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
<title>User : Home</title>
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
<c:if test="${empty userobj }">
<c:redirect url = "Login.jsp" />
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-white">All Jobs</h5>
				<div class="card">
					<div class="card-body">

						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="form-control for-control-sm"
									id="inlineFormCustomSelectPref">
									<option value="lo">Choose...</option>
									<option value="Delhi">Delhi</option>
									<option value="Noida">Noida</option>
									<option value="Gurugram">Gurugram</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Chennai">Chennai</option>
									<option value="Banglore">Banglore</option>
								</select>
							</div>
							<div class="form-group col-md-5 mt-1">
								<h5>Category</h5>
							</div>
							<div class="form-group col-md-5">
								<select class="form-control for-control-sm"
									id="inlineFormCustomSelectPref" name="cat">
									<option value="ca">Choose...</option>

									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>

								</select>
							</div>
							<button class="btn btn-success  mt-3 ">Submit</button>
</form>

					</div>
				</div>
			<%
			JobDAO dao = new JobDAO(DBconnect.getConn());
				List<jobs> list = dao.getAllJobsForUser();
				for (jobs j: list){
				
			%>
			<div class = "card mt-2">
			<div class = "card-body">
			<div class = "text-center text-primary">
			<i class = "far fa-clipboard fa-2x"></i>
			</div>
			<h6>
			<%=j.getTitle() %></h6>
			<%
			if(j.getDescription().length() > 0 && j.getDescription().length()<120){
				
			%>
			<p> <%=j.getDescription()%></p>
			<%
			}
			else{%>
			<p><%=j.getDescription().substring(0,120) %>...</p>
			<%}
			%>
			<br>
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
						<div class="form-group col-md-4">
						<label>Published Date</label>
							<input type="text" class="form-control for-control-sm"
								value="<%=j.getPdate().toString() %>" readonly>
						</div>
						</div>
						<div class = "text-center">
						<a href="one_view.jsp?id=<%= j.getId()%>" class ="btn btn-success  mt-3 text-white">View More</a></div>
						
			</div></div>
			</div>
			<%} %>
		</div>
	</div>
</body>
</html>