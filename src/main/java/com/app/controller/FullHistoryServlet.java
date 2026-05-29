package com.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.TransactionDAO;
import com.app.model.Transaction;
import com.mysql.cj.Session;


@WebServlet("/history")
public class FullHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FullHistoryServlet() {
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TransactionDAO txDAO = new TransactionDAO();
		
		HttpSession session = request.getSession(false);
		Integer id = (Integer)session.getAttribute("userId");
		
		
		ArrayList<Transaction> list = txDAO.getFullTransHistory(id);  
		
		
		request.setAttribute("transactions",list);
		 ServletContext sc = getServletContext();
		 RequestDispatcher rd =   sc.getRequestDispatcher("/viewhistory.jsp");
		 rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
