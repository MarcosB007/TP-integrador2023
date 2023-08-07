<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.awt.Taskbar.State"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	try{
		
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement sql = c.prepareStatement("SELECT FROM tickets ");
		ResultSet res = sql.executeQuery();
		while(res.next()){
			String nombre = res.getString("nombre");
			String apellido = res.getString("apellido");
			String mail = res.getString("mail");
			String cantidad = res.getString("cantidad");
			String categoria = res.getString("categoria");
			
			out.print("Nombre: " + nombre + "<br>");
		}
		
		
	}catch(Exception e){
		out.print("Error al traer los datos");
	}

%>

</body>
</html>