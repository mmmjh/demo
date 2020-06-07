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
    <%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>具体主题词分析</title>
<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/fontastic.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="shortcut icon" href="img/favicon.ico">
       <style>
        a{
            margin-left: 15px;
            text-decoration: none;/*a标签不显示下划线*/
        }
    </style>
  </head>
  <body>

      <!-- Main Navbar-->
      <header class="header">
        <nav class="navbar" style="background-color:#5e87b0">
          <!-- Search Box-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="index.jsp" class="navbar-brand d-none d-sm-inline-block">
                  <div class="brand-text d-none d-lg-inline-block"><span>网络舆情 </span><strong>监控平台</strong></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                     <%
        	User userget=(User)session.getAttribute("user");
            %>
                <%
                List<JingNews> new110=JingDao.load(userget.getUsername());
                int allJing=0;
                for(JingNews jnew:new110)
                {
                		if((Integer.parseInt(jnew.getHot())>10000)&&!jnew.getHot110().contains("-")&&jnew.getStatus().equals("已预警，未处理"))
           				{
           					allJing++;
           				}
                		if(jnew.getHot110().contains("-")&&jnew.getStatus().equals("已预警，未处理"))
                		{
                			allJing++;
                			
                		}
                }
            		//System.out.println(allJing+"总数预警数目");
                %>
                   <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner" title="预警数"><%=allJing %></span></a>
                  <ul aria-labelledby="notifications" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification">
                          <div class="notification-content"><i class="fa fa-envelope bg-green"></i>预警提示 </div>
                           <div class="notification-time"><small>您关注的新闻事件有<%=allJing %>条已达到预警范围，请尽快查看</small></div>
                          <div class="notification-time"><small>12:17</small></div>
                        </div></a></li>
                    
                    <li><a rel="nofollow" href="New110.jsp" class="dropdown-item all-notifications text-center"> <strong>查看预警消息                                          </strong></a></li>
                  </ul>
                </li>

                <!-- Logout    -->
                <li class="nav-item"><a href="login.html" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
              <%
         	request.setCharacterEncoding("UTF-8");
      		String keyword="互联网";
      		keyword = request.getParameter("a");//关键字
			%>
		<% 
		List<WYNews> wyPers=WYNewsDaoImpl.loadRelation("互联网","", "", "全部", "全部位置","",keyword);
		String pers="",acts="",oras="",keys1="",locs="";
		for(WYNews wy:wyPers)
		{
			pers+=wy.getAboutperson();
			acts+=wy.getAboutaction();
			oras+=wy.getAboutora();
			locs+=wy.getAboutloc();
			keys1+=wy.getKeywords();
			keys1+=", ";
		}
		//System.out.println(acts+"mjh");
	//	String a=resper.substring(beginIndex);
		String []keyRes1=Nums.ciNum(keys1, ",");//主题词
		String []perRes1=Nums.ciNum(pers, "；");//人物
		String[]oraRes1=Nums.ciNum(oras, "；");//机构
		String []actRes1=Nums.ciNum(acts, "；");//行为
		String []locRes1=Nums.ciNum(locs, "；");//行为
		%>  
			<div class="page-content d-flex align-items-stretch"    style="background-color:#cfd9f1"> 
        <div style="height:100%;width:1400px" >
          <!-- 描述-->
          <div   style="width:1800px">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">首页</a></li>
              <li class="breadcrumb-item active">主题词监控/<%= keyword%></li>
            </ul>
          </div>

          <!-- 人、机构、行为-->
                 <div class="col-lg-8" style="margin-top:20px;margin-left:-13px;">
                  <div style="width:1387px;height:500px;background-color:#fff;border-radius: 15px;  background-image:url(panel.png) ;background-size:100% 100%; background-repeat:no-repeat ;margin-left:100px ;" >
                    <div style="margin-top:20px">
                      <h3 class="h4" style="color:#fff;margin-top:5px;margin-left:20px">涉及的热点新闻</h3>
                    </div>
                      <div class="card-body">
                     <div id="per" style="width: 504px;height:424px;margin-top:-10px;margin-left:-20px;"></div>
                    </div>
                      <div class="card-body">
                       <div id="act" style="width: 504px;height:424px;margin-top:-460px;margin-left:380px"></div>
                    </div>
                    <div class="card-body">
                       <div id="ora" style="width: 504px;height:424px;margin-top:-499px;margin-left:805px"></div>
                  </div>
                </div>
                  <!-- 地区 -->
                <div class="col-lg-6" style="margin-left:100px;max-width:82%;border-radius: 15px;background-color:#fff;background-image:url(panel.png)  ;background-size:110% 100%; background-repeat:no-repeat ">
                    <div style="width:807px;height:515px;background-color:#fff;margin-left:-2px;margin-top:20px;border-radius: 15px;">
                    <div class="card-header d-flex align-items-center"  style="margin-top:20px;border-radius: 15px;">
                      <h3 class="h4">涉及到的地域分布</h3>
                    </div>
                      <div class="card-body" style="border-radius: 15px;">
                   <div id="mainMap" style="height:400px;width:1000px;padding:10px;margin-top:-20px;margin-left:-120px;border-radius: 15px;"></div>
                    </div>
                    </div>
                    </div>
                    <!-- 热词 -->
                 <div class="col-lg-6" style="margin-top:-533px;border-radius: 15px;background-color:#fff;margin-left:935px;max-width:61%;background-image:url(panel.png)  ;background-size:79% 100%; background-repeat:no-repeat ">
                  <div class="articles card" style="margin-top:20px;width:520px;height:515px;border-radius: 15px;">
                    <div class="card-header d-flex align-items-center" style="border-radius: 15px;">
                      <h2 class="h3">该热词涉及到的热词</h2>
 						<div class="badge badge-rounded bg-green">Hot </div>
                    </div>
                 <div class="card-body" style="border-radius: 15px;">
                        <div id="hotword" style="border-radius: 15px;height:420px;width:500px;margin-top:-10px;margin-left:-10px; border: 2px solid;border-radius: 25px;"></div>
                    </div>
                  </div>
                </div>
                <!--涉及到的新闻 -->
              <div style="width:1387px;height:auto;border-radius: 15px;background-color:#fff;background-image:url(panel.png)  ;background-size:100% 100%; background-repeat:no-repeat ;margin-left:100px ;" >
                    <div style="margin-top:20px">
                      <h3 class="h4" style="margin-top:5px;margin-left:20px">与之相关</h3>
                   
                    </div>
                    <%
                	//分页的条件
  					int pageIndex = 1;
  					int pageSize =5;
  					int id=1;
  					if(request.getParameter("pageIndex")!=null&&request.getParameter("pageIndex")!="")
  					pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
  				    Pager pager=WYNewsDaoImpl.loadRelationPage("互联网","", "", "全部", "全部位置","",keyword,pageIndex,pageSize);
  				   List<WYNews> wynews=pager.getDatas();
                    %>
                   <div class="table-responsive">
                            <table class="table table-inbox table-hover table-responsive" border="1"  >    
                                <% int k=0;
                                for(WYNews key:wynews){ %>
                                <tr >
                                  <td >
                                    <input type="checkbox" class="mail-checkbox" style="width:20px;text-align:center;margin-top:45px">
                                  </td>
                                  <td class="view-message "  style="width:1370px;text-align:left" >
                                   <p id="<%="con"+k %>"><h3 style=""><%=key.getTitle()%></h3><p style="margin-top:-30px;margin-left:500px;"><%="发布时间："+key.getTime()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%="热度："+key.getHotnum()%></p></p>
                                   <p>摘要：<%=key.getSummary()%></p>
                                    <p  id ="<%=k%>"style="width:1200px">新闻内容：<%=key.getContent()%></p>
                                  </td>
                                  <td class="view-message "  style="width:100px;text-align:center;"><p style="margin-top:10px;margin-left:-50px;"><a href="<%=key.getUrl()%>"  style="margin-left:-40px;">查看</a></p></td>
                                   <td class="view-message "  style="width:100px;text-align:center"><p style="margin-top:10px;color:#fff;margin-left:-50px;"><a href="<%=key.getUrl()%>"  style="margin-left:-20px;">加入预警</a></p></td> 
                                </tr>

                               <%k++;} %>                        
                               <!-- 设置分页的页码 -->	
								<tr>
									<td colspan="8" align="center">
										<a href="zaiti.jsp?pageIndex=1&a=<%=keyword%>">首页</a>
										
										<!-- 如果是第一页的话 , 就不显示 上一页 -->
										<%
											if(pageIndex > 1){
										%>
											<a href="zaiti.jsp?pageIndex=<%=pageIndex-1 %>&a=<%=keyword%>%>">上一页</a>
										<%
											}
										%>
										<!-- 页码的显示 , 如果是当前页 , 就不加超链接, 只是显示就可以 , 其他都加上超链接 -->
										<%
											//先获得总页数,对他进行for循环遍历
											int totalPage = pager.getTotalPage();
											for(int i = 1 ; i <=totalPage ; i++){
												if(pageIndex == i){
										%>	
												<%=i %>
											<%
												}else{
											%>		
												<a href="zaiti.jsp?pageIndex=<%=i%>&a=<%=keyword%>"><%=i %></a>
										<%
												}
											}	
										%>	
										<%
											if( pageIndex < totalPage){
										%>
											<a href="zaiti.jsp?pageIndex=<%=pageIndex + 1 %>&a=<%=keyword%>">下一页</a>
										<%
											}
										%>
										<a href="zaiti.jsp?pageIndex=<%=totalPage%>&a=<%=keyword%>">尾页</a>
									</td>
								</tr>
                               
                            </table>
                          </div>
               
                </div>
         </div>
     </div>
     </div>
 </body>
