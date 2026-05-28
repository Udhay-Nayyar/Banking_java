package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.app.model.Transaction;
import com.app.util.DBConnection;

public class TransactionDAO {

	public ArrayList<Transaction> getDefaultTransHistory(Integer id) {
		String query = "SELECT *  FROM transactions WHERE user_id = ? ORDER BY created_at DESC LIMIT 5";

		ArrayList<Transaction> list = new ArrayList<>();
		Connection con = (new DBConnection()).getConnection();
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);

			rs = ps.executeQuery();

			while (rs.next()) {
				Transaction ts = new Transaction();
				ts.setUser_id(id);
				ts.setAmount(rs.getDouble("amount"));
				ts.setTransaction_type(rs.getString("transaction_type"));
				ts.setCreated_at(rs.getTimestamp("created_at"));
				list.add(ts);
			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}
}
