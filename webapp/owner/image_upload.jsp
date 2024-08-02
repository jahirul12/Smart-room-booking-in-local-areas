<%@page import="com.entity.RoomImage"%>
<%@page import="java.util.List"%>
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
	<%@include file="../component/navbar.jsp"%>
	<div class="container mt-5 p-5">
		<div class="row">
			<div class="col-md-5">
				<div class="card card-sh">
					<div class="card-header text-center fs-5 fw-bold">
						Upload image
						<c:if test="${not empty errorMsg}">
							<p class="fw-bold text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fw-bold text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
					</div>
					<%
					Integer id = Integer.parseInt(request.getParameter("id"));
					%>
					<div class="card-body">
						<form action="../uploadImage" method="post"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label>Upload</label> <input class="form-control" name="img"
									type="file">
							</div>
							<input type="hidden" name="rid" value="<%=id%>">
							<button class="btn btn-primary">Upload</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Image</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						RoomDAO dao = new RoomDAO(DBConnect.getConnection());
						List<RoomImage> images = dao.getRoomImageByRoomId(id);
						for (RoomImage im : images) {
						%>
						<tr>
							<td><img src="../data/img/product_img/<%=im.getImage()%>"
								width="80px" height="80px"></td>
							<td><a
								href="../deleteImg?id=<%=im.getId()%>&&rid=<%=im.getRoomId()%>"
								class="btn btn-sm btn-primary">Delete</a></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>