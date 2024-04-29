
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
.carda{
    background: linear-gradient(45deg, #f9f1f1, white);
    box-shadow: 0 0 20px rgba(0, 144, 238, 144);}
</style>
</head>
<body class="container-fluid back-img">
	<%-- <c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>--%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">


			<div class="col-md-12">

				<h5 class="text-center text-white">All Jobs</h5>
				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msg = "";
				JobDAO dao = new JobDAO(DBconnect.getConn());
				List<jobs> list = null;
				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<jobs>();
					msg = "job not available";

				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobsORLocationAndCate(cat, loc);
				} else {
					list = dao.getJobsORLocationAndCate(cat, loc);
				}
				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Job Not Available</h4>
				<%
				}
				if (list != null) {
				for (jobs j : list) {
				%>
				<div class="carda mt-3">
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
				<%
				}
				} else {
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>



			</div>
		</div>
	</div>

</body>
</html>