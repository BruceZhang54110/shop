<%@page import="com.domain.Types"%>
<%@page import="com.dao.TypesDAO"%>
<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.domain.Goods"%>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[基础数据管理]-[商品管理]-[修改商品]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <%
  	int goodsId = Integer.parseInt(request.getParameter("goodsId"));
  	GoodsDAO goodsDAO = new GoodsDAO();
  	Goods goods = goodsDAO.findById(goodsId);
  	 %>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
			<!-- 修改的表单 -->
			<form name="updateform" method="post" action="<%=request.getContextPath()%>/admin/goods/doupdate.jsp">
			<!-- 加载要修改的商品信息 -->
			<!-- 隐藏域提交修改商品的编号 -->
			 <input type="hidden" name="goodsId" value="<%=goods.getId()%>">
             <input type="hidden" name="oldGoodsName" value="<%=goods.getGoodsName()%>">
			<table width="36%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" >
         	<caption class="STYLE3">修改商品信息</caption>
			 <tr>
            <td width="39%" height="22"  bgcolor="#FFFFFF">
              <div align="right"><span class="STYLE1">商品名称：</span></div></td>
            <td width="61%" height="20" bgcolor="#FFFFFF">
                <input type="text" name="goodsName" value="<%=goods.getGoodsName()%>" />            </td>
          </tr>
		<tr>
            <td width="39%" height="22"  bgcolor="#FFFFFF">
              <div align="right"><span class="STYLE1">商品价格：</span></div></td>
            <td width="61%" height="20" bgcolor="#FFFFFF">
                <input type="text" name="goodsPrice" value="<%=goods.getGoodsPrice()%>" />            </td>
          </tr>
		<tr>
            <td width="39%" height="22"  bgcolor="#FFFFFF">
              <div align="right"><span class="STYLE1">商品数量：</span></div></td>
            <td width="61%" height="20" bgcolor="#FFFFFF">
                <input type="text" name="goodsNum" value="<%=goods.getGoodsNum()%>" />            </td>
          </tr>
		<tr>
            <td width="39%" height="22"  bgcolor="#FFFFFF">
              <div align="right"><span class="STYLE1">商品类型：</span></div></td>
            <td width="61%" height="20" bgcolor="#FFFFFF">
				<!-- 加载所有商品类型,默认显示要修改商品的当前类型 -->
	<select name="typesId">
    	<%
    	TypesDAO typesDAO = new TypesDAO();
    	List<Types> typesList = typesDAO.findAll();
    	for(Types types :typesList ){
    	%>
    	<option value="<%=types.getId()%>"  <%=types.getId()==goods.getTypes().getId() ?"selected":"" %> >
    		<%= types.getTypeName() %>
    	</option>
    	<% } %>
    </select>
			</td>
          </tr>
		<tr>
            <td width="39%" height="22"  bgcolor="#FFFFFF">
              <div align="right"><span class="STYLE1">商品状态：</span></div></td>
            <td width="61%" height="20" bgcolor="#FFFFFF">
                <input type="radio" name="goodsStatus" value="1"  <%=goods.getGoodsStatus()==1?"checked":"" %>  ><span class="STYLE1">上架</span>
				<input type="radio" name="goodsStatus" value="0"  <%=goods.getGoodsStatus()==0?"checked":"" %>  ><span class="STYLE1">下架</span>
			</td>
          </tr>

          <tr>
            <td height="20" colspan="2" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
              <input type="submit" name="Submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="reset" name="Submit2" value="重置">
            </span></div>              </td>
            </tr>
        </table></form></td>
        <!-- 表单结束 -->
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
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
