<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

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
String codigo=request.getParameter("codigo");
String producto=request.getParameter("producto");
String pagado=request.getParameter("pagado");
String cantidad=request.getParameter("cantidad");
try
{
         Class.forName("com.mysql.cj.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EPE2?useSSL=false","test","123456");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into compra(codigo,producto,pagado,cantidad)values('"+codigo+"','"+producto+"','"+pagado+"','"+cantidad+"')");
        out.println("Compra exitosa!");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>