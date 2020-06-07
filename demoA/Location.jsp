<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.dao.*"%>
    <%@page import="com.model.*"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.Date"%>
<%@page import="com.ways.*"%>
<%@page import="com.paNews.*"%>
<%@page import="com.model.*"%>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import=" java.util.Calendar"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Calendar"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="arima.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>网络舆情监控系统/具体新闻页</title>
    
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
	<style>
		.div1 {
			width: 100%;
			height: 1100px;
		}
		
		.btn {
			width: 100px;
			height: 34px;
			font-size: 14px;
			font-family: PingFangSC-Regular;
			color: rgba(255, 255, 255, 1);
			background: rgba(76, 132, 255, 1);
			border-radius: 2px;
			border: 1px solid rgba(76, 132, 255, 1);
			padding: 0px;
			text-align: center;
			line-height: 34px;
		}
		#exportdata {
			background: cornsilk;
			width: 50%;
			height: 100%;
		}
	</style>
    
    <!--引用百度地图API-->
    <script src="http://api.map.baidu.com/api?key=&amp;v=1.1&amp;services=true" type="text/javascript"></script>
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
         .vertical-timeline {     
            color: #FFF;     
            font-family: "微软雅黑", "Microsoft YaHei";     
        }     
     
        .vertical-timeline-block {     
            width: 100%;     
            border-left: 2px solid #DDD;     
            margin: 0 10px;     
            position: relative;     
            padding-bottom: 30px;     
        }     
     
        /* 时间轴的左侧图标 */     
        .vertical-timeline-icon {     
            width: 40px;     
            height: 40px;     
            border-radius: 20px;     
            position: absolute;     
            left: -22px;     
            top: 10px;     
     
            text-align: center;     
            line-height: 40px;     
            cursor: pointer;     
            transition: all 0.2s ease-in;     
            -webkit-transition: all 0.2s ease-in;     
            -moz-transition: all 0.2s ease-in;     
            -o-transition: all 0.2s ease-in;     
        }     
        .vertical-timeline-block {     
            cursor: pointer;     
        }     
        .vertical-timeline-block:hover .vertical-timeline-icon {     
            width: 50px;     
            height: 50px;     
            border-radius: 25px;     
            line-height: 50px;     
            left: -27px;     
            box-shadow: 0 0 5px #CCC;     
            font-size: 25px;     
        }     
     
        /* 时间轴的左侧图标的各种样式 */     
        .v-timeline-icon1 {     
            background-color: #2aabd2;     
        }     
        .v-timeline-icon2 {     
            background-color: #5cb85c;     
        }     
        .v-timeline-icon3 {     
            background-color: #8c8c8c;     
        }     
        /* 时间轴的左侧图标上的序号*/     
        .vertical-timeline-icon i {     
            font-style: normal;     
            color: #FFF;     
        }     
        /* 时间轴上的具体内容 */     
        .vertical-timeline-content {     
            background-color: #5bc0de;     
            margin-left: 60px;     
            padding: 15px 20px;     
            border-radius: 5px;     
            position: relative;     
        }     
        /* 时间轴上的具体内容左侧箭头 */     
        .vertical-timeline-content:before {     
            content: '';     
            width: 0;     
            height: 0;     
     
            border-top: 5px solid transparent;     
            border-bottom: 10px solid transparent;     
            border-right: 10px solid #5bc0de;     
            border-left: 10px solid transparent;     
     
            position: absolute;     
            right: 100%;     
            top: 10px;     
        }     
     
    </style>   
  
  </head>
  <body>
   <div class="page">
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
                  <div class="brand-text d-none d-lg-inline-block"><span>网络舆情 </span><strong>实时监控</strong></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
          <!-- 预警信息提示-->
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
                <li class="nav-item"><a href="login.html" class="nav-link logout"> <span class="d-none d-sm-inline">退出</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
        <div class="page-content d-flex align-items-stretch"    style="background-color:#cfd9f1"> 
        <!-- Side Navbar -->
        <nav class="side-navbar"  >
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center"  >
            
            <div class="title" >

                <h1 class="h4">你好！<%=userget.getUsername() %></h1>
              <%
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
              //System.out.println(df.format(new Date()));// new Date()为获取当前系统时间

              %>
              <p><%=df.format(new Date())%></p>
            </div>
          </div>
       <!-- Sidebar Navidation Menus--><span class="heading">菜单栏</span>
          <ul class="list-unstyled"  >
                    <li class="active"><a href="index.jsp"> <i class="icon-home"></i>首页 </a></li>
                     <li><a href="find.jsp"> <i class="icon-grid"></i>新闻中心 </a></li>
                     <li><a href="BigData.jsp"> <i class="fa fa-bar-chart"></i>数据大屏</a></li>
                       <li><a href="#exampledropdownDropdown1" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>专题舆情</a>
                      <ul id="exampledropdownDropdown1" class="collapse list-unstyled ">
                        <li><a href="KeyWords.jsp">专题词监控中心</a></li>
                      </ul>
                    </li>
            <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>预警舆情</a>
                      <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                        <li><a href="New110.jsp">预警舆情汇总</a></li>
                      </ul>
                    </li>
                  <li><a href="#exampledropdownDropdown5" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>敏感词中心</a>
                      <ul id="exampledropdownDropdown5" class="collapse list-unstyled ">
                        <li><a href="Senstive.jsp">敏感词库</a></li>
                      </ul>
                    </li>
                    <li><a href="#exampledropdownDropdown2" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>用户中心</a>
                      <ul id="exampledropdownDropdown2" class="collapse list-unstyled ">
                        <li><a href="updateUser.jsp">个人信息设置</a></li>
                        <li><a href="about/about.jsp">关于</a></li>
                      </ul>
                    </li>
        </nav> 
        <% 
    	request.setCharacterEncoding("UTF-8");
  		String keyword="美监管机构扩大对亚马逊反垄断审查 涉及云计算";
  		keyword = request.getParameter("title");//关键字
  		System.out.println(keyword+"标题");
  		System.out.println("select * from hottopic where title like '%格兰仕称天猫猫宁店的格兰仕产品被全部下架%'"+"\t 我不爱刘胜达了");
        List<WYNews> wys=WYNewsDaoImpl.load("select * from wynews where title like'%"+keyword+"%'");
        List<HotTopic> wyshot=WYNewsDaoImpl.loadhotTopic("select * from hottopic where title like '%"+keyword+"%'");
        %>
        <script>
	function exportData() {
		html2canvas(document.getElementById("pdf"), {//到导出的部分的id
			onrendered: function(canvas) {
				var imgData = canvas.toDataURL('image/jpeg');
				//初始化pdf，设置相应格式
				var doc = new jsPDF("p", "mm", "a4");

				//这里设置的是a4纸张尺寸
				doc.addImage(imgData, 'JPEG', 0, 0, 210, 297);
				//保存时的文件名，自行设置，这里输出保存命名为www.pdf
				doc.save('www.pdf');
			}
		});
	}
