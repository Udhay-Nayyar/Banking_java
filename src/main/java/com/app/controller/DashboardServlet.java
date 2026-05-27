package com.app.controller;

import java.io.IOException;
import com.app.model.User;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.UserDAO;
import com.app.util.DBConnection;
import com.mysql.cj.Session;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DashboardServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession(false);
		
		
		
		User user =userDAO.getUserById((Integer)session.getAttribute("userId"));
//		System.out.println((Integer)session.getAttribute("userId"));
		
		request.setAttribute("username",user.getUsername());
		request.setAttribute("balance", user.getBalance());
		request.setAttribute("account_number",user.getAccount_number());
		request.setAttribute("email",user.getEmail());
		
		
//		System.out.println("the name is " + request.getAttribute("username"));
		
		ServletContext sc =  getServletContext();
		RequestDispatcher rd =  sc.getRequestDispatcher("/dashboard.jsp");
		rd.forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
