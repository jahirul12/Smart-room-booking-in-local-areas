<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.entity.Room"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.dao.RoomDAO"%>
<%@page import="java.util.List"%>
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
			<div class="card card-sh">
				<div class="card-header">
					<h3 class="text-center">View Owners</h3>
					<c:if test="${not empty errorMsg}">
						<p class="fs-4 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<p class=" fs-4 text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">SL No</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Mobile Number</th>
								<th scope="col">Address</th>
								<th scope="col">User Type</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							int i = 0;
							UserDAO dao2 = new UserDAO(DBConnect.getConnection());
							RoomDAO dao = new RoomDAO(DBConnect.getConnection());
							List<User> students = dao2.getAllUserByType("Owner");
							for (User u : students) {
								i++;
							%>
							<tr>
								<td><%=i%></td>
								<td><%=u.getFullName()%></td>
								<td><%=u.getEmail()%></td>
								<td><%=u.getMobNo()%></td>
								<td><%=u.getAddress()%>,<%=u.getCity()%><br><%=u.getState()%>,<%=u.getPin()%></td>
								<td><%=u.getUser()%></td>
								<td><a href="../deleteUser?id=<%=u.getId()%>&type=owner" class="btn btn-sm btn-danger">Delete</a></td>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>