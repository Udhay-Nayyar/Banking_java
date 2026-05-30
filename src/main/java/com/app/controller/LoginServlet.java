package com.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.UserDAO;
import com.app.model.User;
import com.app.util.EmailUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDAO userDAO = new UserDAO();
		User result = userDAO.loginIn(email, password);

		System.out.println("message " + result);
		if (result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", result.getId());

			new Thread(() -> {
				EmailUtil.sendEmail(result.getEmail(), "Login Alert",
						"Hello " + result.getUsername() + ",\n\n"
								+ "A successful login was detected on your SecureBank account.\n\n"
								+ "If this login was not performed by you, please change your password immediately.\n\n"
								+ "Regards,\n" + "SecureBank Team");
			}).start();

			response.sendRedirect("./landingpage.jsp");
		} else {
			PrintWriter out = response.getWriter();
			out.println("Kindly enter the correct details");
		}

	}

}
