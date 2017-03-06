<%@page import="com.domain.Types"%>
<%@page import="com.dao.TypesDAO"%>
<%@page import="com.domain.Goods"%>
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
<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
<!-- 删除一个商品的确认函数 -->
<script type="text/javascript">
				function doDel(goodsId){//定义一个函数，函数名叫doDel，goodsId是参数
					if(confirm("是否确认删除？")){//弹出确认框架
						location.href="<%=request.getContextPath()%>/admin/goods/dodelete.jsp?goodsId="+goodsId;//location是地址栏对象，href属性是地址。
					}
				}				
</script>
<!-- 批量删除的确认函数 -->
<script type="text/javascript">
	function doDels(){
		if(confirm("是否确认删除？")){//弹出确认框架
			document.delsform.submit();//名称叫"delsform"的表单提交。
		}
	}		
</script>
<!-- 复选框全选的函数 -->
<script type="text/javascript">
	function changeCheckBox(){
		var goodsIds = document.getElementById("goodsIds");//全选控制按钮
		var goodsIdList = document.getElementsByName("goodsId");//所有商品的复选框
		for(i=0;i<goodsIdList.length;i++){
			goodsIdList[i].checked = goodsIds.checked;
		}
	}		
</script>

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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[基础数据管理]-[商品管理]-[查询商品]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="<%=request.getContextPath()%>/admin/goods/save.jsp">新增</a></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="javascript:doDels()">删除</a></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  	<td>
  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
        <!-- 按商品类型查询的表单 -->
        <form action="<%=request.getContextPath()%>/admin/goods/show.jsp" method="post">
        		<span class="STYLE1">商品类型：</span>
        		<!-- 加载商品类型 -->
        		<select name="typesId">
        		<option value="-1">所有类型</option>
		    	<%
		    	TypesDAO typesDAO = new TypesDAO();
		    	List<Types> typesList = typesDAO.findAll();
		    	for(Types types :typesList ){
		    	%>
		    	<option value="<%=types.getId()%>" >
		    		<%= types.getTypeName() %>
		    	</option>
		    	<% } %>
		    </select>
        		<input type="submit" name="Submit" value="提交">
        		</form> <!-- 按商品类型查询的表单结束 -->      		
        	</td>
        	<td width="8" background="images/tab_15.gif">&nbsp;</td>
       </tr>
      </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
        <!-- 批量删除的表单 -->
        <form action="<%=request.getContextPath()%>/admin/goods/dodeletes.jsp" method="post" name="delsform">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
              <!-- 全选的控制按钮 -->
              <input type="checkbox" name="goodsIds" value="" id="goodsIds" onclick="changeCheckBox()" />
            </div></td>
            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品编号</span></div></td>
            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品名称</span></div></td>
            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品价格</span></div></td>
			<td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品数量</span></div></td>
            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品类型</span></div></td>
			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品状态</span></div></td>
            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">基本操作</span></div></td>
          </tr>
		
			<!-- 数据显示区域 -->
			<%
			String strTypesId = request.getParameter("typesId");
			GoodsDAO goodsDAO = new GoodsDAO();
			List<Goods> goodsList =null;
			//如果没有提交类型的编号或类型的编号为-1时，要查询所有商品
			if(strTypesId==null || "-1".equals(strTypesId)){
				goodsList = goodsDAO.findAll();
			}else{
				//否则，按商品类型查询商品信息
				int typesId = Integer.parseInt(strTypesId);
				goodsList = goodsDAO.findByGoodsType(typesId);
			}						
			for (Goods goods : goodsList) {		
		%>
          <tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="goodsId" value="<%=goods.getId()%>" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            	<span class="STYLE1"><%=goods.getId()%></span></div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
            	<span class="STYLE1"><%=goods.getGoodsName()%></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            	<span class="STYLE1"><%=goods.getGoodsPrice()%></span></div></td>
			<td height="20" bgcolor="#FFFFFF"><div align="center">
            	<span class="STYLE1"><%=goods.getGoodsNum()%></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            	<span class="STYLE1"><%=goods.getTypes().getTypeName()%></span></div></td>
			<td height="20" bgcolor="#FFFFFF"><div align="center">
            	<span class="STYLE1"><%=goods.getGoodsStatus()==1?"上架":"下架"%></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
            	<span class="STYLE4">
            		<img src="images/edt.gif" width="16" height="16" /><a href="<%=request.getContextPath()%>/admin/goods/update.jsp?goodsId=<%=goods.getId()%>">编辑</a>
					&nbsp; &nbsp;
            		<img src="images/del.gif" width="16" height="16" /><a href="javascript:doDel(<%=goods.getId()%>)">删除</a>
            	</span></div></td>
          </tr>
          <%
			}
		%>
          <!-- 数据显示区域结束 -->
        </table></form><!-- 批量删除的表单 --></td>
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
            <td class="STYLE4">&nbsp;&nbsp;共有 120 条记录，当前第 1/10 页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><img src="images/first.gif" width="37" height="15" /></td>
                  <td width="45"><img src="images/back.gif" width="43" height="15" /></td>
                  <td width="45"><img src="images/next.gif" width="43" height="15" /></td>
                  <td width="40"><img src="images/last.gif" width="37" height="15" /></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><img src="images/go.gif" width="37" height="15" /></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