</html>
<!-- 涉及到的人物图 -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="Picture/echarts.js"></script>
		<script src="Picture/dataTool.js"></script>    	
       <script type="text/javascript">
var dom = document.getElementById("per");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '力引导布局';

myChart.showLoading();
myChart.hideLoading();
        categories=[
            {
                "name": "人物",
            },
             {
                 "name": "中心词",
             },
        ],
    nodes=[
    	{
            name: "<%=keyword%>",
            value: 100,
            category: 1,
            symbolSize:20,
         },
    	    	<%
    	int lenK=0;
    	if(perRes1.length>50)
    		lenK=50;
    	else
    		lenK=perRes1.length;
    	for(int i=0;i<lenK;i++){
    	if(!perRes1[i].substring(0,perRes1[i].indexOf("=")).equals(keyword)){
    		int vp=0;
    		if(Integer.parseInt(perRes1[i].substring(perRes1[i].indexOf("=")+1,perRes1[i].length()))>10)
    			vp=Integer.parseInt(perRes1[i].substring(perRes1[i].indexOf("=")+1,perRes1[i].length()));
    		else
    			vp=Integer.parseInt(perRes1[i].substring(perRes1[i].indexOf("=")+1,perRes1[i].length()))*7;
    	%>
        {
            name: "<%=perRes1[i].substring(0,perRes1[i].indexOf("="))%>",
            value: 100,
            category: 0,
            symbolSize:<%=vp%>,
         },
        <%}}%>
],
links=[
	<%for(int i=0;i<lenK+1;i++){%>
    {
    	"flow": 1,
        source: "<%=keyword%>",
        target: <%=i%>,
    },
    {
    	"flow": 1,
        source: <%=i+3%>,
        target: <%=i*3+5%>,
    },
    {
    	"flow": 1,
        source: <%=i+2%>,
        target: <%=i*6-7%>,
    },

<%}%>
],
    option = {		
        title: {
            text: '',
            subtext: 'Default layout',
            top: 'bottom',
            left: 'right'
        },
        tooltip:{
        	formatter:function(params){//线上的提示
                if(params.data.flow){
                    return '关联';
                }
                else{
                    return params.name;
                }  
			}
        },
        legend: {
            data: ['人物', '中心词', '行为措施', '主题'],
            textStyle:{},
        },
        series : [
            {
                name: '',
                type: 'graph',
                layout: 'force',
                data: nodes,
                edges: links,
                categories:  categories,
                roam: true,//缩放
                draggable: true,//拖移
                focusNodeAdjacency: true,//点击时其他点变暗
                label: {
                    normal: {
                        position: 'right'
                    }
                },
                force: {
                    repulsion: 100
                },
            }
        ]
    };

    myChart.setOption(option);
    myChart.on('click', function (params) {
        var data=params.value
        //点没有source属性
        if(data.source==undefined){
            nodeName=params.name
            window.open("NewFile1.jsp?a=mjh")
        }

});
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
<!-- 行为图 -->
        <script type="text/javascript">
