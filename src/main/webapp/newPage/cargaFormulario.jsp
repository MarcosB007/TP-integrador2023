<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Venta de tickets</title>
</head>
<body>

<%

	Class.forName("com.mysql.cj.jdbc.Driver");	

	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String mail = request.getParameter("mail");
	String cantidad = request.getParameter("cantidad");
	String categoria = request.getParameter("categoria");
	String total = request.getParameter("monto");
	
	try{
		
		if(categoria.equals("1")){
			categoria = "Estudiante";
		}else if(categoria.equals("2")){
			categoria = "Trainee";
		}else if(categoria.equals("3")){
			categoria = "Junior";			
		}
		
		String estado = "1";
		
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement stm = cn.prepareStatement("INSERT INTO tickets (nombre,apellido,mail,cantidad,categoria,total,estado) VALUES('"+
		nombre+"','"+apellido+"','"+mail+"','"+cantidad+"','"+categoria+"','"+total+"','"+estado+"')");
		
		stm.executeUpdate();
		
	}catch(Exception e){
		out.print("Error al cargar los datos");		
	}
%>

<jsp:include page="tickets.jsp"></jsp:include>

</body>
</html>