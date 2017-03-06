<%@page import="com.dao.GoodsDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dodeletes.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	String[] goodsIds = request.getParameterValues("goodsId");
    	GoodsDAO goodsDAO = new GoodsDAO();
    	for(String goodsId : goodsIds) {
    		goodsDAO.delete(Integer.parseInt(goodsId));
    	}
    	response.sendRedirect(request.getContextPath()+"/admin/goods/show.jsp");
     %>
     	
  </body>
</html>