var dom = document.getElementById("act");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '力引导布局';

myChart.showLoading();
    myChart.hideLoading();

    //var graph = echarts.dataTool.gexf.parse(xml);
        categories=[
            {
                "name": "行为措施",
            },
             {
                 "name": "中心词",
             },
        ],
        nodes=[
        	{
                name: "<%=keyword%>",
                value: 100,
                category: 1,
                symbolSize:20,
             },
        	    	<%
    	int lenA=0;
    	if(actRes1.length>100)
    		lenA=100;
    	else
    		lenA=actRes1.length;
    	for(int i=0;i<lenA;i++){
    	if(!actRes1[i].substring(0,actRes1[i].indexOf("=")).equals(keyword)){
    		int v=0;
    		if(Integer.parseInt(actRes1[i].substring(actRes1[i].indexOf("=")+1,actRes1[i].length()))>10)
    			v=Integer.parseInt(actRes1[i].substring(actRes1[i].indexOf("=")+1,actRes1[i].length()));
    		else
    			v=Integer.parseInt(actRes1[i].substring(actRes1[i].indexOf("=")+1,actRes1[i].length()))*7;
    	%>
        {
            name: "<%=actRes1[i].substring(0,actRes1[i].indexOf("="))%>",
            value: 100,
            category: 0,
            symbolSize:<%=v%>,
         },
        <%}}%>
    ],
    links=[
    	<%for(int i=0;i<lenA+1;i++){%>
        {
        	"flow": 1,
            source: '<%=keyword%>',
            target: <%=i%>,
        },
        {
        	"flow": 1,
            source: <%=i+3%>,
            target: <%=i*5-2%>,
        },
        {
        	"flow": 1,
            source: <%=i%>,
            target: <%=i*6-7%>,
        },
        {
        	"flow": 1,
            source: <%=i*3-5%>,
            target: <%=i*5+3%>,
        },
        {
        	"flow": 1,
            source: <%=i*2%>,
            target: <%=i*5+3%>,
        },
    	<%}%>
],
    option = {		
        color: ['#bd407e','#009393'], 
        title: {
            text: '',
            subtext: 'Default layout',
            top: 'bottom',
            left: 'right'
        },
        tooltip:{
        	formatter:function(params){//线上的提示
                if(params.data.flow){
                    return '关联';
                }
                else{
                    return params.name;
                }  
			}
        },
        legend: {
            data: [ '行为措施', '中心词', '主题'],
            textStyle:{ /* color: 'red' */},
        },
        series : [
            {
                name: '',
                type: 'graph',
                layout: 'force',
                data: nodes,
                edges: links,
                categories:  categories,
                roam: true,//缩放
                draggable: true,//拖移
                focusNodeAdjacency: true,//点击时其他点变暗
                label: {
                    normal: {
                        position: 'right'
                    }
                },
                force: {
                    repulsion: 100
                },
            }
        ]
    };

    myChart.setOption(option);
    myChart.on('click', function (params) {
        var data=params.value
        //点没有source属性
        if(data.source==undefined){
            nodeName=params.name
            window.open("NewFile1.jsp?a=mjh")
        }

});
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>   
          <script type="text/javascript">
