<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	int id=0;
	String idParametro = request.getParameter("id");
	if(idParametro!=null){
		id = Integer.parseInt(idParametro);
	}
	String state = "0";
	String correo="";
	
	try{
		
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement sql = c.prepareStatement("SELECT mail FROM tickets WHERE id='"+id+"'");
		ResultSet res = sql.executeQuery();
		while(res.next()){
			correo = res.getString("mail");
		}
	
		
	}catch(Exception e){
		out.print("Error: " + e.getMessage());
	}
	
	try{
		
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement sql = c.prepareStatement("UPDATE tickets SET estado=? WHERE id=?");
		sql.setString(1, state);
		sql.setInt(2, id);
		sql.executeUpdate();
		
		
	}catch(Exception e){
		out.print("Error al cargar los datos" + e.getMessage());
	}
	request.setAttribute("correo", correo);
%>

<jsp:include page="tickets.jsp">
    <jsp:param name="mail" value="<%= correo %>"/>
</jsp:include>


</body>
</html>