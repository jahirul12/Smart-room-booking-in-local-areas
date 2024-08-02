<%@page import="com.entity.User"%>
<%@page import="com.entity.NearLocation"%>
<%@page import="com.entity.RoomImage"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Room"%>
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
<%@include file="component/css.jsp"%>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	RoomDAO dao = new RoomDAO(DBConnect.getConnection());
	Room room = dao.getRoomDetailsById(id);
	User user = (User) session.getAttribute("userObj");
	%>

	<div class="container card-sh" style="margin-top: 70px">
		<div class="row">
			<p class="fs-3 text-center">Room Details</p>

			<div class="col-md-12 paint-card p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div id="carouselExample" class="carousel slide">
								<div class="carousel-inner">
									<%
									int i = 0;
									List<RoomImage> images = dao.getRoomImageByRoomId(room.getId());
									for (RoomImage img : images) {
									%>
									<div class="carousel-item <%if (i == 0) {
										i++;%>active<%}%>">
										<img src="data/img/product_img/<%=img.getImage()%>"
											width="100%" height="350px" class="d-block w-100" alt="...">
									</div>
									<%
									}
									%>

								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExample" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExample" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
						<div class="bg-light mt-3 p-3 card-sh">
							<p class="fs-5 tex-center">Near By Places</p>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">Places</th>
										<th scope="col">Distances</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<NearLocation> locations = dao.getNearLocation(id);
									for (NearLocation loc : locations) {
									%>
									<tr>
										<th scope="row"><%=loc.getName()%></th>
										<td><%=loc.getDistance()%></td>
									</tr>
									<%
									}
									%>


								</tbody>
							</table>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card card-sh">
							<div class="card-header text-center fs-5">Booking Details</div>
							<c:if test="${not empty errorMsg}">
								<p class="fw-bold text-center text-danger">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg}">
								<p class=" fw-bold text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							<div class="card-body">
								<form action="bookRoom" method="post"
									enctype="multipart/form-data">
									<div class="mb-3">
										<label>Name</label> <input type="text" class="form-control"
											name="name" required>
									</div>
									<div class="mb-3">
										<label>Email</label> <input type="email" class="form-control"
											name="email" required>
									</div>
									<div class="mb-3">
										<label>Address</label> <input type="text" class="form-control"
											name="address" required>
									</div>

									<div class="mb-3">
										<label>Id Proof</label> <input type="file"
											class="form-control" name="idProof" required>
									</div>

									<div class="mb-1">
										<label>Student</label>
										<div class="row p-3">
											<div class="form-check col">
												<input class="form-check-input" type="radio" checked
													name="student" id="flexRadioDefault1"> <label
													class="form-check-label" for="flexRadioDefault1">
													Yes</label>
											</div>
											<div class="form-check col">
												<input class="form-check-input" type="radio" name="student"
													id="flexRadioDefault2"> <label
													class="form-check-label" for="flexRadioDefault2">
													No </label>
											</div>
										</div>

									</div>

									<div class="mb-3">
										<label>College Name</label> <input type="text"
											class="form-control" name="college" required>
									</div>
									<input type="hidden" name="userId" value="<%=user.getId()%>">
									<input type="hidden" name="roomId" value="<%=room.getId()%>">
									<input type="hidden" name="ownerId"
										value="<%=room.getOwnerId()%>">
									
									
									<button class="btn btn-primary">Book</button>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>