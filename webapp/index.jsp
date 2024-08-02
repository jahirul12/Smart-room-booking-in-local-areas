<%@page import="com.mysql.cj.util.StringUtils"%>
<%@page import="com.entity.RoomImage"%>
<%@page import="com.entity.Room"%>
<%@page import="com.entity.RoomType"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.entity.Category"%>
<%@page import="com.dao.RoomDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Rental : Home Page</title>
<%@include file="component/css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="component/navbar.jsp"%>
	<div
		class="container-fluid p-4 mt-5 bg-custom bg-primary border-outline-white">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<form action="index.jsp" method="get">
					<div class="input-group">
						<input type="text" class="form-control" name="ch">
						<button class="btn btn-light ms-2 col-md-2 text-dark">
							<i class="fa-solid fa-magnifying-glass"></i> Search
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="container-fluid mt-1">
		<div class="row">

			<div class="col-md-2">
				<div class="card ">
					<div class="card-body">
						<div>
							<p class="fs-5 text-center">Categories</p>
							<div class="list-group card-sh" style="width: 100%;">
								<a href="index.jsp?ca="
									class="list-group-item list-group-item-action "
									aria-current="true"> All </a>

								<%
								String category = request.getParameter("ca");
								String roomType = request.getParameter("ra");
								String search = request.getParameter("ch");
								String pr = request.getParameter("pr");
								RoomDAO dao = new RoomDAO(DBConnect.getConnection());
								List<Category> list = dao.getAllCategory();
								for (Category c : list) {
								%>
								<a href="index.jsp?ca=<%=c.getName()%>"
									class="list-group-item list-group-item-action <%if (c.getName().equals(category)) {%>active <%}%> "><%=c.getName()%>
								</a>
								<%
								}
								%>
							</div>
						</div>
						<div class="mt-3">
							<p class="fs-5 text-center">Room Type</p>
							<div class="list-group card-sh" style="width: 100%;">

								<a href="index.jsp?ra="
									class="list-group-item list-group-item-action "
									aria-current="true"> All </a>

								<%
								List<RoomType> rooms = dao.getAllRoomType();
								for (RoomType r : rooms) {
								%>
								<a href="index.jsp?ra=<%=r.getName()%>"
									class="list-group-item list-group-item-action <%if (r.getName().equals(roomType)) {%>active <%}%> "><%=r.getName()%>
								</a>
								<%
								}
								%>
							</div>
						</div>

						<div class="mt-3">
							<p class="fs-5 text-center">Price</p>
							<div class="list-group card-sh" style="width: 100%;">

								<a href="index.jsp?pr="
									class="list-group-item list-group-item-action "
									aria-current="true">Any </a> <a href="index.jsp?pr=one"
									class="list-group-item list-group-item-action <%if(pr!=null && pr.equals("one")){%>active<%}%>">100-2000 </a>
									
									 <a
									href="index.jsp?pr=two"
									class="list-group-item list-group-item-action <%if(pr!=null && pr.equals("two")){%>active<%}%>">2000-3000 </a> <a
									href="index.jsp?pr=three"
									class="list-group-item list-group-item-action <%if(pr!=null && pr.equals("three")){%>active<%}%>">3000-4000 </a> <a
									href="index.jsp?pr=four"
									class="list-group-item list-group-item-action <%if( pr!=null && pr.equals("four")){%>active<%}%>">5000-10000 </a>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-10 p-0">
				<div class="card">
					<div class="card-body">
						<p class="fs-4 text-center">Home</p>
						<div class="row">
							<%
							RoomDAO roomDao = new RoomDAO(DBConnect.getConnection());
							List<Room> rms = null;
							if (category != null && category.length() > 0) {
								rms = roomDao.getRoomByCategory(category);
							} else if (roomType != null && roomType.length() > 0) {
								rms = roomDao.getRoomByRoomType(roomType);
							} else if (search != null && search.length() > 0) {
								rms = roomDao.getRoomBySearch(search);
							} else if (pr != null && pr.length() > 0) {
								rms = roomDao.getRoomByPrice(pr);
							} else {
								rms = roomDao.getAllRoom();
							}
							int controlId = 0;
							if (rms != null && rms.size() > 0) {
								for (Room rm : rms) {
									List<RoomImage> images = dao.getRoomImageByRoomId(rm.getId());
									if (images.size() > 0) {
								controlId++;
							%>
							<div class="col-md-3 mt-3">
								<div class="card card-sh">
									<div class="card-body">
										<div id="carouselExample+<%=controlId%>"
											class="carousel slide">
											<div class="carousel-inner">
												<%
												int i = 0;
												for (RoomImage img : images) {
												%>
												<div
													class="carousel-item <%if (i == 0) {
	i++;%>active<%}%>">
													<img src="data/img/product_img/<%=img.getImage()%>"
														width="100%" height="150px" class="d-block w-100"
														alt="...">
												</div>
												<%
												}
												%>

											</div>
											<button class="carousel-control-prev" type="button"
												data-bs-target="#carouselExample+<%=controlId%>"
												data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button"
												data-bs-target="#carouselExample+<%=controlId%>"
												data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
										</div>


										<p class="text-center">
											<a href="home.jsp?id=<%=rm.getId()%>"
												class="fs-5 text-decoration-none"><%=rm.getTitle()%> </a> <br>
											&#8377;<%=rm.getMonthlyCost()%>/Month <br>
											<%=rm.getCategory() %> ,<%=rm.getRoomType() %>
											<br>From you
											location <br>near to <span
												style="font-weight: bold; font-size: 20px"><%=rm.getDistance()%></span><a
												href="map.jsp?id=<%=rm.getId()%>"
												class="text-decoration-none text-success"> <i
												class="fa-solid fa-location-dot"></i></a>
										</p>
									</div>
								</div>
							</div>
							<%
							}
							}
							} else {
							%>
							<h4 class="text-center text-danger">Room Not Available</h4>
							<%
							}
							%>





						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>