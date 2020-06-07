<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ways.*"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
    <title>区域展示页</title>
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/fontastic.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="shortcut icon" href="img/favicon.ico">
    <style>
      #china-map {
      background-color:#fff;
        width: 1300px;
        height: 800px;
        margin-left: -200px;
      }
      #back {
        left: 460px;
        top: 50px;
      }
      #box {
        display: none;
        background-color: goldenrod;
        width: 180px;
        height: 30px;
      }
      #box-title {
        display: block;
      }
    </style>

    <script type="text/javascript" src="js1/echarts.js"></script>
    <script type="text/javascript" src="js1/provinces/china.js"></script>
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
        <div class="content-inner" style="background-color:#cfd9f1">
       <div class="col-lg-8" style="margin-top:20px;margin-left:33px">
                  <div style="width:1307px;height:800px;background-color:#fff">
                    <div class="card-header d-flex align-items-center" >
                      <h3 class="h4">各区域涉及到的报道分布</h3>
                    </div>
					   <div id="back"></div>
					   <div id="china-map" style="margin-top:20px;margin-left:3px;width:1300px;height:700px"></div>
                  </div>
                </div>
               <div class="col-lg-8" style="margin-top:20px;margin-left:33px">
                  <div style="width:1307px;height:800px;background-color:#fff">
                    <div class="card-header d-flex align-items-center" >
                      <h3 class="h4">相关区域分布</h3>
                    </div>
					   <div id="back"></div>
					   <div id="cities" style="margin-top:20px;margin-left:3px;width:1300px;height:700px"></div>
                  </div>
                </div>
     </div>
</body>
</html>
<%
String []loaRes1=(String[])session.getAttribute("lo");
String sqlAll=(String)session.getAttribute("sql");
System.out.println(sqlAll);
String []allSQL=sqlAll.split("&&");
String sql=allSQL[0];
String sqlHot=allSQL[1];


