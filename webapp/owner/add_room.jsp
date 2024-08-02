<%@page import="com.entity.User"%>
<%@page import="com.entity.RoomType"%>
<%@page import="com.entity.Category"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.dao.RoomDAO"%>
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
	<%
	User user = (User) session.getAttribute("userObj");
	%>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row p-5 mt-3">
			<div class="col-md-10 offset-md-1">
				<div class="card card-sh">
					<div class="card-header text-center">
						<h3 class="text-center">Add Room</h3>
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

						<form action="../addRoom" method="post">
							<div class="row">
								<div class="mb-3 col">
									<label>Enter Title</label> <input type="text" required
										class="form-control" name="title">
								</div>
								<div class="mb-3 col">
									<label>Category</label> <select class="form-control" required
										name="category">
										<option>--select--</option>
										<%
										RoomDAO dao = new RoomDAO(DBConnect.getConnection());
										List<Category> list = dao.getAllCategory();
										for (Category c : list) {
										%>
										<option><%=c.getName()%></option>
										<%
										}
										%>
										
									</select>
								</div>
								<div class="mb-3 col">
									<label>Room type</label> <select class="form-control" required
										name="roomType">
										<option>--select--</option>
										<%
										List<RoomType> rooms = dao.getAllRoomType();
										for (RoomType r : rooms) {
										%>
										<option><%=r.getName()%></option>
										<%
										}
										%>

									</select>
								</div>
							</div>
							<div class="mb-3">
								<label>Enter Description</label>
								<textarea rows="3" cols="" name="description" required
									class="form-control"></textarea>
							</div>

							<div class="row">
								<div class="col mb-3">
									<label>Email</label> <input type="email" class="form-control" required
										name="email">
								</div>
								<div class="col mb-3"> 
									<label>Mobile number</label> <input type="number" required
										class="form-control" name="mobileNumber">
								</div>
								<div class="mb-3 col">
									<label>Price / Monthly</label> <input type="number" required
										class="form-control" name="monthlyCost">
								</div>

							</div>
							<div class="row">
								<div class="col mb-3">
									<label>Location Link</label> <input type="text" required
										class="form-control" name="locationLink">
								</div>
								<div class="col mb-3">
									<label>Distance</label> <input type="text" class="form-control" required
										name="distance">
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label>Address</label> <input type="text" class="form-control" required
										name="address">
								</div>
								<div class="col mb-3">
									<label>City</label> <input type="text" class="form-control" required
										name="city">
								</div>
								<div class="col mb-3">
									<label>State</label> <input type="text" class="form-control" required
										name="state">
								</div>
								<div class="col mb-3">
									<label>Pincode</label> <input type="text" class="form-control" required
										name="pincode">
								</div>
								<input type="hidden" class="form-control" name="ownerId"
									value="<%=user.getId()%>">
							</div>
							<button class="btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>