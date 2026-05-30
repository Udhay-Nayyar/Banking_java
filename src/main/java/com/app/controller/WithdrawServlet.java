package com.app.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.RequestContext;

import com.app.dao.UserDAO;
import com.app.model.User;
import com.app.util.EmailUtil;

@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WithdrawServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession(false);
		Integer id = (Integer) session.getAttribute("userId");
		User user = userDAO.getUserById(id);

		request.setAttribute("balance", user.getBalance());

		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/withdraw.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Double amount = Double.parseDouble(request.getParameter("amount"));
		UserDAO userDAO = new UserDAO();

		HttpSession session = request.getSession(false);
		Integer id = (Integer) session.getAttribute("userId");
		User user = userDAO.getUserById(id);
		Double updatedBalance = userDAO.updateBalance(id, amount, 0);

		new Thread(() -> {
			EmailUtil.sendEmail(user.getEmail(), "Withdrawal Successful",
					"Hello " + user.getUsername() + ",\n\n"
							+ "A withdrawal transaction has been completed successfully.\n\n" + "Amount Withdrawn: ₹"
							+ amount + "\n" + "Available Balance: ₹" + updatedBalance + "\n\n"
							+ "If you did not perform this transaction, please contact support immediately.\n\n"
							+ "Regards,\n" + "SecureBank Team");

		}).start();
		response.sendRedirect("./dashboard");
	}

}
