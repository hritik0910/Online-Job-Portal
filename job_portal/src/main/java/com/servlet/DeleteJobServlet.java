package com.servlet;

import java.io.IOException;

import com.DB.DBconnect;
import com.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id  = Integer.parseInt(req.getParameter("id"));
			 HttpSession session = req.getSession();
			JobDAO dao = new JobDAO(DBconnect.getConn());
			 boolean f = dao.deleteJobs(id);
			 if(f) {
				 session.setAttribute("succMsg", "Job Delete successfully...");
				 resp.sendRedirect("view_jobs.jsp");
				 			 }
			 else {
				 session.setAttribute("succMsg", "Something wrong on server");
				 resp.sendRedirect("view_jobs.jsp");
			 }
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
