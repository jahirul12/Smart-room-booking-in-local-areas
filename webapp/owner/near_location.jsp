

<%@page import="com.entity.NearLocation"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.dao.RoomDAO"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Category</title>
<%@include file="../component/css.jsp"%>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container " style="margin-top: 100px;">
		<div class="row">
			<div class="col-md-4">
				<div class="card card-sh">
					<div class="card-body">
						<p class="fs-4 text-center">Near By Location</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addLocation" method="post">
							<div class="mb-3">
								<label class="form-label">Place Name</label> <input name="name"
									required type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Distance</label> <input type="text"
									required name="distance" class="form-control">
							</div>
							<%
							Integer id = Integer.parseInt(request.getParameter("id"));
							%>
							<input type="hidden" name="rid" value="<%=id%>">
							<button type="submit" class="btn bg-primary text-white col-md-12">Add</button>
						</form>

					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class="card card-sh">
					<div class="card-body">
						<p class="fs-4 text-center">Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Place Name</th>
									<th scope="col">Distance</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								RoomDAO dao = new RoomDAO(DBConnect.getConnection());
								List<NearLocation> locations = dao.getNearLocation(id);
								for (NearLocation loc : locations) {
								%>
								<tr>
									<th><%=loc.getName()%></th>
									<td><%=loc.getDistance()%></td>
									<td><a
										href="../deleteLoc?id=<%=loc.getId()%>&&rid=<%=loc.getRoomId()%>"
										class="btn btn-danger btn-sm">Delete</a></td>
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
	</div>


</body>
</html>