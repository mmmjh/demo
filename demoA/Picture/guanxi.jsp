<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.dao.*"%>
    <%@page import="com.model.*"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.Date"%>
<%@page import="com.ways.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.model.*"%>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import=" java.util.Calendar"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Calendar"%>

<% 
System.out.println("混蛋刘胜达傻子");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>用户详细信息</title>
 <style>
body { margin-top: 3em; background: #eee; color: #555; font-family: "Open Sans", "Segoe UI", Helvetica, Arial, sans-serif; }
p, p a { font-value: 12px;text-align: center; color: #888; }
</style>
    <script src="echarts-all.js"></script>
    <script src="drawl.js"></script>
   </head> 
  <body>
            <div id="main" style="width: 1504px;height:664px;background-color:#fff">             
 </div>
 <%
	List<WYNews> wys=WYNewsDaoImpl.loadMain("5G", "", "", "一月内", "标题位置", "");
	String resper="",resora="",resact="";
	for(WYNews wy:wys)
	{
		resper+=wy.getAboutperson();
		resora+=wy.getAboutora();
		resact+=wy.getAboutaction();
	}
//	String a=resper.substring(beginIndex);
	String []perRes=NumCount.ciNum(resper);
	String []oraRes=NumCount.ciNum(resora);
	String []actRes=NumCount.ciNum(resact);
 %>
  <!-- 进行ajax发送并接收数据,最后根据接收的数据完成可视化工作 -->
  <script>
  var myChart = echarts.init(document.getElementById('main'), 'macarons');
  //创建Nodes
  nodes=[
                {category:0, name: '互联网', value : 100,label: '5G\n（主要）'},
                <%
                int len=0;
                if(perRes.length>20)
                	len=perRes.length;
                else
                	len=perRes.length;
       			for(int i=0;i<len;i++)//人物
       			{
            %>
            {category:1, name: '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>',value:<%=perRes[i].substring(perRes[i].indexOf("=")+1,perRes[i].length())%>},
            <%}
       		 int len1=0;
       			if(oraRes.length>20)
                	len1=oraRes.length;
                else
                	len1=perRes.length;
       			for(int i=0;i<len1;i++)//机构
                {
                %>
                {category:2, name: '<%=oraRes[i].substring(0,oraRes[i].indexOf("="))%>',value:<%=oraRes[i].substring(oraRes[i].indexOf("=")+1,oraRes[i].length())%>},
                <%}
                for(int i=0;i<actRes.length;i++)//行为
                {
                %>
                {category:3, name: '<%=actRes[i].substring(0,actRes[i].indexOf("="))%>',value:<%=actRes[i].substring(actRes[i].indexOf("=")+1,actRes[i].length())%>},
                <%}
                %>
            ],
    //创建links
            links=
          [
            	<%
            	for(int i=0;i<len;i++)
            	{
            		if(i%2==0&&(i+1)<actRes.length){
            	%>
            	 {source : '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>', target : '<%=actRes[i].substring(0,actRes[i].indexOf("="))%>', weight : 7, name: '行为'}, 
            	 {source : '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>', target : '<%=actRes[i+1].substring(0,actRes[i+1].indexOf("="))%>', weight : 7, name: '行为'}, 
            	<%}
                    else if(i%3==0&&(i+2)<actRes.length){
                  %>
                    	 {source : '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>', target : '<%=actRes[i].substring(0,actRes[i].indexOf("="))%>', weight : 7, name: '行为'}, 
                    	 {source : '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>', target : '<%=actRes[i+1].substring(0,actRes[i+1].indexOf("="))%>', weight : 7, name: '行为'},
                    	 {source : '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>', target : '<%=actRes[i+2].substring(0,actRes[i+2].indexOf("="))%>', weight : 7, name: '行为'}, 
                  <%}
            		else{
            	    %>
            			 {source : '<%=perRes[i].substring(0,perRes[i].indexOf("="))%>', target : '<%=actRes[i].substring(0,actRes[i].indexOf("="))%>', weight : 7, name: '行为'}, 
            	<%
            		     }
            	}%>
             	<%
            	for(int i=0;i<len1;i++)
            	{
            		if(i%2==0&&(actRes.length-i-1)>0)
            		{
            	%>
            			 {source : '<%=oraRes[i].substring(0,oraRes[i].indexOf("="))%>', target : '<%=actRes[actRes.length-perRes.length+i].substring(0,actRes[actRes.length-perRes.length+i].indexOf("="))%>', weight : 7, name: '行为'}, 
            	 		 {source : '<%=oraRes[i].substring(0,oraRes[i].indexOf("="))%>', target : '<%=actRes[actRes.length-i-1-1].substring(0,actRes[actRes.length-i-1-1].indexOf("="))%>', weight : 7, name: '行为'}, 
            	<%
            		}
            		else
            		{
            			%>
            			 {source : '<%=oraRes[i].substring(0,oraRes[i].indexOf("="))%>', target : '<%=actRes[actRes.length-i-1].substring(0,actRes[actRes.length-i-1].indexOf("="))%>', weight : 7, name: '行为'}, 
            			<%
            		}
            	}
            	%>
            	<%
            	for(int i=0;i<actRes.length;i++)
            	{
            	%>
            	 {source : '<%="互联网"%>', target : '<%=actRes[i].substring(0,actRes[i].indexOf("="))%>', weight : 7, name: '涉及行为'}, 
            	<%}%>
         ]
categoryArray=[{name:"核心"},{name:"人物"},{name:'机构'},{name:"行为"}]
jsondata={"categories":categoryArray,"nodes":nodes,"links":links}  
//数据格式为Json格式
createGraph(myChart,jsondata)
  </script>
 </body>
</html>
