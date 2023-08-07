<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*" %>
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
                        <a class="nav-link active" href="#registrarse">Convi�rtete en orador</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-success" href="#" > Comprar tickets</a>
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
                <p class="letraPeque�a mt-4">*presentar documentacion</p>
            </div>
            <div class="trainee posicionTarjetas text-center">
                <h3>Trainee</h3>
                <p class="mt-3 letraDescuento">Tienen un descuento</p>
                <h5 class="fs-5 mt-4">50%</h5>
                <p class="letraPeque�a mt-4">*presentar documentacion</p>
            </div>
            <div class="junior posicionTarjetas text-center">
                <h3>Junior</h3>
                <p class="mt-3 letraDescuento">Tienen un descuento</p>
                <h5 class="fs-5 mt-4">15%</h5>
                <p class="letraPeque�a mt-4">*presentar documentacion</p>
            </div>
        </div>
    </div>
    <!-- Venta -->
    <div class="text-center">
      <p class="mt-1 mb-0 venta">VENTA</p>
      <h2>VALOR DE TICKET $200</h2>
    </div>
    
    <%	
    Class.forName("com.mysql.cj.jdbc.Driver");	
    int id=0;
    String idParam = request.getParameter("id");
    if(idParam != null){
    	try{
    		id = Integer.parseInt(idParam);	
    	}catch(NumberFormatException e){
    		out.print("Error");	
    	}
    }
	try{
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/compraticket","root","");
		PreparedStatement sql = c.prepareStatement("SELECT * FROM tickets WHERE id=" + id);
		ResultSet res = sql.executeQuery(); 
	
		while(res.next()){
		%>

    <!-- Formulario -->
    <div class="contenedor formulario mb-3">
      <form action="update.jsp?id=<%= res.getInt("id") %>" method="POST">
        <div class="row g-3 justify-content-center">
          <div class="col-lg-4 col-sm-6">
            <input id="nombre" type="text" name="nombre" class="form-control" placeholder="Nombre" aria-label="First name" value="<%= res.getString("nombre")%>" required="required">
          </div>
          <div class="col-lg-4 col-sm-6">
            <input id="apellido" type="text" name="apellido" class="form-control" placeholder="Apellido" aria-label="Last name" value="<%= res.getString("apellido")%>" required="required">
          </div>
          <div class="col-lg-8 col-sm-12">
            <input id="correo" type="email" name="mail" readonly="readonly" class="form-control" placeholder="Correo" value="<%= res.getString("mail")%>">
          </div>
          <input type="hidden" name="monto" id="total_input">
          
          <div class="row g-3 justify-content-center ">
                <div class="col-lg-4 col-sm-6">
                    <label class="form-label">Cantidad</label>
                    <input id="valor" type="text" name="cantidad" class="form-control" placeholder="Cantidad" aria-label="Cant" value="<%= res.getString("cantidad")%>" required="required">
                </div>
                <div class="col-lg-4 col-sm-6">
                    <label class="form-label">Categoria</label>
                    <select id="categoria" class="form-select" name="categoria" aria-label="Default select example">
                        <option value="1">Estudiante</option>
                        <option value="2">Trainee</option>
                        <option value="3">Junior</option>
                    </select> 
                    
                </div>
            </div>
            <div class="row g-3 col-lg-8 col-sm-12 justify-content-center d-flex justify-content-between">
                <div>
                    <p id="total" class="display-4 totalAPagar fw-semibold">Total a Pagar: $</p>
                </div>
                <button class="btn btn-primary col-lg-4 btnsBorrarResumen" type="button" onclick="location.href='formulario.html'">Cancelar</button>
                <button id="botonResumen" class="btn btn-primary col-lg-4 btnsBorrarResumen" type="submit">Confirmar</button>
            </div>
            
        </div>
      </form>
    </div>
    <% } %>
    <% }catch(Exception e){
			out.print("Error al cargar");	
		}%>
		
    <!-- Footer -->
    <footer class="bgFooter p-4">
        <div class="container">
          <div class="row">
            <div class="estilosFooter">
              <!-- d-flex justify-content-between flex-column -->
              <div class="col-lg-1 col-sm-12 mb-2"><a href="#">Preguntas frecuentes</a></div>
              <a href="#">Cont�ctanos</a>
              <a href="#">Prensa</a>
              <a href="#">Conferencias</a>
              <div class="col-lg-1 col-sm-12 mb-2"><a href="#">T�rminos y condiciones</a></div>
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