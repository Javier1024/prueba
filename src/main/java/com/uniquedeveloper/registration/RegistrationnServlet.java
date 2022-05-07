package com.uniquedeveloper.registration;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



/**
 * Servlet implementation class RegistrationnServlet
 */

@WebServlet("/register")
public class RegistrationnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  		String username = request.getParameter("nombre");
  		String email = request.getParameter("email");
  		String pwd = request.getParameter("pass");
  		String phone = request.getParameter("contact");
  		RequestDispatcher dispatcher = null;
  		Connection con = null;
  		try {
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EPE2?useSSL=false","test","123456");
  			PreparedStatement pst = con
  					.prepareStatement("insert into users(username,email,pwd,phone) values(?,?,?,?) ");
  			pst.setString(1, username);
  			pst.setString(2, email);
  			pst.setString(3, pwd);
  			pst.setString(4, phone);
  			
  			int rowCount = pst.executeUpdate();
  			dispatcher = request.getRequestDispatcher("registration.jsp");
  			if (rowCount > 0) {
  				request.setAttribute("status", "success");
  			
  			}else {
  				request.setAttribute("status", "failed");
  			}
  			
  			dispatcher.forward(request, response);
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}finally {
  			try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
  		}
  	}
}