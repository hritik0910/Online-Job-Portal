 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration page</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/jobs.jpg");
	width:100%;
	height:92vh;
	background-repeat: no-repeat;
	background-size:cover;
}
.navbar{
	position: fixed;
	width: 100%;
	
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
	<div class="row p-5">
		<div class="col-md-4 offset-md-4 shadow p-3 mb-5 bg-white rounded mt-3">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
						<i class="fa-solid fa-user-plus fa-2xl"></i>
						<h5>Registration Page</h5>
						<c:if test="${not empty succMsg }">
						<div class = "alert alert-success" role = "alert">${ succMsg }</div>
						<c:remove var="succMsg"/></c:if>
					</div>
					<form action="add_user" method="post">
						<div class="form-group">
							<label><b>Enter Full Name</label> <input type="text"
								placeholder="First name" class="form-control" required="required" name="name">
							<label>Enter Qualification</label><input type="text"
								placeholder="Qualification" class="form-control" required="required" name="qua">
							<label>Enter Email</label> <input type="email"
								required="required" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="abc@gmail.com" name="email">
							<div id="emailHelp" class="form-text"></b> We'll never share
								your email with anyone else.</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"><b>Enter Password</b></label> <input
								required="required" type="password" placeholder="Password" class="form-control"
								id="exampleInputPassword1" name="ps">
						</div>

						<button type="submit"
							class="btn btn-success badge-pill btn-block w-100 mt-3 rounded-pill">Sign Up</button>
					</form>
				</div>
			</div>
		</div></div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>