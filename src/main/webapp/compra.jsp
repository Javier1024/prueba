<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.annotation.WebServlet"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import="java.io.IOException"%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ropa";
String userid = "test";
String password = "123456";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Compra Productos</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div>
		
		<h3>Stock de Productos</h3>
	<table border="1">
			<tr>
			<td>Codigo</td>
			<td>Producto</td>
			<td>Precio</td>
			<td>Stock</td>

			</tr>
		<%
			try{
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EPE2?useSSL=false","test","123456");
				statement=connection.createStatement();
				String sql ="select * from productos";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
		%>
		<tr>
			<td><%=resultSet.getString("codigo") %></td>
			<td><%=resultSet.getString("descripcion") %></td>
			<td><%=resultSet.getString("precioVenta") %></td>
			<td><%=resultSet.getString("existencia") %></td>

		</tr>
		<%
				 }
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table> 
</div>

<div>
	<h3>Ingrese producto a comprar</h3>
	<form method="post" action="inserta.jsp">
			Codigo Producto:<br>
		<input type="text" name="codigo">
		<br>
			Producto:<br>
		<input type="text" name="producto">
		<br>
			Precio Unidad<br>
		<input type="text" name="pagado">
		<br>
		  Cantidad a Comprar:<br>
		<input type="text" name="cantiad">
		<br><br>
		<input type="submit" value="submit">
	</form>
	
 <a href="historico.jsp">Historial de compra</a> 

</div>

<!-- Lllamada al css y js de la alerta -->	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		
		var status = document.getElementById("status").value;
		if (status == "success"){
			swal("Muy bien!","cuenta creada con exitosamente","success");
		}
	
	</script>

</body>
</html>