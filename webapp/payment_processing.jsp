
<%@page import="com.util.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.RoomDAO"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
Double amt = Double.parseDouble(request.getParameter("amt"));

RoomDAO dao = new RoomDAO(DBConnect.getConnection());
//Room room = dao.getRoomDetailsById(id);
User user = (User) session.getAttribute("userObj");

String mode = request.getParameter("mode");
String idx = request.getParameter("id");
String amtx = request.getParameter("amt");
if ("Creditcard".equalsIgnoreCase(mode)) {
	response.sendRedirect("card_payment.jsp?amt=" + amtx + "&&id=" + idx);
} else if ("upi".equalsIgnoreCase(mode)) {
	response.sendRedirect("upi.jsp?amt=" + amtx + "&&id=" + idx);
} else {
	response.sendRedirect("payment_done.jsp?type=cash on hand" + "&&id=" + idx);
}
%>
