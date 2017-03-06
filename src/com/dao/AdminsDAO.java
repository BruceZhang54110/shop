package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.domain.Admins;
import com.utils.ConnectionUtils;

public class AdminsDAO {
	public Admins findByAdminName(String adminName) throws Exception {
		try {
			
			Connection conn = ConnectionUtils.getConnection();
			String sql = "select * from admins where adminName = ?";
		PreparedStatement patat = conn.prepareStatement(sql);
		patat.setString(1, adminName);
			ResultSet rs = patat.executeQuery();

			if (rs.next()) {
				Admins admins = new Admins();
				admins.setId(rs.getInt("id"));
				admins.setAdminName(rs.getString("adminName"));
				admins.setAdminPass(rs.getString("adminPass"));
				return admins;
			}else {
				return null;
			}
		}finally{
			ConnectionUtils.closeConnection();
		} 
	}
}
