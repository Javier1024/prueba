<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
String database = "epe2";
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


<div>
		
		<h3>Stock de Productos</h3>
	<table border="1">
			<tr>
			<td>Codigo</td>
			<td>Producto</td>
			<td>Pagado x unidad</td>
			<td>Cantidad</td>

			</tr>
		<%
			try{
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EPE2?useSSL=false","test","123456");
				statement=connection.createStatement();
				String sql ="select * from compra";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
		%>
		<tr>
			<td><%=resultSet.getString("codigo") %></td>
			<td><%=resultSet.getString("producto") %></td>
			<td><%=resultSet.getString("pagado") %></td>
			<td><%=resultSet.getString("cantidad") %></td>

		</tr>
		<%
				 }
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table> 
	
	 <a href="compra.jsp">Volver a compras</a>
	
</div>    
</body>
</html>