var dom = document.getElementById("ora");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '力引导布局';

myChart.showLoading();
    myChart.hideLoading();

    //var graph = echarts.dataTool.gexf.parse(xml);
        categories=[
            {
                "name": "机构",
            },
             {
                 "name": "中心词",
             },
        ],
        nodes=[
        	{
                name: "<%=keyword%>",
                value: 100,
                category: 1,
                symbolSize:20,
             },
        	<%
    	int lenO=0;
    	if(oraRes1.length>50)
    		lenO=50;
    	else
    		lenO=oraRes1.length;
    	for(int i=0;i<lenO;i++){
    	if(!oraRes1[i].substring(0,oraRes1[i].indexOf("=")).equals(keyword)){
    		int va=0;
    		if(Integer.parseInt(oraRes1[i].substring(oraRes1[i].indexOf("=")+1,oraRes1[i].length()))>10)
    			va=Integer.parseInt(oraRes1[i].substring(oraRes1[i].indexOf("=")+1,oraRes1[i].length()));
    		else
    			va=Integer.parseInt(oraRes1[i].substring(oraRes1[i].indexOf("=")+1,oraRes1[i].length()))*7;
    	%>
        {
            name: "<%=oraRes1[i].substring(0,oraRes1[i].indexOf("="))%>",
            value: 100,
            category: 0,
            symbolSize:<%=va%>,
         },
        <%}}%>
    ],
    links=[
    	<%for(int i=0;i<lenO+1;i++){%>
        {
        	"flow": 1,
            source: '<%=keyword%>',
            target: <%=i%>,
        },
        {
        	"flow": 1,
            source: <%=i+3%>,
            target: <%=i*5-2%>,
        },
        {
        	"flow": 1,
            source: <%=i%>,
            target: <%=i*6-7%>,
        },
        {
        	"flow": 1,
            source: <%=i*3-5%>,
            target: <%=i*5+3%>,
        },
        {
        	"flow": 1,
            source: <%=i*2%>,
            target: <%=i*5+3%>,
        },
    	<%}%>
],
    option = {		
        color: ['#1b6136','#3957a4'], 
        title: {
            text: '',
            subtext: 'Default layout',
            top: 'bottom',
            left: 'right'
        },
        tooltip:{
        	formatter:function(params){//线上的提示
                if(params.data.flow){
                    return '关联';
                }
                else{
                    return params.name;
                }  
			}
        },
        legend: {
            data: [ '机构', '中心词', '主题'],
            textStyle:{},
            
        },
        series : [
            {
                name: '',
                type: 'graph',
                layout: 'force',
                data: nodes,
                edges: links,
                categories:  categories,
                roam: true,//缩放
                draggable: true,//拖移
                focusNodeAdjacency: true,//点击时其他点变暗
                label: {
                    normal: {
                        position: 'right'
                    }
                },
                force: {
                    repulsion: 100
                },
            }
        ]
    };

    myChart.setOption(option);
    myChart.on('click', function (params) {
        var data=params.value
        //点没有source属性
        if(data.source==undefined){
            nodeName=params.name
            window.open("NewFile1.jsp?a=mjh")
        }

});
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>    
 <!-- 地图 -->
 <script type="text/javascript" src="./js/jquery-1.8.0.js"></script> 
