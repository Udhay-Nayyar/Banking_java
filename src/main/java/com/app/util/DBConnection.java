package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	 private static final String url =
			 ConfigUtil.getProperty("DB_URL");
	    private static final String username = ConfigUtil.getProperty("DB_USER");
	    private static final String password = ConfigUtil.getProperty("DB_PASSWORD");
	
	
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
