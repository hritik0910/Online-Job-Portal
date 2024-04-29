package com.servlet;

import java.io.IOException;

import com.DB.DBconnect;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/add_user")
public class RegisterServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String qua = req.getParameter("qua");
			String email = req.getParameter("email");
			String ps = req.getParameter("ps");
			UserDAO dao = new UserDAO(DBconnect.getConn());
			
			User  u = new User(name,email,ps,qua,"user");
			HttpSession session = req.getSession();
			boolean f = dao.addUser(u);
			 if(f) {
				 session.setAttribute("succMsg", "Registration successfully...");
				 resp.sendRedirect("register.jsp");
			 }
			 else {
				 session.setAttribute("succMsg", "Something  went wrong on server");
				 resp.sendRedirect("register.jsp");
			 }
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
