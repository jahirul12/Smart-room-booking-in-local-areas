<%@page import="com.entity.Booking"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Room"%>
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
	<%
	//int id = Integer.parseInt(request.getParameter("id"));
	RoomDAO dao = new RoomDAO(DBConnect.getConnection());
	//Room room = dao.getRoomDetailsById(id);
	User user = (User) session.getAttribute("userObj");
	%>
	<%@include file="../component/navbar.jsp"%>
	<div class="container">
		<div class="row p-5 mt-3">
			<div class="card card-sh">
				<div class="card-header">
					<h3 class="text-center">Booking Details</h3>
					<c:if test="${not empty errorMsg}">
						<p class="fs-4 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<p class="fs-4 text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">SL NO</th>
								<th scope="col">Room Details</th>
								<th scope="col">Booking Date</th>
								<th scope="col" class="text-center">Booking Status</th>
								<th scope="col" class="text-center">Payment Status</th>
								<th scope="col" class="text-center">Pay</th>
								<th scope="col" class="text-center">Payment Type</th>
							</tr>
						</thead>
						<tbody>
							<%
							int i = 0;
							UserDAO dao2 = new UserDAO(DBConnect.getConnection());
							List<Booking> bookings = dao2.getBookingByUser(user.getId());
							for (Booking b : bookings) {
								i++;
								Room rm = dao.getRoomDetailsById(b.getRoomId());
								User customer = dao2.getUser(b.getUserId());
							%>
							<tr>
								<td><%=i%></td>
								<td><%=rm.getTitle()%><br>Category: <%=rm.getCategory()%>
									<br>Room type:<%=rm.getRoomType()%></td>

								<td><%=b.getBookingDate()%></td>

								<td class="text-center">
									<%
									if (b.getStatus().equals("Pending")) {
									%> <span class="badge bg-warning text-light">Pending</span> <%
 } else if (b.getStatus().equals("Approved")) {
 %> <span class="badge bg-success text-light">Approved</span> <%
 } else {
 %> <span class="badge bg-danger text-light">Rejected</span> <%
 }
 %>

								</td>
								<td class="text-center">
									<%
									if (b.getPayment().equals("yes")) {
									%> <span class="badge bg-success text-light">Success</span> <%
 }
 %>
								</td>
								<td class="text-center">
									<%
									if (b.getStatus().equals("Approved") && !b.getPayment().equals("yes")) {
									%> <a
									href="payment_mode.jsp?amt=<%=rm.getMonthlyCost()%>&&id=<%=b.getId()%>"
									class="badge bg-primary text-light">Pay now</a> <%
 }
 %>

								</td>
								<td class="text-center">
									<%
									if (b.getPaymentType() == null) {
									%> <%
 } else {
 %> <%=b.getPaymentType()%> <%
 }
 %>
								</td>
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