<script type="text/javascript" src="./js/china.js"></script> 
<script src="./js/js/echarts.js" charset="UTF-8"></script>
 <script type="text/javascript">
	$('#document').ready(function(){
		 getEcharts();
	 });
</script>

<script type="text/javascript">
function getEcharts(){
    require.config({
        paths: {
            echarts: './js'
        }
    });
    require(
        [
            'echarts',
            'echarts/chart/map'
        ],
        function (ec) {
            // --- 地图 ---
            var myChart2 = ec.init(document.getElementById('mainMap'));
            myChart2.setOption({
				dataRange: {
					min : 0,
					max : 100,
					calculable : true,
					color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
					textStyle:{
						color:'#fff'
					},
					x: 100,
				},
				  tooltip: {
                    formatter:function(params,ticket, callback){
                        return params.seriesName+'<br />'+params.name+'：'+params.value
                    }//数据格式化
                },
				series : [
					{
						name: '热度',
						type: 'map',
						roam:false,
						hoverable: false,
						mapType: 'china',
						itemStyle:{
							normal:{
								borderColor:'rgba(100,149,237,1)',
								borderWidth:0.5,
								areaStyle:{
									color: '#1b1b1b'
								}
							}
						},
						data:[],
						markLine : {
							smooth:true,
							symbol: ['none', 'circle'],  
							symbolSize : 1,
							itemStyle : {
								normal: {
									color:'#fff',
									borderWidth:1,
									borderColor:'rgba(30,144,255,0.5)'
								}
							},
							data : [
							],
						},
						geoCoord: {
							'上海': [121.4648,31.2891],'东莞': [113.8953,22.901],'东营': [118.7073,37.5513],'中山': [113.4229,22.478],'临汾': [111.4783,36.1615],'临沂': [118.3118,35.2936],'丹东': [124.541,40.4242],'丽水': [119.5642,28.1854],'乌鲁木齐': [87.9236,43.5883],'佛山': [112.8955,23.1097],'保定': [115.0488,39.0948],'兰州': [103.5901,36.3043],'包头': [110.3467,41.4899],'北京': [116.4551,40.2539],'北海': [109.314,21.6211],'南京': [118.8062,31.9208],'南宁': [108.479,23.1152],'南昌': [116.0046,28.6633],'南通': [121.1023,32.1625],'厦门': [118.1689,24.6478],'台州': [121.1353,28.6688],'合肥': [117.29,32.0581],'呼和浩特': [111.4124,40.4901],'咸阳': [108.4131,34.8706],'哈尔滨': [127.9688,45.368],'唐山': [118.4766,39.6826],'嘉兴': [120.9155,30.6354],'大同': [113.7854,39.8035],'大连': [122.2229,39.4409],'天津': [117.4219,39.4189],'太原': [112.3352,37.9413],'威海': [121.9482,37.1393],'宁波': [121.5967,29.6466],'宝鸡': [107.1826,34.3433],'宿迁': [118.5535,33.7775],'常州': [119.4543,31.5582],'广州': [113.5107,23.2196],'廊坊': [116.521,39.0509],'延安': [109.1052,36.4252],'张家口': [115.1477,40.8527],'徐州': [117.5208,34.3268],'德州': [116.6858,37.2107],'惠州': [114.6204,23.1647],'成都': [103.9526,30.7617],'扬州': [119.4653,32.8162],'承德': [117.5757,41.4075],'拉萨': [91.1865,30.1465],'无锡': [120.3442,31.5527],'日照': [119.2786,35.5023],'昆明': [102.9199,25.4663],'杭州': [119.5313,29.8773],'枣庄': [117.323,34.8926],'柳州': [109.3799,24.9774],'株洲': [113.5327,27.0319],'武汉': [114.3896,30.6628],'汕头': [117.1692,23.3405],'江门': [112.6318,22.1484],'沈阳': [123.1238,42.1216],'沧州': [116.8286,38.2104],'河源': [114.917,23.9722],'泉州': [118.3228,25.1147],'泰安': [117.0264,36.0516],'泰州': [120.0586,32.5525],'济南': [117.1582,36.8701],'济宁': [116.8286,35.3375],'海口': [110.3893,19.8516],'淄博': [118.0371,36.6064],'淮安': [118.927,33.4039],'深圳': [114.5435,22.5439],'清远': [112.9175,24.3292],'温州': [120.498,27.8119],'渭南': [109.7864,35.0299],'湖州': [119.8608,30.7782],'湘潭': [112.5439,27.7075],'滨州': [117.8174,37.4963],'潍坊': [119.0918,36.524],'烟台': [120.7397,37.5128],'玉溪': [101.9312,23.8898],'珠海': [113.7305,22.1155],'盐城': [120.2234,33.5577],'盘锦': [121.9482,41.0449],'石家庄': [114.4995,38.1006],'福州': [119.4543,25.9222],'秦皇岛': [119.2126,40.0232],'绍兴': [120.564,29.7565],'聊城': [115.9167,36.4032],'肇庆': [112.1265,23.5822],'舟山': [122.2559,30.2234],'苏州': [120.6519,31.3989],'莱芜': [117.6526,36.2714],'菏泽': [115.6201,35.2057],'营口': [122.4316,40.4297],'葫芦岛': [120.1575,40.578],'河北': [115.8838,37.7161],'衢州': [118.6853,28.8666],'西宁': [101.4038,36.8207],'西安': [109.1162,34.2004],'贵阳': [106.6992,26.7682],'连云港': [119.1248,34.552],'邢台': [114.8071,37.2821],'邯郸': [114.4775,36.535],'郑州': [113.4668,34.6234],'鄂尔多斯': [108.9734,39.2487],'重庆': [107.7539,30.1904],'金华': [120.0037,29.1028],'铜川': [109.0393,35.1947],'银川': [106.3586,38.1775],'镇江': [119.4763,31.9702],'长春': [125.8154,44.2584],'长沙': [113.0823,28.2568],'长治': [112.8625,36.4746],'阳泉': [113.4778,38.0951],'青岛': [120.4651,36.3373],'韶关':[113.7964,24.7028],'新疆': [86.61 , 40.79], '西藏':[89.13 , 30.66], '黑龙江':[128.34 , 47.05], '吉林':[126.32 , 43.38], '辽宁':[123.42 , 41.29], '内蒙古':[112.17 , 42.81], '宁夏':[106.27 , 36.76], '山西':[111.95,37.65],'青海':[97.07 , 35.62],'甘肃':[103.82 , 36.05], '山东':[118.01 , 36.37], '陕西':[108.94 , 34.46], '河南':[113.46 , 34.25], '安徽':[117.28 , 31.86], '江苏':[120.26 , 32.54], '上海':[121.46 , 31.28], '四川':[103.36 , 30.65], '湖北':[112.29 , 30.98], '浙江':[120.15 , 29.28], '湖南':[112.08 , 27.79], '江西':[115.89 , 27.97], '贵州':[106.91 , 26.67], '福建':[118.31 , 26.07], '云南':[101.71 , 24.84], '台湾':[121.01 , 23.54], '广西':[108.67 , 23.68], '广东':[113.98 , 22.82],'海南':[110.03 , 19.33],'澳门':[113.54 , 22.19], '香港':[114.17 , 22.32],
						},
						markPoint : {
							symbol:'emptyCircle',
							symbolSize : function (v){
								return 10 + v/10
							},
							effect : {
								show: true,
								shadowBlur : 0
							},
							itemStyle:{
								normal:{
									label:{show:true}
								},
								emphasis: {
									label:{position:'top'}
								}
							},
							data : [
							<%
							String allWorld="上海，东莞，东营，中山，临汾，临沂，丹东，丽水，乌鲁木齐，佛山，保定，兰州，包头，北京，北海，南京，南宁，南昌，南通，厦门，台州，合肥，呼和浩特，咸阳，哈尔滨，唐山，嘉兴，大同，大连，天津，太原，威海，宁波，宝鸡，宿迁，常州，广州，廊坊，延安，张家口，徐州，德州，惠州，成都，扬州，承德，拉萨，无锡，日照，昆明，枣庄，柳州，株洲，汕头，江门，沈阳，沧州，河源，泉州，泰安，泰州，济南，济宁，海口，淄博，淮安，深圳，清远，温州，渭南，湖州，湘潭，滨州，潍坊，烟台，玉溪，珠海，盐城，盘锦，石家庄，福州，秦皇岛，绍兴，聊城，肇庆，舟山，苏州，莱芜，菏泽，营口，葫芦岛，河北，衢州，西宁，西安，贵阳，连云港，邢台，邯郸，郑州，鄂尔多斯，重庆，金华，铜川，银川，镇江，长春，长沙，长治，阳泉，青岛，韶关，新疆，西藏，黑龙江，吉林，辽宁，内蒙古，宁夏，山西，青海，甘肃，山东，陕西，河南，安徽，江苏，上海，四川，贵州，江西，湖南，浙江，湖北，福建，云南，台湾，广西，广东，香港，澳门，海南";
							for(int i=0;i<locRes1.length;i++)
							{if(allWorld.contains(locRes1[i].substring(0,locRes1[i].indexOf("="))))
								{
								System.out.println(locRes1[i]);
								%>
								{name:'<%=locRes1[i].substring(0,locRes1[i].indexOf("="))%>',value:<%=locRes1[i].substring(locRes1[i].indexOf("=")+1,locRes1[i].length())%>*2},
						<%}
							}%>

							]
						}
					},
					
				]
        });
	});
}
    </script>
    <!-- 词云分布 -->
    <!-- Main词云 -->
