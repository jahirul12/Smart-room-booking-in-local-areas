<%@page import="com.entity.Room"%>
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
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row p-5 mt-3">
			<div class="col-md-10 offset-md-1">
				<div class="card card-sh">
					<div class="card-header text-center">
						<h3 class="text-center">Edit Room</h3>
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
						<%
						RoomDAO dao = new RoomDAO(DBConnect.getConnection());
						int id = Integer.parseInt(request.getParameter("id"));
						Room rm = dao.getRoomDetailsById(id);
						%>
						<form action="../updateRoom" method="post">
							<div class="row">
								<div class="mb-3 col">
									<label>Enter Title</label> <input type="text"
										class="form-control" name="title" value="<%=rm.getTitle()%>">
								</div>
								<div class="mb-3 col">
									<label>Category</label> <select class="form-control"
										name="category">
										<option><%=rm.getCategory()%></option>
										<%
										List<Category> list = dao.getAllCategory();
										for (Category c : list) {
											if (!c.getName().equalsIgnoreCase(rm.getCategory())) {
										%>
										<option><%=c.getName()%></option>
										<%
										}
										}
										%>
										<option>PG</option>
									</select>
								</div>
								<div class="mb-3 col">
									<label>Room type</label> <select class="form-control"
										name="roomType">
										<option><%=rm.getRoomType()%></option>
										<%
										List<RoomType> rooms = dao.getAllRoomType();
										for (RoomType r : rooms) {
											if (!r.getName().equals(rm.getRoomType())) {
										%>
										<option><%=r.getName()%></option>
										<%
										}

										}
										%>

									</select>
								</div>
							</div>
							<div class="mb-3">
								<label>Enter Description</label>
								<textarea rows="3" cols="" name="description"
									class="form-control"><%=rm.getDescription()%></textarea>
							</div>

							<div class="row">
								<div class="col mb-3">
									<label>Email</label> <input type="email" class="form-control"
										name="email" value="<%=rm.getEmail()%>">
								</div>
								<div class="col mb-3">
									<label>Mobile number</label> <input type="number"
										class="form-control" name="mobileNumber"
										value="<%=rm.getMobileNumber()%>">
								</div>
								<div class="mb-3 col">
									<label>Price / Monthly</label> <input type="number"
										class="form-control" name="monthlyCost"
										value="<%=rm.getMonthlyCost()%>">
								</div>

							</div>
							<div class="row">
								<div class="col mb-3">
									<label>Location Link</label> <input type="text"
										class="form-control" name="locationLink"
										value="<%=rm.getLocationLink()%>">
								</div>
								<div class="col mb-3">
									<label>Distance</label> <input type="text" class="form-control"
										value="<%=rm.getDistance()%>" name="distance">
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label>Address</label> <input type="text" class="form-control"
										value="<%=rm.getAddress()%>" name="address">
								</div>
								<div class="col mb-3">
									<label>City</label> <input type="text" class="form-control"
										value="<%=rm.getCity()%>" name="city">
								</div>
								<div class="col mb-3">
									<label>State</label> <input type="text" class="form-control"
										value="<%=rm.getState()%>" name="state">
								</div>
								<div class="col mb-3">
									<label>Pincode</label> <input type="text" class="form-control"
										value="<%=rm.getPincode()%>" name="pincode">
								</div>
								<div class="col mb-3">
									<label>Status</label><select class="form-control" name="status">

										<%
										if (rm.getStatus().equals("Available")) {
										%>
										<option>Available</option>
										<option>Not Available</option>
										<%
										} else {
										%>
										<option>Not Available</option>
										<option>Available</option>
										<%
										}
										%>

									</select>
								</div>
								<input type="hidden" class="form-control" name="ownerId"
									value="1"> <input type="hidden" class="form-control"
									name="id" value="<%=rm.getId()%>">
							</div>
							<button class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>