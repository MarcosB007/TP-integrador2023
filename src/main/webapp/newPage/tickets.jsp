<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*" %>
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
    
    <!-- header -->
    <nav class="navbar navbar-expand-md colorHeader navbar-dark fixed-top navbar-main header">
        <div class="container">
            <a class="navbar-brand" href="../index.html">
            <img src="../Imagenes/codoacodo.png" alt="Logo" height="55" class="d-inline-block align-text-center">
            Conf Bs As
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="menu">
                <ul class="navbar-nav ms-auto textHeader">
                    <li class="nav-item">
                        <a class="nav-link " aria-current="page" href="#">La conferencia</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#losOradores">Los oradores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#lugarFecha">El lugar y la fecha</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#registrarse">Conviértete en orador</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-success" href="formulario.html" > Comprar tickets</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Estudiante, Trainee, Junior -->
    <div class="container margenTarjetas">
        <div id="posDiv" class="row">
            <div class="estudiante posicionTarjetas text-center">
                <h3>Estudiante</h3>
                <p class="mt-3 letraDescuento">Tienen un descuento</p>
                <h5 class="fs-5 mt-4">80%</h5>
                <p class="letraPequeña mt-4">*presentar documentacion</p>
            </div>
            <div class="trainee posicionTarjetas text-center">
                <h3>Trainee</h3>
                <p class="mt-3 letraDescuento">Tienen un descuento</p>
                <h5 class="fs-5 mt-4">50%</h5>
                <p class="letraPequeña mt-4">*presentar documentacion</p>
            </div>
            <div class="junior posicionTarjetas text-center">
                <h3>Junior</h3>
                <p class="mt-3 letraDescuento">Tienen un descuento</p>
                <h5 class="fs-5 mt-4">15%</h5>
                <p class="letraPequeña mt-4">*presentar documentacion</p>
            </div>
        </div>
    </div>
    <!-- Venta -->
    <div class="text-center">
      <p class="mt-1 mb-0 venta">VENTA</p>
      <h2>VALOR DE TICKET $200</h2>
    </div>
    
    <%
    	String correo = request.getParameter("mail");
    	if(correo==null){
    		correo = request.getParameter("txtbuscar");
    		if(correo!=null){
    			Class.forName("com.mysql.cj.jdbc.Driver");
    	    	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
    			PreparedStatement sql = c.prepareStatement("select * from tickets where mail = '"+correo+"'");
    			ResultSet res = sql.executeQuery();
    		}
    		
    	}
    	
		Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement sql = c.prepareStatement("select * from tickets where mail = '"+correo+"' AND estado='"+1+"'");
		ResultSet res = sql.executeQuery();
	%>
	
	<div class="container margenFooter">
		
		<h2 class="p-3">Tus compras</h2>
	
		<table class="table table-primary table-bordered border-primary m-3 ">
			<tr class="">
				<th>ID</th>
				<th>NOMBRE</th>
				<th>APELLIDO</th>
				<th>EMAIL</th>
				<th>CANTIDAD</th>
				<th>CATEGORIA</th>
				<th>TOTAL</th>
				<th>ACCIONES</th>
			</tr>
			<%
				while(res.next()){
			%>
			<tr class="table-secondary table-bordered border-primary">
				<td><%= res.getInt("id") %></td>
				<td><%= res.getString("nombre") %></td>
				<td><%= res.getString("apellido") %></td>
				<td><%= res.getString("mail") %></td>
				<td><%= res.getString("cantidad") %></td>
				<td><%= res.getString("categoria") %></td>
				<td><%= res.getString("Total") %></td>
				<td>
					<a href="modificacion.jsp?id=<%= res.getInt("id") %>" class="btn btn bg-primary text-white p-1">Editar</a>				
					<a href="delete.jsp?id=<%= res.getInt("id") %>" class="btn btn bg-danger text-white p-1" onclick="return confirmar()">Eliminar</a>
					<script type="text/javascript">
						function confirmar() {
							var confirmacion = confirm("Desea eliminar esta compra?");
							if(confirmacion){
								return true;
							}else{
								return false;
							}
						}
					</script>
				</td>
				
			</tr>
			<%} %>
		</table>
		
		<button type="button" class="btn btn-primary" onclick="location.href='formulario.html'">Volver a comprar</button>
	</div>
    
    <!-- Footer -->
    <footer class="bgFooter p-4">
        <div class="container">
          <div class="row">
            <div class="estilosFooter">
              <!-- d-flex justify-content-between flex-column -->
              <div class="col-lg-1 col-sm-12 mb-2"><a href="#">Preguntas frecuentes</a></div>
              <a href="#">Contáctanos</a>
              <a href="#">Prensa</a>
              <a href="#">Conferencias</a>
              <div class="col-lg-1 col-sm-12 mb-2"><a href="#">Términos y condiciones</a></div>
              <a href="#">Privacidad</a>
              <a href="#">Estudiantes</a>
            </div>
          </div>
        </div>
      </footer>

    <script src="../js/bootstrap.bundle.min.js"></script>

    <script src="script.js"></script>
</body>
</html>