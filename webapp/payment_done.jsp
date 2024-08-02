<%@page import="com.dao.UserDAO"%>
<%@page import="com.util.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.RoomDAO"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String type = request.getParameter("type");
UserDAO dao = new UserDAO(DBConnect.getConnection());
dao.updateBookingPaymentStatus(id, type);
response.sendRedirect("booking_success.jsp");
%>