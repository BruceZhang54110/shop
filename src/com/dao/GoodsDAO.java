package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.domain.Goods;
import com.domain.Types;
import com.utils.ConnectionUtils;

/**
 * 一个封装了对goods表数据库访问的类
 * 
 * @author Administrator
 * 
 */
public class GoodsDAO {
	/**
	 * 按类型查询商品
	 * @param typesId 类型编号
	 * @return 商品集合，如果没有查到，数据返回一个empty的集合
	 * @throws Exception
	 */
	public List<Goods> findByGoodsType(int typesId) throws Exception {
		try {
			List<Goods> goodsList = new ArrayList<Goods>();
			Connection conn = ConnectionUtils.getConnection();
			String sql = "select * from goods inner join types on goods.goodsType=Types.id where goodsType=? order by goodsPrice desc";
			PreparedStatement patat = conn.prepareStatement(sql);
			patat.setInt(1, typesId);
			ResultSet rs = patat.executeQuery();

			while (rs.next()) {
				Goods goods = new Goods();
				goods.setId(rs.getInt("id"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setGoodsPrice(rs.getFloat("goodsPrice"));
				goods.setGoodsNum(rs.getInt("goodsNum"));

				Types types = new Types();
				types.setId(rs.getInt("goodsType"));
				types.setTypeName(rs.getString("typeName"));

				goods.setTypes(types);
				goodsList.add(goods);

			}
			return goodsList;
		} finally {
			ConnectionUtils.closeConnection();
		}
	}

	
	/**
	 * 商品删除
	 * @param 
	 * @return true 
	 */
	public boolean delete(int goodsId) {
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "delete from goods where id = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setInt(1, goodsId);
			pstat.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			ConnectionUtils.closeConnection();
		}
	}
	
	
	/**
	 * 商品更新
	 * @param goods 更新的对象
	 * @return true 更新成功，false 更新失败
	 * @throws Exception
	 */
	public boolean update(Goods goods) throws Exception {
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "update goods set goodsName=?,goodsPrice=?,goodsNum=?,goodsStatus=?,goodsType=? where id=?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setString(1, goods.getGoodsName());
			pstat.setFloat(2, goods.getGoodsPrice());
			pstat.setInt(3, goods.getGoodsNum());
			pstat.setInt(4, goods.getGoodsStatus());
			pstat.setInt(5, goods.getTypes().getId());
			pstat.setInt(6, goods.getId());
			pstat.executeUpdate();
			return true;
		} finally {
			ConnectionUtils.closeConnection();
		}
	}
	
	
	/**
	 * 按主键查询的方法
	 * @param id 商品编号
	 * @return 商品对象 ，如果没有查询到
	 * @throws Exception
	 */
	public Goods findById(int id) throws Exception {
		try {
			
			Connection conn = ConnectionUtils.getConnection();
			String sql = "select * from goods inner join types on goods.goodsType=types.id where goods.id = ?";
			PreparedStatement patat = conn.prepareStatement(sql);
			patat.setInt(1, id);
			ResultSet rs = patat.executeQuery();

			if (rs.next()) {
				Goods goods = new Goods();
				goods.setId(rs.getInt("id"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setGoodsPrice(rs.getFloat("goodsPrice"));
				goods.setGoodsNum(rs.getInt("goodsNum"));
				goods.setGoodsStatus(rs.getInt("goodsStatus"));

				Types types = new Types();
				types.setId(rs.getInt("goodsType"));
				types.setTypeName(rs.getString("typeName"));

				goods.setTypes(types);
				return goods;
			}else{
				return null;
			}
			
		}finally{
			ConnectionUtils.closeConnection();
		} 
	}
	
	/**
	 * 按商品名称查询
	 * @param goodsName商品名称
	 * @throws Exception 
	 * @return查询到的商品名称
	 */
	public Goods findByGoodsName(String goodsName) throws Exception {
		try {
			
			Connection conn = ConnectionUtils.getConnection();
			String sql = "select * from goods inner join types on goods.goodsType=Types.id where goodsName = ?";
			PreparedStatement patat = conn.prepareStatement(sql);
			patat.setString(1, goodsName);
			ResultSet rs = patat.executeQuery();

			if (rs.next()) {
				Goods goods = new Goods();
				goods.setId(rs.getInt("id"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setGoodsPrice(rs.getFloat("goodsPrice"));
				goods.setGoodsNum(rs.getInt("goodsNum"));

				Types types = new Types();
				types.setId(rs.getInt("goodsType"));
				types.setTypeName(rs.getString("typeName"));

				goods.setTypes(types);
				return goods;
			}else{
				return null;
			}
			
		}finally{
			ConnectionUtils.closeConnection();
		} 
	}
	
	/**
	 * 保存新商品
	 * @param goods 要保存的新商品的对象
	 * @return 返回真表示返回成功
	 */
	public boolean save(Goods goods) {
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "insert into goods(goodsName,goodsPrice,goodsNum,goodsStatus,goodsType)values(?,?,?,?,?)";
			PreparedStatement pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, goods.getGoodsName());
			pstat.setFloat(2, goods.getGoodsPrice());
			pstat.setInt(3, goods.getGoodsNum());
			pstat.setInt(4, goods.getGoodsStatus());
			pstat.setInt(5, goods.getTypes().getId());
			pstat.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			ConnectionUtils.closeConnection();
		}
	}
	
	public List<Goods> findAll() throws Exception {
		try {
			List<Goods> goodsList = new ArrayList<Goods>();
			Connection conn = ConnectionUtils.getConnection();
			String sql = "select * from goods inner join types on goods.goodsType=Types.id";
			PreparedStatement patat = conn.prepareStatement(sql);
			ResultSet rs = patat.executeQuery();

			while (rs.next()) {
				Goods goods = new Goods();
				goods.setId(rs.getInt("id"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setGoodsPrice(rs.getFloat("goodsPrice"));
				goods.setGoodsNum(rs.getInt("goodsNum"));
				goods.setGoodsStatus(rs.getInt("goodsStatus"));

				Types types = new Types();
				types.setId(rs.getInt("goodsType"));
				types.setTypeName(rs.getString("typeName"));

				goods.setTypes(types);
				goodsList.add(goods);

			}
			return goodsList;
		} finally {
			ConnectionUtils.closeConnection();
		}
	}
}
