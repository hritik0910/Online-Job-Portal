
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBconnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit_Job</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/admin_page.jpg");
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body">
<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="container p-2">
			<div class="col-md-10 offset-md-1">
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-success">
							<i class="fa-solid fa-file-pen fa-2x"></i>
							<%
							int id = Integer.parseInt(request.getParameter("id"));
							JobDAO dao = new JobDAO(DBconnect.getConn());
							jobs j = dao.getJobById(id);
							%>
							<p>Edit job<p>
						</div>
						<form action="update" method="post">
						<input type = "hidden" value="<%=j.getId()%>" name="id">
							<div class="form-group">
								<label><%=j.getTitle()%></label><input type="text" name="title"
									required class="form-control text-success"
									value="<%=j.getTitle()%>">
							</div>
							<div>
							<div class="form-control col-md-2 mt-2">
								<label>Location</label><select name="location"
									class="form-control  text-success">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%>
									</option>
									<option value="Delhi">Delhi</option>
									<option value="Noida">Noida</option>
									<option value="Gurugram">Gurugram</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Chennai">Chennai</option>
									<option value="Banglore">Banglore</option>
								</select>
							</div>
							<div class="form-control col-md-2 mt-2">
								<label>Category</label><select class="form-control text-success"
									name="category">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>

									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>

								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control text-success"
									name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group ">
								<label>Enter Description</label>
								<textarea required rows="6" cols="" name="desc"
									class="form-control text-success" placeholder="<%=j.getDescription()%>"></textarea>
							</div>
							<div class="text-center">
								<button class="btn btn-success  mt-3 ">Update Job</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>