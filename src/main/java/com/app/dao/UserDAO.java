package com.app.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.connector.Response;
import org.mindrot.jbcrypt.BCrypt;

import com.app.model.Transaction;
import com.app.model.User;
import com.app.util.DBConnection;

public class UserDAO {

	public void signUp(User user) {
		Connection con = (new DBConnection()).getConnection();

		String query = "INSERT INTO users (username, email , password , balance )\r\n" + "VALUES (?,?,?,?);";

		String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, hashedPassword);
			ps.setDouble(4, user.getBalance());

			int noOfRowsEffected = ps.executeUpdate();

			String email = user.getEmail();
			String findId = "Select id from users where email = ?";

			PreparedStatement getps = con.prepareStatement(findId);
			getps.setString(1, email);

			ResultSet rs = getps.executeQuery();
			rs.next();

			Integer userID = rs.getInt("id");
			String account_number = "IOI2410100" + userID;

			String addingAccNoQuery = "UPDATE users  SET account_number = ?  WHERE id = ?";

			PreparedStatement setAccNo = con.prepareStatement(addingAccNoQuery);
			setAccNo.setString(1, account_number);
			setAccNo.setInt(2, userID);

			Integer res = setAccNo.executeUpdate();

			setAccNo.close();
			rs.close();
			getps.close();
			ps.close();
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public User loginIn(String email, String password) {

		Connection con = (new DBConnection()).getConnection();

		String query = "select * from users where email = ?";

		User user = null;

			try {
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, email);

				ResultSet rs = ps.executeQuery();

				if (rs.next() == false) {
					return null;
				} else {
					user = new User();
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setId(rs.getInt("id"));
					if (BCrypt.checkpw(password, user.getPassword()) == false) return null;
				}

				con.close();
				ps.close();
				rs.close();
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
			Integer userid = rs.getInt("id");
			String username = rs.getString("username");
			String email = rs.getString("email");
			String account_number = rs.getString("account_number");
			double balance = rs.getDouble("balance");

			user = new User();
			user.setAccount_number(account_number);
			user.setBalance(balance);
			user.setEmail(email);
			user.setUsername(username);
			user.setId(userid);

			con.close();
			ps.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public void updateBalance(Integer id, Double amount, Integer operation) {
		String query = "UPDATE users  SET balance = ?  WHERE id = ?";

		Transaction t = new Transaction();
		String transQuery = "INSERT INTO transactions(user_id, transaction_type , amount) VALUES (?,?,?)";
		Connection con = (new DBConnection()).getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(query);
			User user = getUserById(id);
			PreparedStatement txps = con.prepareStatement(transQuery);

			txps.setInt(1, id);

			if (operation == 1) {
				ps.setDouble(1, user.getBalance() + amount);
				txps.setString(2, "topup");
			} else {
				ps.setDouble(1, user.getBalance() - amount);
				txps.setString(2, "withdraw");
			}
			ps.setInt(2, id);

			txps.setDouble(3, amount);

			int txresult = txps.executeUpdate();
			int result = ps.executeUpdate();

			con.close();
			ps.close();
			txps.close();
		} catch (SQLException e) {
			System.out.println("hlllo");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public User getUserByAccNumber(String account_Number) {
//		System.out.println(id);
		String query = "select * from users where  account_number = ?";

		Connection con = (new DBConnection()).getConnection();
		User user = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, account_Number);

			ResultSet rs = ps.executeQuery();

			rs.next();
			Integer userid = rs.getInt("id");
			String username = rs.getString("username");
			String email = rs.getString("email");
			String account_number = rs.getString("account_number");
			double balance = rs.getDouble("balance");

			user = new User();
			user.setId(userid);
			user.setAccount_number(account_number);
			user.setBalance(balance);
			user.setEmail(email);
			user.setUsername(username);

			con.close();
			ps.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public void addTransaction(User user, Double amount, boolean who) {
		String query = "INSERT INTO transactions(user_id, transaction_type , amount) VALUES (?,?,?)";
		Connection con = (new DBConnection()).getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, user.getId());

			if (who == true) {
				ps.setString(2, "send");
			} else {
				ps.setString(2, "received");
			}

			ps.setDouble(3, amount);

			Integer res = ps.executeUpdate();

		} catch (SQLException sq) {
			System.out.println("error while inserting");
		}

	}
}
