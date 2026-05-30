package com.app.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.UserDAO;
import com.app.model.User;
import com.app.util.DBConnection;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TransferServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession(false);
		Integer id = (Integer) session.getAttribute("userId");

		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserById(id);

		// set the request attribute

		request.setAttribute("account_number", user.getAccount_number());
		request.setAttribute("balance", user.getBalance());

		ServletContext sc = getServletContext();
		RequestDispatcher rd =  sc.getRequestDispatcher("/transferpage.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con = (new DBConnection()).getConnection();
		Double amount = Double.parseDouble(request.getParameter("amount"));
		
		
		// get the money from the user account and send it to other user account

		HttpSession session = request.getSession(false);
		UserDAO userDAO = new UserDAO();
		User sender = userDAO.getUserById((Integer) session.getAttribute("userId"));

		
		
		String senders_account_number = sender.getAccount_number();
		String receviers_account_number = request.getParameter("to_account");
		User receiver = userDAO.getUserByAccNumber(receviers_account_number);
		ServletContext sc = getServletContext();

		if (senders_account_number.equals(receviers_account_number)) {

			request.setAttribute("error", "Self Transfer is not allowed");
			RequestDispatcher rd = sc.getRequestDispatcher("/transferpage.jsp");
			rd.forward(request, response);
			return;
		}

		if (receiver == null) {
			request.setAttribute("error", "Kindly enter the a valid a account number");
			RequestDispatcher rd = sc.getRequestDispatcher("/transferpage.jsp");
			rd.forward(request, response);
			return;
		}

		if (sender.getBalance() < amount) {
			request.setAttribute("error", "Insufficient balance");
			RequestDispatcher rd = sc.getRequestDispatcher("/transferpage.jsp");
			rd.forward(request, response);
			return;
		}
		String senderQuery = "UPDATE users  SET balance = ?  WHERE id = ?";
		String receiverQuery = "UPDATE users  SET balance = ?  WHERE id = ?";

		try {
			PreparedStatement senderUpdate = con.prepareStatement(senderQuery);
			PreparedStatement receiverUpdate = con.prepareStatement(receiverQuery);

			senderUpdate.setDouble(1, sender.getBalance() - amount);
			senderUpdate.setInt(2, sender.getId());

			receiverUpdate.setDouble(1, receiver.getBalance() + amount);
			receiverUpdate.setInt(2, receiver.getId());

			Integer sResult = senderUpdate.executeUpdate();
			Integer rResult = receiverUpdate.executeUpdate();
			
		
			
			userDAO.addTransaction(sender, amount, true);
			userDAO.addTransaction(receiver, amount, false);

			receiverUpdate.close();
			senderUpdate.close();
			con.close();

			response.sendRedirect("./dashboard");
		} catch (SQLException e) {
			// TODO: handle exception
			
			System.out.println("error in transfer servlet");

		}

	}

}