</script>
        <div class="content-inner" style="">      
          <!-- 新闻内容-->
          <section class="client no-padding-top" style="height:auto;min-height:500px;" id="pdf">
            <div id="container" style="height:auto;min-height:500px;margin-left:30px;margin-right:30px;background-color:#FBFFFD;margin-top:30px">
                  <div align="center" ><h1 >&nbsp  </h1></div>
                  	<div class="btn" onclick="exportData()" style="margin-left:1200px">导出pdf</div>
                  	
                 <div align="center" style="margin-top:40px"><p style="font-size:1.7em;font-weight:bold;">  <%=wys.get(0).getTitle() %></p></div>
                 <div  style="margin-top:50px;margin-left:50px"><img src="image/time.jpg" style="width:30px;height:30px;"><h8 >热度：  <%=wys.get(0).getHotnum() %></h8></div>
                  <div  style="margin-top:-30px;margin-left:950px"><h8 >  <%=wys.get(0).getTime() %>　&nbsp&nbsp&nbsp&nbsp来源:  <%=wys.get(0).getPublisher() %></h8></div>
                   <div style="margin-top:50px;width:1000px;margin-left:130px;height:auto"><p  id="con2"  style="text-indent:2em;font-size: 1.3em;"><%=wys.get(0).getContent() %></p></div>
                   <div  style="margin-top:50px;margin-left:170px"><h8 >关键字词：  <%=wys.get(0).getKeywords() %></h8></div>
                   <div  style="margin-top:10px;margin-left:170px"><h8 >摘要：  <%=wys.get(0).getSummary() %></h8></div>
                   <hr />
                   <div style="margin-left:60px">趋势分析</div>
                   <div style="margin-left:80px;margin-top:80px">
                   <div style="width:30px;height:16px;background-color:#c9cbf5"><p style="width:100px;margin-left:35px;margin-top:-5px">现在</p></div>
                    <div style="width:30px;height:16px;background-color:#c03703;margin-top:15px"><p style="width:100px;margin-left:35px;margin-top:-5px">预测</p></div>
                     <div style="width:30px;height:16px;background-color:#9d0212;margin-top:15px"><p style="width:100px;margin-left:35px;margin-top:-5px">最热</p></div>
                      <div style="width:30px;height:16px;background-color:#454545;margin-top:15px"><p style="width:100px;margin-left:35px;margin-top:-5px">最低</p></div>
                </div>
                 <div id="hot"  style="height:550px;width:1230px;margin-top:-170px;margin-left:70px;border: 2px solid;border-radius: 25px;"></div>
                 <div style="height:30px"></div>
                 
                 
                 
   	 <script src="Picture/echarts.js"></script>
       <script type="text/javascript">
       <%
       String []res=cutTime.cuttime(wyshot.get(0).getTimehot());
       String []time=new String[res.length];
       String []num=new String[res.length];
       for(int i=0;i<res.length;i++)
       {
       	String []spiltRes=res[i].split("\t");
       	time[i]=spiltRes[0];
       	num[i]=spiltRes[1];//得到的该新闻的时间序列
       }
      
       String []TimeEnd=new String[15+time.length];
       int []NumEnd=new int[15+num.length];
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       Calendar calendar = Calendar.getInstance();
       Date date=null;
       try {
           date =(Date) sdf.parse(time[0]);
       } catch (Exception e) {
           e.printStackTrace();
       }
       calendar.setTime(date);
       int day=calendar.get(Calendar.DATE);
       calendar.set(Calendar.DATE,day-15);
       day=calendar.get(Calendar.DATE);
       String lastDay = sdf.format(calendar.getTime());
       TimeEnd[0]=lastDay;
       NumEnd[0]= Integer.parseInt(num[0])-15;
       for(int i=1;i<15;i++)
       {
    	   day=calendar.get(Calendar.DATE);
           calendar.set(Calendar.DATE,day+1);
           lastDay = sdf.format(calendar.getTime());
           TimeEnd[i]=lastDay;
           NumEnd[i]=NumEnd[0]+i*3-5;
       }//底层默认十个值
       for(int i=0;i<time.length;i++){
    	   TimeEnd[15+i]=time[i];
    	   NumEnd[15+i]=Integer.parseInt(num[i]);
       }//循环给时间序列赋值
       for(int i=0;i<TimeEnd.length;i++){
    	   //System.out.println(TimeEnd[i]+"\t"+NumEnd[i]);
    	   test1.write(NumEnd[i]);
       }//先把前15次写入 之后每一次预测结束都写进文件然后再次预测
    
       SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
       Calendar calendar1 = Calendar.getInstance();
       Date date1=null;
       date1 =(Date) sdf1.parse(time[time.length-1]);
       calendar1.setTime(date1);
       String []getTime=new String[5];
       System.out.println("最后的时间："+time[time.length-1]);
       for(int i=0;i<5;i++)
       {
       	     day=calendar1.get(Calendar.DATE);
             calendar1.set(Calendar.DATE,day+1);
             lastDay = sdf1.format(calendar1.getTime());
             getTime[i]=lastDay;
             System.out.println("预测时间："+getTime[i]);
       }
       int []yv=test1.testYv();//预测未来五天时间和热度
       for(int i=0;i<yv.length;i++)
			System.out.println("mjh"+yv[i]+"预测");
       %>
