 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-briefcase"></i> Job Portal</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link "
					aria-current="page" href="home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
					 <c:if test="${userobj.role eq 'admin'}" >
					<li class="nav-item"><a class="nav-link" href="add_job.jsp"><i class="fa-solid fa-circle-plus"></i> Post Job</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i class="fa-regular fa-eye"></i> View Job</a>
				</li>
				 	</c:if>
				
				</ul>


				<form class="d-flex">
				<c:if test="${userobj.role eq 'admin'}">
				<a href = "#" class  = btn><i class="fa-solid fa-arrow-right-to-bracket"></i> Admin</a>
				</c:if>
				<c:if test="${userobj.role eq 'user'}">
				<a href = "#" class  = btn><i class="fa-solid fa-arrow-right-to-bracket"></i> ${userobj.name} 
				</a>
				</c:if>
				<c:if test="${userobj.role eq 'admin' || userobj.role eq 'user' }">
					<a href = "Login.jsp" class  = btn ><i class="fa-regular fa-user"></i> Logout</a>
				</c:if>
				<c:if test="${empty userobj}">
				<a href = "Login.jsp" class  = btn><i class="fa-solid fa-arrow-right-to-bracket"></i> login</a>
					<a href = "register.jsp" class  = btn ><i class="fa-regular fa-user"></i> Register</a>
				</c:if>
					
				</form>
		</div>
	</div>
</nav>