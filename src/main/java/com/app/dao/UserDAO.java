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

	public String loginIn(String username, String password) {

		Connection con = (new DBConnection()).getConnection();

		String query = "select * from users where email = ? and password = ? ";

		try {
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next() == false) {
				return "hey the username or password is wronge";
			}

			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Loggend in successfully";

	}

}
