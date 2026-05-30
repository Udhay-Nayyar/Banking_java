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
import com.app.model.User;
import com.app.util.EmailUtil;

@WebServlet("/topup")
public class TopupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TopupServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Double amount = Double.parseDouble(request.getParameter("amount"));

		UserDAO userDAO = new UserDAO();

		HttpSession session = request.getSession(false);
		Integer id = (Integer) session.getAttribute("userId");

		User user = userDAO.getUserById(id);
		Double updatedBalance = userDAO.updateBalance(id, amount, 1);

		new Thread(() -> {
			EmailUtil.sendEmail(user.getEmail(), "Money Added Successfully",
					"Hello " + user.getUsername() + ",\n\n"
							+ "A top-up transaction has been completed successfully.\n\n" + "Amount Added: ₹" + amount
							+ "\n" + "Available Balance: ₹" + updatedBalance + "\n\n"
							+ "Thank you for using SecureBank.\n\n" + "Regards,\n" + "SecureBank Team");
		}).start();

		response.sendRedirect("./dashboard");
//		ServletContext sc =  getServletContext();
//		RequestDispatcher rd =  sc.getRequestDispatcher("/dashboard");
//		rd.forward(request, response);
	}

}
