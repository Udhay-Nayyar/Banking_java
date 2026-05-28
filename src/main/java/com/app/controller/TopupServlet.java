package com.app.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.UserDAO;

@WebServlet("/topup")
public class TopupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TopupServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Double amount = Double.parseDouble(request.getParameter("amount"));

		UserDAO userDAO = new UserDAO();

		HttpSession session = request.getSession(false);
		Integer id = (Integer) session.getAttribute("userId");

		userDAO.updateBalance(id, amount , 1);

		response.sendRedirect("./dashboard");
//		ServletContext sc =  getServletContext();
//		RequestDispatcher rd =  sc.getRequestDispatcher("/dashboard");
//		rd.forward(request, response);
	}

}
