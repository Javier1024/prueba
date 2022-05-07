<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seleccion productos</title>
</head>
<body>


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


</body>
</html>