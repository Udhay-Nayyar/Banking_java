package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	 private static final String url =
	            "jdbc:mysql://localhost:3306/banking_application";
	    private static final String username = "root";
	    private static final String password = "U8d7h7a5y;";
	
	
	public  Connection getConnection() {
			
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
		}
		catch(Exception sq){
			System.out.println("hey we are not able to connect to  the database " + sq.getMessage());
		}
		
		
		return con;
	}
}
