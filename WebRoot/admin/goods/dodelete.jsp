<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.domain.Goods"%>
<%@page import="com.domain.Types"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'dosave.jsp' starting page</title>

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
		request.setCharacterEncoding("utf-8");//设置请求的中文编码，与JSP页面的编码一致。
		int goodsId = Integer.parseInt(request.getParameter("goodsId"));
		GoodsDAO goodsDAO = new GoodsDAO();
		if(goodsDAO.delete(goodsId)) {
			response.sendRedirect(request.getContextPath()+"/admin/goods/show.jsp");
		}else {
			%>
			删除失败！<a href="/web01/show.jsp">这里</a>
			<%
			
		}
	%>
</body>
</html>
