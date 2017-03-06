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
		String goodsName = request.getParameter("goodsName");
		String oldGoodsName = request.getParameter("oldGoodsName");
		float goodsPrice = Float.parseFloat(request	.getParameter("goodsPrice"));
		int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
		int goodsStatus = Integer.parseInt(request.getParameter("goodsStatus"));
		int typesId = Integer.parseInt(request.getParameter("typesId"));
		int goodsId = Integer.parseInt(request.getParameter("goodsId"));//补，在Update.jsp页面中的隐藏域
		

		Goods goods = new Goods();
		goods.setId(goodsId);
		goods.setGoodsName(goodsName);
		goods.setGoodsNum(goodsNum);
		goods.setGoodsPrice(goodsPrice);
		goods.setGoodsStatus(goodsStatus);
		Types types = new Types();
		types.setId(typesId);
		goods.setTypes(types);

		GoodsDAO goodsDAO = new GoodsDAO();
		boolean bool = false;//保存更新是否成功的变量
		//更新时要不要验证商品名称是否重置？
		//1 如果商品名称修改了，则要判断新的商品名称是否重复。
		//2 如果商品名称没有修改，则不能判断。
		//?如何判断商品名称是否经过修改？
		if(oldGoodsName.equals(goodsName)){
			bool = goodsDAO.update(goods);
		}else{
			if(goodsDAO.findByGoodsName(goodsName)==null){
				bool = goodsDAO.update(goods);
			}else{
				bool = false;
				out.println("商品名称已经存在！");
			}
		}
		//根据更新的结果显示。
		if(bool){
			//更新成功。自动导航到show.jsp
			response.sendRedirect(request.getContextPath()+"/admin/goods/show.jsp");
		}else{
			//更新失败
		%>
		更新失败！如果没有跳转请点<a href="<%=request.getContextPath() %>/admin/goods/update.jsp?goodsId=<%=goodsId%>">这里</a>重新更新！
		<%
		}
	%>
	
</body>
</html>
