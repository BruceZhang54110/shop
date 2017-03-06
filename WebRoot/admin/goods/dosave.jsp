<%@page import="com.domain.Goods"%>
<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.domain.Types"%>
<%@page import="com.dao.TypesDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="5;URL=<%=request.getContextPath()%>/admin/goods/show.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>


  </head>
  
  <body>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[基础数据管理]-[商品管理]-[保存商品]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
     	<td>
     	<br><br>
     	  <%
    	request.setCharacterEncoding("utf-8");//设置请求的中文编码。与jsp页面一致
        String goodsName = request.getParameter("goodsName");
        float goodsPrice = Float.parseFloat(request.getParameter("goodsPrice"));
        int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
        int goodsSatus = Integer.parseInt(request.getParameter("goodsStatus"));
        int typesId = Integer.parseInt(request.getParameter("typesId"));
        
        Goods goods = new Goods();
    	goods.setGoodsName(goodsName);
    	goods.setGoodsNum(goodsNum);
    	goods.setGoodsPrice(goodsPrice);
    	goods.setGoodsStatus(goodsSatus);

    	Types types = new Types();
    	types.setId(typesId);

    	goods.setTypes(types);

    	GoodsDAO goodsDAO = new GoodsDAO();

    	if (goodsDAO.findByGoodsName(goods.getGoodsName()) == null) {
    	    Boolean bool = goodsDAO.save(goods);
    		if (bool) {
    			response.sendRedirect(request.getContextPath()+"/admin/goods/show.jsp");
    		}else {
    			%>
    			<div align="center"><span class="STYLE1">
    			保存失败！5秒之后自动跳转，如果没有跳转请点<a href="<%=request.getContextPath()%>/admin/goods/show.jsp">这里</a>。
    			</span></div>
    			<%
    		}
    	}else {
    		%>
    		<div align="center"><span class="STYLE1">
    		商品名称已经存在！保存失败！
    		5秒之后自动跳转，如果没有跳转请点<a href="<%=request.getContextPath()%>/admin/goods/show.jsp">这里</a>。
    		</span></div>
    		<%
    	}
    %>
    
    <br><br><br><br>
     	</td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        </td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
