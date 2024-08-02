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
					<h3 class="text-center">Payment Mode</h3>
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
					<form action="payment_processing.jsp">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="mode" value="creditcard"
								id="flexRadioDefault1"> <label class="form-check-label"
								for="flexRadioDefault1"> Credit Card </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="mode" value="upi"
								id="flexRadioDefault2"> <label class="form-check-label"
								for="flexRadioDefault2"> UPI </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="mode" value="coh"
								id="flexRadioDefault2"> <label class="form-check-label"
								for="flexRadioDefault2"> Cash On Hand </label>
						</div>
						<input type="hidden" name="id" value="<%=id%>"> <input
							type="hidden" name="amt" value="<%=amt%>">
							
						<button class="btn btn-primary mt-3">Pay Now</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>