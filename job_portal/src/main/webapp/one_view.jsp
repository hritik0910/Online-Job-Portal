 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: single job</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/view_j.jpg");
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
.carda{
    background: linear-gradient(45deg, #f9f1f1, white);
    box-shadow: 0 0 20px rgba(0, 144, 238, 144);}
</style>
</head>
<body class="container-fluid back-img">
<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBconnect.getConn());
				jobs j = dao.getJobById(id);
				%>
				</div>
				<div class="carda mt-2">
					<div class=card-body>
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>

						<div class="row gx-2">

							<div class="form-group col-md-3">
								<label>Location</label> <input type="text"
									class="form-control for-control-sm"
									value="<%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3 ">
								<label>Category</label> <input type="text"
									class="form-control for-control-sm"
									value="<%=j.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-4">
								<label>Published Date</label> <input type="text"
									class="form-control for-control-sm" value="<%=j.getPdate()%>"
									readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	</div>


</body>
</html>