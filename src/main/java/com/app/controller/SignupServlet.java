package com.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.UserDAO;
import com.app.model.User;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignupServlet() {

	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =  request.getParameter("username");
		String email =  request.getParameter("email");
		String password = request.getParameter("password");
		Double balance = Double.parseDouble(request.getParameter("balance"));
		
		
		
		User user = new User();
		user.setUsername(username);
		user.setBalance(balance);
		user.setEmail(email);
		user.setPassword(password);

		UserDAO userDAO = new UserDAO();
		userDAO.signUp(user);

		response.sendRedirect("./login.jsp");
	}

}
