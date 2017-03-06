<%@page import="com.utlis.MD5Utils"%>
<%@page import="com.domain.Admins"%>
<%@page import="com.dao.AdminsDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
String adminName = request.getParameter("adminName");
String adminPass = request.getParameter("adminPass");

AdminsDAO adminsDAO  =new AdminsDAO();
Admins admins = adminsDAO.findByAdminName(adminName);

if(admins == null) {
	//用户名不存在
	response.sendRedirect(request.getContextPath()+"/adminlogin.jsp");
}else {
	MD5Utils md5Utils = new MD5Utils();
	
	if( admins.getAdminPass().equals( md5Utils.getMD5ofStr(adminPass) ) ) {
		//登录成功
		session.setAttribute("admins", admins);
		response.sendRedirect(request.getContextPath()+"/admin/main.jsp");
	}else {
	//密码错误
		response.sendRedirect(request.getContextPath()+"/adminlogin.jsp");
		
	}
}

%>
