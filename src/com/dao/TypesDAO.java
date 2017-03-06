package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.domain.Goods;
import com.domain.Types;
import com.utils.ConnectionUtils;

public class TypesDAO {
	public List<Types> findAll() throws Exception {
		try {
			List<Types> typesList = new ArrayList<Types>();
			Connection conn = ConnectionUtils.getConnection();
			String sql = "select * from types";
			PreparedStatement patat = conn.prepareStatement(sql);
			ResultSet rs = patat.executeQuery();
			while (rs.next()) {
				
				Types types = new Types();
				types.setId(rs.getInt("id"));
				types.setTypeName(rs.getString("typeName"));

				typesList.add(types);
			}
			return typesList;
		} finally {
			ConnectionUtils.closeConnection();
		}
	}
}
