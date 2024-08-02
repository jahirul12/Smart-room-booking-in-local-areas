<%@page import="com.util.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
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
	int id = Integer.parseInt(request.getParameter("id"));
	Double amt = Double.parseDouble(request.getParameter("amt"));

	RoomDAO dao = new RoomDAO(DBConnect.getConnection());
	//Room room = dao.getRoomDetailsById(id);
	User user = (User) session.getAttribute("userObj");
	%>
	<%@include file="../component/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row p-5 mt-3">
			<div class="card card-sh">
				<div class="card-header">
					<h3 class="text-center">QR Code</h3>
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
				<h4>Total Amount : <%=amt %></h4>
					<img src="data/img/qr.png" width="200px" height="200px"> <br><a
						href="payment_done.jsp?id=<%=id%>&&type=UPI" class="btn btn-sm bg-primary text-light ms-2">Payment</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>