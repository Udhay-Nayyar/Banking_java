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
import com.app.util.EmailUtil;

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
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Double balance = Double.parseDouble(request.getParameter("balance"));

		String regex = "^[A-Za-z0-9._%+-]+@gmail\\.com$";

		if (!email.matches(regex)) {

			request.setAttribute("error", "Please enter a valid email address");

			request.getRequestDispatcher("/signup.jsp").forward(request, response);

			return;
		}

		User user = new User();
		user.setUsername(username);
		user.setBalance(balance);
		user.setEmail(email);
		user.setPassword(password);

		UserDAO userDAO = new UserDAO();
		userDAO.signUp(user);

		new Thread(() -> {
			EmailUtil.sendEmail(user.getEmail(), "Welcome to SecureBank",
					"Hello " + user.getUsername() + ",\n\n"
							+ "Your SecureBank account has been created successfully.\n\n"
							+ "You can now log in and access banking services such as:\n" + "- Top Up\n"
							+ "- Withdraw Funds\n" + "- Transfer Money\n" + "- View Transaction History\n\n"
							+ "Thank you for choosing SecureBank.\n\n" + "Regards,\n" + "SecureBank Team");
		}).start();

		response.sendRedirect("./login.jsp");

	}

}
