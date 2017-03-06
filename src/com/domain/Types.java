package com.domain;
/**
 * 我们用这个类来对应数据库中types表
 * @author Administrator
 *
 */
public class Types {
	private int id;
	private String typeName;
	public Types() {
			
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
}
