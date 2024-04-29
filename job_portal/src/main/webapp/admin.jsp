
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Admin Page</title>

<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/admin_page.jpg");
	width:100%;
	height:83vh;
	background-repeat: no-repeat;
	background-size:cover;
}
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center ">
			<h1 class="text-white p-4">
				<i class="fa-solid fa-user-tie"></i> Welcome Admin
			</h1>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>