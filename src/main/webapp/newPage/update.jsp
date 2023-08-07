<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comprar tickets</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="estilos.css">

</head>
<body>
    
    <%int id=0;
    
    String idParam = request.getParameter("id");
    if(idParam != null){
    	try{
    		id = Integer.parseInt(idParam);	
    	}catch(NumberFormatException e){
    		out.print("Error");	
    	}
    }
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
		
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement stm = cn.prepareStatement("UPDATE tickets SET nombre=?, apellido=?, cantidad=?, categoria=?, total=? WHERE id=?");
		stm.setString(1, nombre);
		stm.setString(2, apellido);
		stm.setString(3, cantidad);
		stm.setString(4, categoria);
		stm.setString(5, total);
		stm.setInt(6, id);
		stm.executeUpdate();
	}catch(Exception e){
		out.print("Error al actualizar los datos en la base de datos: " + e.getMessage());		
	}
	%>
	
<jsp:include page="tickets.jsp"></jsp:include>
	
</body>
</html>