<script src="js/echarts-all.js"></script>
 <script type="text/javascript">
  function createRandomItemStyle() {
	    return {
	        normal: {
	            color: 'rgb(' + [
	                Math.round(Math.random() * 160),
	                Math.round(Math.random() * 160),
	                Math.round(Math.random() * 160)
	            ].join(',') + ')'
	        }
	    };
	}

        // 基于准备好的dom，初始化echarts图表
        var chart = echarts.init(document.getElementById('hotword')); 
        var option = {
        	    title: {
        	        text: '相关热词',
        	        link: ''
        	    },
        	    tooltip: {
        	        show: true
        	    },
        	    series: [{
        	        name: '近期热词',
        	        type: 'wordCloud',
        	        size: ['120%', '120%'],
        	        gridSize: 1,
                    sizeRange: [12, 50],
                    rotationRange: [-90, 90],
        	        shape: 'pentagon',
        	        width: 600,
                    height: 400,
        	        drawOutOfBound: true,
        	        emphasis: {
                        shadowBlur: 10,
                        shadowColor: '#333'
                    },
                    data: [      			
     	               <% 
     	              for( int i=0;i<keyRes1.length;i++ ){
     					if(keyRes1[i].substring(0,keyRes1[i].indexOf("=")).length()>1){     						
     				%>
     				 {
     					 name: '<%=keyRes1[i].substring(0,keyRes1[i].indexOf("="))%>',
     					  value: <%=Integer.parseInt(keyRes1[i].substring(keyRes1[i].indexOf("=")+1,keyRes1[i].length()))*15%>, 
     	                itemStyle: createRandomItemStyle()        	               
     	            },
     	        	<%
     					}
     				}		
     	        	%>
     	        ]
        	    }]
        	};
       
        // 为echarts对象加载数据 
        chart.setOption(option); 
        window.onresize = chart.resize;

        chart.on("click", function (param){  
      	  var name=param.name;
      	window.location.href="#?name="+name;
      });
       
    </script>
    <!-- 多文本展开收起 -->
    <script>
    function init(id){
    	 document.getElementById(id).innerHTML = document.getElementById(id).innerHTML.replace(/<%=keyword%>/ig,"<span style='color: red;'>$&</span>");
    	 document.getElementById("<%="con"+id%>").innerHTML = document.getElementById("<%="con"+id%>").innerHTML.replace(/<%=keyword%>/ig,"<span style='color: red;'>$&</span>");
        var len = 178;      //计算出每一行所能显示的字数个数，假设我要显示3行，乘以3即可，然后在减去一点距离就能达到这个效果
        var con = document.getElementById(id);
        var content = con.innerHTML;       //获取div里的文本内容
        var span = document.createElement("span");     //创建<span>元素
        var a = document.createElement("a");           //创建<a>元素
        span.innerHTML = content.substring(0,len);     //span的内容就是con的前len个字符

        a.innerHTML = content.length>len?"... 展开":""; //判断显示的字数是否大于默认显示的字数    来设置a的显示
        a.href = "javascript:void(0)";//让a链接点击不跳转

        a.onclick = function(){
            if(a.innerHTML.indexOf("展开")>0){      //如果a中含有"展开"则显示"收起"
                a.innerHTML = "<<&nbsp;收起";
                span.innerHTML = content;
            }else{
                a.innerHTML = "... 展开";
                span.innerHTML = content.substring(0,len);
            }
        };
        // 设置div内容为空，span元素 a元素加入到div中
        con.innerHTML = "";
        con.appendChild(span);
        con.appendChild(a);
    }
    <%for(int i=0;i<wynews.size();i++){%>
    init("<%=i%>")
    <%}%>
 //   init("con3")
</script>