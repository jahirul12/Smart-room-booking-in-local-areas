<!DOCTYPE html>
<%@page import="com.entity.Room"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.dao.RoomDAO"%>
<html>
<head>
<style type="text/css">
.google-map {
	padding-bottom: 50%;
	position: relative;
}

.google-map iframe {
	height: 100%;
	width: 100%;
	left: 0;
	top: 0;
	position: absolute;
}
</style>
</head>
<body>
	<center>
		<h1>Room Google Map</h1>
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		RoomDAO roomDao = new RoomDAO(DBConnect.getConnection());
		Room rm = roomDao.getRoomDetailsById(id);
		%>
		<%=rm.getLocationLink()%></center>
</body>
</html>