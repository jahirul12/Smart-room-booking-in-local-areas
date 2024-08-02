<%@page import="com.entity.User"%>
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
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row p-5 mt-3">
			<div class="card card-sh">
				<div class="card-header">
					<h3 class="text-center">View Rooms</h3>
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
								<th scope="col">Title</th>
								<th scope="col">Category</th>
								<th scope="col">Room Type</th>
								<th scope="col">Price / Monthly</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							User user = (User) session.getAttribute("userObj");
							int i = 0;
							RoomDAO dao = new RoomDAO(DBConnect.getConnection());
							List<Room> rooms = dao.getAllRoomByUser(user.getId());
							for (Room rm : rooms) {
								i++;
							%>
							<tr>
								<td><%=i%></td>
								<td><%=rm.getTitle()%></td>
								<td><%=rm.getCategory()%></td>
								<td><%=rm.getRoomType()%></td>
								<td><%=rm.getMonthlyCost()%></td>
								<td><a href="near_location.jsp?id=<%=rm.getId()%>"
									class="btn btn-sm btn-success">Location</a> <a
									href="image_upload.jsp?id=<%=rm.getId()%>"
									class="btn btn-sm btn-warning"> Upload Image</a> <a
									href="edit_room.jsp?id=<%=rm.getId()%>"
									class="btn btn-sm btn-primary">Edit</a> <a
									href="../deleteRoom?id=<%=rm.getId()%>"
									class="btn btn-sm btn-danger">Delete</a></td>
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