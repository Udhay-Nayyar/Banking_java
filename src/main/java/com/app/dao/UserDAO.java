package com.app.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.connector.Response;

import com.app.model.User;
import com.app.util.DBConnection;

public class UserDAO {

	public void signUp(User user) {
		Connection con = (new DBConnection()).getConnection();

		String query = "INSERT INTO users (username, email , password , balance ,account_number)\r\n"
				+ "VALUES (?,?,?,?,?);";

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setDouble(4, user.getBalance());
			ps.setString(5, user.getAccount_number());

			int noOfRowsEffected = ps.executeUpdate();

			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public User loginIn( String username, String password) {

		Connection con = (new DBConnection()).getConnection();

		String query = "select * from users where email = ? and password = ? ";

		User user = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next() == false) {
				return null;
			}
			else {
			    user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setId(rs.getInt("id"));
				
			}

			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;

	}

	public User getUserById(Integer id) {
//		System.out.println(id);
		String query = "select * from users where  id = ?";

		Connection con = (new DBConnection()).getConnection();
		User user = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			rs.next();
			String username = rs.getString("username");
			String email = rs.getString("email");
			String account_number = rs.getString("account_number");
			double balance = rs.getDouble("balance"); 
			
			
			
			user = new User();
			user.setAccount_number(account_number);
			user.setBalance(balance);
			user.setEmail(email);
			user.setUsername(username);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

}
