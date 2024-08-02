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
	<%@include file="component/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	RoomDAO dao = new RoomDAO(DBConnect.getConnection());
	Room room = dao.getRoomDetailsById(id);
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
									RoomDAO dao2 = new RoomDAO(DBConnect.getConnection());
									List<NearLocation> locations = dao2.getNearLocation(id);
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
						<p class="fs-3"><%=room.getTitle()%></p>
						<p>
							<span class="fw-bold">Description : </span><br><%=room.getDescription()%>
						</p>
						<p>
							<span class="fw-bold"> Room Details: </span> <br>Status :
							<%
 if (room.getStatus().equalsIgnoreCase("Available")) {
 %>
							<span class="badge bg-success">Available</span>
							<%
							} else {
							%>
							<span class="badge bg-warning">Not Available</span>
							<%
							}
							%>

							<br> Category :
							<%=room.getCategory()%><br> Room Type :
							<%=room.getRoomType()%>
						</p>
						<p class="fs-5 fw-bold">
							Price :&nbsp; &nbsp; &nbsp; &nbsp;<i class="fas fa-rupee-sign"></i>
							<%=room.getMonthlyCost()%>/Month
						</p>
						<c:if test="${empty userObj }">
							<%
							if (room.getStatus().equals("Not Available")) {
							%>
							<a href="#" class="btn btn-warning col-md-12">Not Available</a>
							<%
							} else {
							%>
							<a href="login.jsp" class="btn btn-danger col-md-12">Book</a>
							<%
							}
							%>

						</c:if>
						<c:if test="${not empty userObj }">
							<%
							if (room.getStatus().equals("Not Available")) {
							%>
							<a href="#" class="btn btn-warning col-md-12">Not Available</a>
							<%
							} else {
							%>
							<a href="booking.jsp?id=<%=room.getId()%>"
								class="btn btn-danger col-md-12">Book</a>
							<%
							}
							%>

						</c:if>
						<div class="col-md-6 mt-4">
							<p class="mt-5 text-center" style="margin-left: 250px">Map</p>
							<%=room.getLocationLink()%>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>

</body>
</html>