var dom = document.getElementById("hot");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
		visualMap: {
	        show: false,
	        dimension: 0,
	        pieces: [{
	            lte: <%=time.length-1%>,
	            color: '#c9cbf5'
	        }, {
	            gt: 5,
	            lte:<%=time.length+getTime.length%>,
	            color: '#c03703'
	        }]},
    title: {
        text: '事件热度趋势走势分析预测',
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['实际热度','预测热度']
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis:  {
    	  name: "日期",
        type: 'category',
        boundaryGap: false,
        data: [
        	<%
        	for(int i=0;i<time.length;i++)//现在
        	{
        	%>
        	'<%=time[i]%>',
        	<%}%>
        	
          <%	for(int i=0;i<getTime.length;i++)//未来五天
        	{
        	%>
        	'<%=getTime[i]%>',
        	<%}%>
        	]
    },
    yAxis: {
    	    name: "热度",
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
        {
            name:'事件热度：',
            areaStyle: {normal: {}},
            type:'line',
            data:[
            	<%for(int i=0;i<num.length;i++){%>
            	<%=num[i]%>, 
            	<%}%>
            	 <%	for(int i=0;i<yv.length;i++)
                	{
                	%>
                	'<%=yv[i]%>',
                	<%}%>
            	],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值',itemStyle:{normal:{color:'#9d0212'}}},
                    {type: 'min', name: '最小值',itemStyle:{normal:{color:'#454545'}}}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '实际热度均值',                	lineStyle: {
                		normal: {
                    		type: 'solid',
                    		color: '#73aae5'
                    		}
                    		},}
                ]
            }
        },
        {
            name: '预测值',
            type: 'line',
           
            itemStyle : {  
            	
                normal : {  
                	 color:'#00FF00',  
                    lineStyle:{  
                        color:'#c03703'  
                    } ,
                    textStyle:{color:'red'},
                } ,
            },  
            data: [<%="0"%>,
            	<%
            	for(int i=1;i<num.length;i++)
            	{
            		int  a=0;
            		if(i%2==0)
            		{
						 a=(Integer.parseInt(num[i])*6);
					}
            		else
            			{
            			 a=0-(Integer.parseInt(num[i])*2);
            			}
            	%>
            	<%=num[i]%>+<%=a/7%>,
            	<%
            	}%>
             	
            	],

            markLine: {
                data: [
                	   {type: 'average', name: '预测走势均值',                	lineStyle: {
                   		normal: {
                       		type: 'solid',
                       		color: '#c84100'
                       		}
                       		},}

                ]
            }
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
                 
                 
        <%--          <!-- 趋势走势 -->
     <script src="Picture/echarts.js"></script>
		<script src="Picture/dataTool.js"></script>    
       <script type="text/javascript">
var dom = document.getElementById("hot");
var myChart = echarts.init(dom);
<%
System.out.println("demo"+wyshot.get(0).getTimehot());
String []res=cutTime.cuttime(wyshot.get(0).getTimehot());
String []time=new String[res.length];
String []num=new String[res.length];
for(int i=0;i<res.length;i++)
{
	String []spiltRes=res[i].split("\t");
	time[i]=spiltRes[0];
	num[i]=spiltRes[1];
}

%>
var cities = [
	   {
		        name: '<%=time[0]%>',
		        value: <%=num[0]%>
		 },
	<%

		for(int i=1;i<time.length;i++){
		System.out.println(time[i]+"\t"+num[i]);
		%>
			{
		        name: '<%=time[i]%>',
		        value: <%=num[i]%>
		    },
	<%}
	%>
	
	].sort(function(a, b) {
		   // return b.value - a.value;
	});
	var labelOption = {
	    show: false,
	    lineHeight: 20,
	    align: 'left',
	    position: 'top',
	    rich: {
	        name: {
	            color: '#fff',
	            fontSize: 16,
	            textShadowBlur: 2,
	            textShadowColor: '#000',
	            textShadowOffsetX: 0,
	            textShadowOffsetY: 1,
	            textBorderColor: '#333',
	            textBorderWidth: 2
	        },
	        value: {
	            fontSize: 14,
	            color: 'rgb(84,184,167)'
	        },
	        desc: {
	            color: 'rgb(85,85,85)',
	            textBorderColor: '#000',
	            textBorderWidth: 1,
	            fontSize: 12
	        },
	    }
	};
	var xData = [],vData = [],lineData = [],pointData = [];
	cities.forEach(function(city, index) {
	    xData.push(city.name);
	    vData.push({
	        value: city.value,
	        symbol: 'circle',
	        symbolSize: 10,
	        color:'red',
	    });
	    let coord1 = [index, city.value+0.5];
	    let coord2 ;
	    if(index===0){
	        coord2=[index, city.value+2];
	    }else{
	        if(city.value===cities[index-1].value){
	            coord2=[index, pointData[index-1].coord[1]];
	        }else{
	            coord2=[index, cities[index-1].value];
	        }
	    }
	    pointData.push(Object.assign({}, {
	        label: Object.assign({}, labelOption, {
	            formatter: [
	                '{name|' + city.name + '}\n',
	                '{value|' + city.value + '}'
	            ].join('')
	        }),
	        coord: coord2
	    }))
	    lineData.push(
	    [
		    {
	            xAxis: index,
	            coord: coord1
	        }, {
	            xAxis: index,
	            coord: coord2
	        }]);
	});
	var axisLabelTextColor = 'rgb(135,135,135)';
	option = {
			 tooltip: {
		            trigger: 'axis',
		            axisPointer: {
		                type: 'none'
		            },
		            formatter: function (params) {
		                return params[0].name + ': ' + params[0].value;
		            }
		        },
	 backgroundColor: 'rgba(255,255,255,1)',
	    title: {
	        text: '',
	        x: 'center',
	        y: 10,
	        textStyle:{
	            color:'#B4B4B4',
	            fontSize:18,
	            fontWeight:'normal',
	        },
	    },
	    xAxis: {
	        data: xData,
	        axisLabel: {
	            textStyle: {
	                color: axisLabelTextColor
	            },
	            rotate: 45,
	        },
	show:true,
	    },
	    yAxis: {
	        name: "热度",
	        nameTextStyle: {
	            color: axisLabelTextColor
	        },
	        splitLine: {
	            show:true
	        },
	        axisTick: {
	            show: true
	        },
	        axisLine: {
	            show: true
	        },
	        axisLabel: {
	            color: axisLabelTextColor
	        },
	show:true,
	    },
	    series: [{
	        name: '省份',
	        type: 'pictorialBar',
	        symbol: 'triangle',
	        symbolPosition: 'start',
	        itemStyle: {
	            normal: {
	                //opacity: 0.5
	            },
	            emphasis: {
	                opacity: 1
	            },
	        },
	        color: {
	            type: 'linear',
	            x: 0,
	            y: 0,
	            x2: 0,
	            y2: 1,
	            colorStops: [{
	                offset: 1,
	                color: 'rgb(78,9,72)' // 0% 处的颜色
	            }, {
	                offset: 0,
	                color: 'rgb(255,0,0)' // 100% 处的颜色
	            }],
	        },
	        data: cities,
	        z: 10,
	        markLine: {
	            symbol: [0, 'none'],
	            label: {
	                normal: {
	                    show: true
	                }
	            },
	            lineStyle: {
	                normal: {
	                    color: 'rgb(80,80,80)',
	                    width: 1
	                },
	                emphasis: {
	                    width: 1,
	                    type: 'dashed'
	                },
	            },
	            data: lineData
	        },
	        markPoint: {
	            symbol: 'circle',
	            symbolSize: 0.1,
	            data: pointData
	        }
	    }, {
	        name: '数量',
	        type: 'pictorialBar',
	        symbolPosition: 'end',
	        color: 'rgb(0,255,0)',
	        symbolOffset: [0, -10],
	        data: vData
	    }]
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
                  --%>
                 <hr />
              <%
                 String sqlUrl="select * from wynews where title IN(select title from hottopic where title='"+wys.get(0).getTitle() +"')";
                 List<WYNews> wysUrl=WYNewsDaoImpl.load(sqlUrl);
                 System.out.println(wysUrl.get(0).getUrl());
                 String[]commUrl=wysUrl.get(0).getUrl().split("/");
                 String urlcomm="http://comment.tie.163.com/"+commUrl[commUrl.length-1];
                 String resComm= py.Comment("http://comment.tie.163.com/"+commUrl[commUrl.length-1]);
                 String[]comm=resComm.split("&&");
                 %>
                 <div style="margin-left:60px">新闻相关评论</div>
                 <div id="hotcon"  style="height:550px;width:1230px;margin-top:0px;margin-left:70px;border: 2px solid;border-radius: 25px;">
                                  <div style="width:500px;margin-left:50px;margin-top:40px">
                                  <%
                                  int lenco=0;
                                  if(comm.length<8)
                                	  lenco=comm.length;
                                  else
                                	  lenco=8;
                                  for(int i=0;i<lenco;i++){
                                	  String co="";
                                	  if(comm[i].length()>25)
                                		  co=comm[i].substring(0,25)+"...";
                                	  else
                                		  co=comm[i];
                                	  if(i==0){
                                	  %>
								            <div class="vertical-timeline-block">     
								                <div class="vertical-timeline-icon v-timeline-icon1">     
								                    <i class="icon"><%=i%></i>     
								                </div>     
								                <div class="vertical-timeline-content"  style="height:3px">     
								                    <p class="timeline-content" style="margin-top:-8px;margin-left:-15px;"><a href="<%= urlcomm%>" style="color:#fff"><%=co %></a></p>       
								                </div>     
								            </div>     
								     <%
                                		  
                                		  }else{     
                                		%>
								            <div class="vertical-timeline-block" >     
								                <div class="vertical-timeline-icon v-timeline-icon2">     
								                    <i class="icon"><%=i%></i>     
								                </div>     
								                <div class="vertical-timeline-content" style="height:3px">     
								                    <p class="timeline-content" style="margin-top:-8px;margin-left:-15px"><a href="<%= urlcomm%>" style="color:#fff"><%=co %></a></p>      
								                </div>     
								            </div>  
								            <%
                                		  } 
								            }%>   
								     </div>
								     <!-- 评论在右侧显示 -->
								       <div style="width:500px;margin-left:620px;margin-top:-480px">
                                  <%
                                  int lenco1=0;
                                  if(comm.length>7&&comm.length<16){
                                	  lenco1=comm.length;
                                  }
                                  if(comm.length>16)
                                	  lenco1=16;
                                  String co1="";
                                  for(int i=8;i<lenco1;i++){
                                	  if(comm[i].length()>25)
                                		  co1=comm[i].substring(0,25)+"...";
                                	  else
                                		  co1=comm[i];
                                	  if(i==0){
                                	  %>
								            <div class="vertical-timeline-block">     
								                <div class="vertical-timeline-icon v-timeline-icon1">     
								                    <i class="icon"><%=i%></i>     
								                </div>     
								                <div class="vertical-timeline-content"  style="height:3px">     
								                    <p class="timeline-content" style="margin-top:-8px;margin-left:-15px;"><a href="<%= urlcomm%>" style="color:#fff"><%=co1%></a></p>       
								                </div>     
								            </div>     
								     <%
                                	  }else{ 
                                	  %>
								            <div class="vertical-timeline-block" >     
								                <div class="vertical-timeline-icon v-timeline-icon2">     
								                    <i class="icon"><%=i%></i>     
								                </div>     
								                <div class="vertical-timeline-content" style="height:3px">     
								                    <p class="timeline-content" style="margin-top:-8px;margin-left:-15px"><a href="<%= urlcomm%>" style="color:#fff"><%=co1 %></a></p>      
								                </div>     
								            </div>  
								            <%
                                	  }

								            }%>   
								     </div>

							</div>
				<div style="height:30px"></div>
				 <hr />
				 <%
				 	     String urlNews="https://www.baidu.com/s?tn=news&rtt=1&bsst=1&cl=2&origin=ps&wd=";
				 		 com.paNews.pa ss=new com.paNews.pa();
				 		 String resNews=ss.getNews(urlNews+keyword);
				 		 String []news=resNews.split("&&");
				 		 String resSummary=ss.getNews(urlNews+wys.get(0).getSummary());
				 		 String[]summary=resSummary.split("&&"); 
				 %>
			<div style="margin-left:60px">事件来源分析（占比较高报道）</div>
                 <div id="hotde"  style="height:400px;width:1230px;margin-top:0px;margin-left:70px;"> 
                 <%int ss1=0;
                 for(int i=0;i<news.length;i++){ 
                	 if(news[i].substring(0,news[i].indexOf("++")).length()>0){
                		 ss1++;
                %>
                    <div class="vertical-timeline-block">     
		                <div class="vertical-timeline-icon v-timeline-icon1">     
		                    <i class="icon"><%=ss1%></i>     
		                </div>     
		                <div class="vertical-timeline-content"  style="height:3px">     
		                    <p class="timeline-content" style="margin-top:-8px;margin-left:-15px;"><a href="<%=news[i].substring(news[i].indexOf("++")+1,news[i].length())%>" style="color:#fff"><%=news[i].substring(0,news[i].indexOf("++"))+"\t"+time[i]%></a></p>       
		                </div>     
		           </div>    
                  <%
                  if(ss1==7)
                	  break;}}%>
                  <% 
                  if(news.length<10){//标题搜不出来就用摘要爬
                  for(int i=0;i<summary.length;i++){ %>
                 <div> <a href="<%=summary[i].substring(summary[i].indexOf("++")+1,summary[i].length())%>" style="font-size:1.2em;margin-left:30px;margin-top:10px"><%=summary[i].substring(0,summary[i].indexOf("++"))%></a></div>
                  <%
                  if(news.length+i==10)
                	  break;
                  } 
                }
                if(news.length==0&&summary.length==0){%>
                <p style="font-size:1.5em;margin-top:20px;margin-left:30px">暂无相关新闻</p><%} %>
                 </div> 
				<div style="height:30px"></div>
            </div>      
          </section>
          <!-- Feeds Section-->
       
     
          <!-- Page Footer-->
          <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>邮箱 &copy; Hebeimjhui@163.com <a href="#" target="_blank" title="模板之家">石家庄铁道大学</a> - 软件工程系 <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">马佳慧</a></p>
                </div>
                <div class="col-sm-6 text-right">
                  <p></p>
                  <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                </div>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/charts-home.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
     <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&__ec_v__=20190126"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>

     <!-- 多文本展开收起 -->
		    <script>
		    function init(){
		        var len = 408;      //计算出每一行所能显示的字数个数，假设我要显示3行，乘以3即可，然后在减去一点距离就能达到这个效果
		        var con = document.getElementById("con2");
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
		    init()
		</script> 