String country="上海,河北,山西,内蒙古,辽宁,吉林,黑龙江,江苏,浙江,安徽,福建,江西,山东,河南,湖北,湖南,广东,广西,海南,四川,贵州,云南,西藏,陕西,甘肃,青海,宁夏,新疆,北京,天津,重庆,香港,澳门";
%>
    <script>
      function randomData() {
        return Math.round(Math.random() * 500);
      }
      var myChart = echarts.init(document.getElementById("china-map"));
      var oBack = document.getElementById("back");

      var provinces = [ "shanghai", "hebei", "shanxi","neimenggu","liaoning","jilin","heilongjiang","jiangsu","zhejiang","anhui","fujian","jiangxi","shandong","henan","hubei","hunan","guangdong","guangxi","hainan","sichuan","guizhou","yunnan","xizang","shanxi1","gansu","qinghai","ningxia","xinjiang","beijing","tianjin","chongqing","xianggang","aomen" ];
      var provincesText = ["上海","河北","山西","内蒙古","辽宁","吉林","黑龙江","江苏","浙江","安徽","福建","江西","山东","河南","湖北","湖南","广东","广西","海南","四川","贵州","云南","西藏","陕西","甘肃","青海","宁夏","新疆","北京","天津","重庆","香港","澳门"];

      var seriesData = [
    	  <%
    	  for(int i=0;i<loaRes1.length;i++)
    	  {
    		  if(country.contains(loaRes1[i].substring(0,loaRes1[i].indexOf("=")))){  
    			  String sqlJI=sql+"   and aboutloc like '%"+loaRes1[i].substring(0,loaRes1[i].indexOf("="))+"%'";
    	      	  WYNews emotionNew=WYNewsDaoImpl.loadNum(sqlJI);
    	  %>
    		{name:'<%=loaRes1[i].substring(0,loaRes1[i].indexOf("="))%>',value:<%=emotionNew.getCountNum()%>},
        <%}
        }%>
      ];

      var provincesdata = [];

      oBack.onclick = function() {
        initEcharts("china", "中国");
      };

      initEcharts("china", "中国");

      // 初始化echarts
      function initEcharts(pName, Chinese_) {
        var tmpSeriesData = pName === "china" ? seriesData : provincesdata;

        var option = {
        		backgroundColor: "#191E40",
          title: {
            text: Chinese_ || pName,
            left: "center"
          },
          tooltip: {
            trigger: "item",
            formatter: "{b}<br/>报道数：{c}"
          },
          //左侧小导航图标
          visualMap: {
            show: true,
            x: "left",
            y: "top",
            textStyle: { color: "#fbfdfe" } ,
            splitList: [
              { start: 50, end: 200 },
              { start: 40, end: 50 },
              { start: 30, end: 40 },
              { start: 20, end: 30 },
              { start: 10, end: 20 },
              { start: 0, end: 10 }
            ],
            color: [
              "#294066",
              "#335180",
              "#3D6199",
              "#4771B3",
              "#5281CC",
              "#66A1FF"
            ]
          },

          series: [
            {
              name: Chinese_ || pName,
              type: "map",
              mapType: pName,
              roam: true, //是否开启鼠标缩放和平移漫游
              data: tmpSeriesData,
              top: "10%", //组件距离容器的距离
              left:"25%",
              zoom: 1.1,
              selectedMode: "single",

              label: {
                normal: {
                  show: true, //显示省份标签
                  textStyle: { color: "#fbfdfe" } //省份标签字体颜色
                },
                emphasis: {
                  //对应的鼠标悬浮效果
                  show: true,
                  textStyle: { color: "#aaa" }
                }
              },
              itemStyle: {
                normal: {
                  borderWidth: 0.5, //区域边框宽度
                  borderColor: "#0550c3", //区域边框颜色
                  areaColor: "#66A1FF" //区域颜色
                },

                emphasis: {
                  borderWidth: 0.5,
                  borderColor: "#4b0082",
                  areaColor: "#FFB366"
                }
              }
            }
          ]
        };

        myChart.setOption(option);
        myChart.setOption(option);
        myChart.on('click', function (params) {
            var data=params.value
            //点没有source属性
            if(data.source==undefined){
                nodeName=params.name
                window.open("NewFile1.jsp?a="+nodeName)
            }

    });
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
      }

    </script>
  </body>
