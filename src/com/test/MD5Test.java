package com.test;

import com.utlis.MD5Utils;

public class MD5Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		MD5Utils md5Utils = new MD5Utils();
		String pass = "123456";
		String md5pass = md5Utils.getMD5ofStr(pass);
		System.out.println(md5pass);

	}

}
