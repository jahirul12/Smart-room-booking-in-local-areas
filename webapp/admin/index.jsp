<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/css.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row p-5 mt-5">
			<h3 class="text-center mb-5">Admin Dashboard</h3>
			<div class="col-md-4 ">
				<a href="register.jsp" class="text-decoration-none">
					<div class="card card-sh">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
							<h4>Add User</h4>
							-----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 ">
				<a href="view_owner.jsp" class="text-decoration-none">
					<div class="card card-sh">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
							<h4>View Owner</h4>
							-----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="view_student.jsp" class="text-decoration-none">
					<div class="card card-sh">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
							<h4>View Student</h4>
							-----------
						</div>
					</div>
				</a>
			</div>


		</div>

	</div>
	<div style="margin-top: 250px"><%@include
			file="../component/footer.jsp"%></div>
</body>
</html>