</html>
<!-- 情感分类折线图 -->
 <script type="text/javascript" src="js1/echarts.js"></script>
    <script>
    
   
      var category = [
    	 <%
	  	 String []are=new String[16];
    	 int flagj=0;
         for(int i=0;i<loaRes1.length;i++)
	   {
		  if(country.contains(loaRes1[i].substring(0,loaRes1[i].indexOf("=")))){  
			  are[flagj]=loaRes1[i].substring(0,loaRes1[i].indexOf("="));
			  flagj++;
			  if(flagj==15)
			  {
				  break;
			  }
			  %>
			  '<%=loaRes1[i].substring(0,loaRes1[i].indexOf("="))%>',
		<%}
	  }%>
    	  ];
      var area = [//前一页传来的总报道数
	    	  <%//新闻总数
	    	  for(int i=0;i<14;i++){
	        	  String sqlJI=sql+"   and aboutloc like '%"+are[i]+"%'";
	        	  WYNews emotionNew=WYNewsDaoImpl.loadNum(sqlJI);
	        	  %>
	        	  <%=emotionNew.getCountNum()%>,
	        	  <%
	    	  }
	    	  %> 
    	  ];
      var population = [
    	  <%//积极的
    	  for(int i=0;i<15;i++){
        	  String sqlJI=sql+" and emotion='积极' and aboutloc like '%"+are[i]+"%'";
        	  WYNews emotionNew=WYNewsDaoImpl.loadNum(sqlJI);
        	  %>
        	  <%=emotionNew.getCountNum()%>,
        	  <%
    	  }
    	  %>  
      ];
      var GDP = [
    	  <%//消极的
    	  for(int i=0;i<15;i++){
        	  String sqlJI=sql+" and emotion='消极' and aboutloc like '%"+are[i]+"%'";
        	  WYNews emotionNew=WYNewsDaoImpl.loadNum(sqlJI);
        	  %>
        	  <%=emotionNew.getCountNum()%>,
        	  <%
    	  }
    	  %>  
      ];
      var realties = [
    	  <%//中等的
    	  for(int i=0;i<15;i++){
        	  String sqlJI=sql+" and emotion='中等' and aboutloc like '%"+are[i]+"%'";
        	  WYNews emotionNew=WYNewsDaoImpl.loadNum(sqlJI);
        	  %>
        	  <%=emotionNew.getCountNum()%>,
        	  <%
    	  }
    	  %>  
      ];
      var fe = [
    	  <%//热度
    	  for(int i=0;i<14;i++){
        	  String sqlJI=sqlHot+"  and aboutloc like '%"+are[i]+"%'";
        	  WYNews emotionNew=WYNewsDaoImpl.loadNumHOT(sqlJI);
        	  %>
        	  <%=emotionNew.getCountNum()%>,
        	  <%
    	  }
    	  %>  
      ];


      var myChart = echarts.init(document.getElementById("cities"));

      var option = {
        backgroundColor: "#191E40",
        tooltip: {
          trigger: "axis",
          backgroundColor: "rgba(255,255,255,0.1)",
          axisPointer: {
            type: "shadow",
            label: {
              show: true,
              backgroundColor: "#7B7DDC"
            }
          }
        },
        legend: {
          data: ["总新闻数", "热度", "正面报道", "负面报道", "中性报道"],
          textStyle: {
            color: "#B4B4B4"
          },
          top: "7%"
        },
        grid: {
          x: "9%",
          width: "82%",
          y: "12%"
        },
        xAxis: {
          data: category,
          axisLine: {
            lineStyle: {
              color: "#B4B4B4"
            }
          },
          axisTick: {
            show: false
          }
        },
        yAxis: [
          {
            splitLine: { show: false },
            axisLine: {
              lineStyle: {
                color: "#B4B4B4"
              }
            },

            axisLabel: {
              formatter: "{value} "
            }
          },
          {
            splitLine: { show: false },
            axisLine: {
              lineStyle: {
                color: "#B4B4B4"
              }
            },
            axisLabel: {
              formatter: "{value} "
            }
          }
        ],

        series: [
          {
            name: "热度",
            type: "bar",
            barWidth: "15%",
            itemStyle: {
              normal: {
                barBorderRadius: 5,
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                  { offset: 0, color: "rgba(156,107,211,0.5)" },
                  { offset: 0.2, color: "rgba(156,107,211,0.3)" },
                  { offset: 1, color: "rgba(156,107,211,0.3)" }
                ])
              }
            },
            data: fe
          },

          {
            name: "总新闻数",
            type: "bar",
            barGap: "100%",
            barWidth: "15%",
            yAxisIndex: 1,
            itemStyle: {
              normal: {
                barBorderRadius: 5,
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                  { offset: 0, color: "#956FD4" },
                  { offset: 1, color: "#3EACE5" }
                ])
              }
            },
            data: area
          },
          {
            name: "正面报道",
            type: "line",
            smooth: true,
            showAllSymbol: true,
            symbol: "emptyCircle",
            symbolSize: 8,
            yAxisIndex: 1,
            itemStyle: {
              normal: {
                color: "orangered"
              }
            },
            data: population 
          },

          {
            name: "负面报道",
            type: "line",
            smooth: true,
            showAllSymbol: true,
            symbol: "emptyCircle",
            symbolSize: 8,
            yAxisIndex: 1,
            itemStyle: {
              normal: {
                color: "#F02FC2"
              }
            },
            data: GDP
          },
          {
            name: "中性报道",
            type: "line",
            smooth: true,
            showAllSymbol: true,
            symbol: "emptyCircle",
            symbolSize: 8,
            yAxisIndex: 1,
            itemStyle: {
              normal: {
                color: "orange"
              }
            },
            data: realties
          }
        ]
      };
      myChart.setOption(option);
    </script>
 