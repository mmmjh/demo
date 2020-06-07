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
    
        <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>网络舆情监控系统首页</title>
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


  </head>
  <body>
    <div class="page">
      <!-- Main Navbar-->
      <header class="header"  >
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

                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                            <%
        	User user=(User)session.getAttribute("user");//当前登录用户
            %>
          <!-- 预警信息提示-->
                <%
                List<JingNews> new110=JingDao.load(user.getUsername());
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
              <h1 class="h4">你好！<%=user.getUsername() %></h1>
              <%
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
              %>
              <p style="margin-left:-10px;width:150px"><%=df.format(new Date())%></p>
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
        <div class="content-inner">
          <!-- Page Header-->

          <!-- 显示积极消极新闻的条数-->
          <section class="dashboard-counts no-padding-bottom" >
            <div class="container-fluid"  >
              <div class="row bg-white has-shadow" style="height:80px;margin-top:-40px">
                <!-- Item -->
                <div class="col-xl-3 col-sm-6"  style="margin-top:-40px">
                  <div class="item d-flex align-items-center" >
                    <div class="icon bg-violet"><i class="icon-user"></i></div>
                    <div class="title"><span>今日新闻<br>总条数</span>
                      <div class="progress">
                      <%
                      SimpleDateFormat sdFormattd=new SimpleDateFormat("yyyy-MM-dd");
                      Calendar calendartd=Calendar.getInstance();
                      String td=sdFormattd.format(calendartd.getTime());
                      calendartd.add(Calendar.DATE,+1);
                      String tom=sdFormattd.format(calendartd.getTime());
                      List<WYNews> wytd=WYNewsDaoImpl.loademotion(td, tom);
                      int sumTd=0;
                      for(WYNews wy:wytd)
                      {
                    	  sumTd+=wy.getCount();
                      }
                      %>
                        <div role="progressbar" style="width: 100%; height: 4px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-violet"></div>
                      </div>
                    </div>
                    <div class="number"><strong><%=sumTd %></strong></div>
                  </div>
                </div>
                <!-- Item -->
                <%
                String []img=new String[]{"con bg-red","con bg-green","icon bg-orange"};
                int imgi=0;
                for(WYNews wy:wytd)
                {
                	double ss=((double)wy.getCount()/(double)sumTd)*100;
                %>
                <div class="col-xl-3 col-sm-6" style="margin-top:-40px">
                  <div class="item d-flex align-items-center">
                    <div class="<%=img[imgi] %>"><i class="icon-padnote"></i></div>
                    <div class="title"><span>新闻<br><%=wy.getEmotion()%>的</span>
                      <div class="progress">
                        <div role="progressbar" style="width: <%=ss %>%; height: 4px;" aria-valuenow="<%=wy.getCount() %>" aria-valuemin="0" aria-valuemax="<%=sumTd %>" class="progress-bar bg-red"></div>
                      </div>
                    </div>
                    <div class="number"><strong><%=wy.getCount() %></strong></div>
                  </div>
                </div>
                <%
                       imgi++;
                } %>

              </div>
            </div>
          </section>
<!--           今日
          
           <section class="feeds no-padding-top">
            <div class="container-fluid">
              <div class="row">
                今日
                <div class="col-lg-6" style="margin-left:10px;background-size:100% 97%;margin-top:20px;background-repeat:no-repeat;max-width:100% ">
                  <div class="checklist card" style="margin-top:20px;width:100%;height:545px;width:1338px;">
                    <div class="card-header d-flex align-items-center" style="height:30px">           
                      <h3 >近一个月事件展示</h3>
                    </div>
                   <div id="HotThing" style="width:1338px;height:500px"></div>
                  </div>
                </div>
              </div>
            </div>
          </section> -->
          <%
          SimpleDateFormat sdFormatT=new SimpleDateFormat("yyyy-MM-dd");
          Calendar calendarT=Calendar.getInstance();
          //System.out.println("当前系统时间: "+sdFormatT.format(calendarT.getTime()));
          calendarT.add(Calendar.DATE,+1);
          String etTime=sdFormatT.format(calendarT.getTime());
          calendarT.add(Calendar.DATE,-7);
          String stTime=sdFormatT.format(calendarT.getTime());
          List<WYNews> emotions=WYNewsDaoImpl.loademotion(stTime,etTime);
          int sumEmotion=0;
          for(WYNews em:emotions){
        	  //System.out.println(em.getEmotion()+em.getCount()+"wbd ");
        	  sumEmotion+=em.getCount();
          }
          int allSunday=WYNewsDaoImpl.loadSunday(stTime,etTime);
          %>
          <section class="feeds no-padding-top">
            <div class="container-fluid">
              <div class="row">
                <div class="col-lg-6" style="margin-left:1px;background-size:100% 97%;margin-top:20px;background-repeat:no-repeat;max-width:100% ">
                  <div class="checklist card" style="margin-top:-1px;width:100%;height:545px;width:588px;height:300px">
                  <div style="width:220px;height:100px;border:1px solid  #d3d3d3;border-radius: 15px; margin-top:20px;margin-left:50px">
                  <p><h3 style="margin-top:30px;margin-left:10px">本周新闻数</h3><p style="margin-top:-55px;color:red;font-size:2.5em;margin-left:120px"><%=allSunday %></p><p><h3 style="margin-top:-50px;margin-left:189px">条</h3></p>
                  </div>
                   <div style="width:220px;height:100px;border:1px solid  #d3d3d3;border-radius: 15px; margin-top:-80px;margin-left:320px">
                  <p><h3 style="margin-top:30px;margin-left:10px">今日新闻数</h3><p style="margin-top:-55px;color:blue;font-size:2.5em;margin-left:120px"><%=sumTd %></p><p><h3 style="margin-top:-50px;margin-left:180px">条</h3></p>
                  </div>
                   <div id="ji"    style="width:200px;height:406px;margin-top:-110px"></div>
                   <div id="zhong"    style="width:200px;height:406px;margin-top:-320px;margin-left:190px"></div>
                      <div id="xiao"    style="width:200px;height:406px;margin-top:-320px;margin-left:390px"></div>
                        
                  </div>
                </div>
              </div>
            </div>
            <div id="tian" style="height: 300px;width:740px;margin-left:650px;background-color:#fff;margin-top:-329px"></div>
          </section>
          <!-- 本周   -->
          <section class="dashboard-header"  style="margin-top:-10px">
            <div class="container-fluid" style="width:750px;margin-left:2px;margin-top:-65px" style="margin-top:-20px">
              <div class="row">
                <!-- Statistics -->
              
             <div class="col-lg-6" >
                  <div class="articles card">
                    <div class="card-header d-flex align-items-center" >
                      <h2 class="h3">本周最热新闻</h2>
                      <div class="badge badge-rounded bg-green">5条新闻</div>
                    </div>
                    <div class="card-body no-padding">
                     <%
                     SimpleDateFormat sdFormattoday=new SimpleDateFormat("yyyy-MM-dd");
                     Calendar calendartoday=Calendar.getInstance();
                     String etnow=sdFormattoday.format(calendartoday.getTime());
                     calendartoday.add(Calendar.DATE,-7);
                     String stnow=sdFormattoday.format(calendartoday.getTime());
                     List<HotTopic>  tops=  HotTopicDao.loadHot5(stnow,etnow);
                     for(HotTopic ht:tops){
                     %>
                      <div class="item d-flex align-items-center" style="height:70px;">
                        <div class="text"><a href="#">
                            <p style="font-size:1em;margin-top:20px"><%=ht.getTitle()%></p></a>
                            <p style="margin-top:-20px"><small ><%=" 热度："+ht.getHotnum()%></small></p>
                            <p style="margin-top:-40px;margin-left:80px"><small ><%=" 发布时间："+ht.getTime()%></small></p>
                          </div>
                      </div>
                      <%} %>
                    </div>
                  </div>
                </div>
		</div>
      </div>
                <!-- Line Chart            -->
                 <div class="chart col-lg-6 col-12" style="width:1000px">
                  <div  style="width:1000px;height:400px;background-color:#fff;margin-left:370px;margin-top:-435px">
                   <div id="hottopic" style="height: 100%" style="width:1000px"></div> 
                 </div>
                 </div>
         
              
          </section>
        
          <!-- 动态变化图-->
          <section class="client no-padding-top" style="height:400px">
                 <div id="container" style="height: 100%;margin-left:30px;margin-right:30px;background-color:#FBFFFD;margin-top:-10px"></div>
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
       <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
var dataMap = {};
function dataFormatter(obj) {
	var pList = ["行政措施","金融外汇措施","财政税收措施","人事措施","知识产权保护","外资引进","技术引进","执行力度、成果","改进创新","科技建设","科技人物","自然事件","批评类新闻","其他"];
    var temp;
    for (var year = 2002; year <= 2006; year++) {
        var max = 0;
        var sum = 0;
        temp = obj[year];
        for (var i = 0, l = temp.length; i < l; i++) {
            max = Math.max(max, temp[i]);
            sum += temp[i];
            obj[year][i] = {
                name : pList[i],
                value : temp[i]
            }
        }
        obj[year + 'max'] = Math.floor(max / 100) * 100;
        obj[year + 'sum'] = sum;
    }
    return obj;
}
dataMap.dataPI = dataFormatter({
	//积极
    2006:[36,59,35,41,26,15,17,17,14,14,18,21,11,13],
    2005:[24,45,36,55,10,16,10,22,14,24,16,17,13,12],
    2004:[18,14,20,47,33,41,28,15,13,11,16,45,18,19],
    2003:[12,22,23,13,27,22,62,18,11,21,19,14,15,16],
    2002:[11,11,18,21,16,13,17,21,11,18,18,12,10,19]	
});
dataMap.dataSI = dataFormatter({
	 //中等
   2006:[22,24,25,17,27,19,17,7,9,11,18,13,11,15],
    2005:[11,10,18,11,22,13,28,21,21,28,18,12,10,9],
    2004:[12,14,15,19,17,29,17,24,29,21,28,23,14,15],
    2003:[18,14,1,27,23,22,28,25,13,21,16,25,18,19],
    2002:[16,19,25,24,16,19,15,17,12,14,18,22,21,19]
});

dataMap.dataTI = dataFormatter({
	//积极
    2006:[36,59,35,41,26,15,17,17,14,14,18,21,11,13],
    2005:[11,10,18,11,22,13,28,21,21,28,18,12,10,9],
    2004:[18,14,20,47,33,41,28,15,13,11,16,45,18,19],
    2003:[18,14,1,27,23,22,28,25,13,21,16,25,18,19],
    2002:[11,11,18,21,16,13,17,21,11,18,18,12,10,19]
});




option = {
    baseOption: {
        timeline: {
            // y: 0,
            axisType: 'category',
            // realtime: false,
            // loop: false,
            autoPlay: true,
            // currentIndex: 2,
            playInterval: 1000,
            // controlStyle: {
            //     position: 'left'
            // },
            data: [
            	<%for(int i=0;i<=4;i++){
            		SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
                    Calendar calendar=Calendar.getInstance();
                   // System.out.println("当前系统时间: "+sdFormat.format(calendar.getTime()));
                    calendar.add(Calendar.DATE,-i);
	               // System.out.println("减少1天的时间是：: "+sdFormat.format(calendar.getTime()));
            	   String time="";
            	   time="'"+sdFormat.format(calendar.getTime())+"'";
            	   //System.out.println(time);
            	%>
                {
                    value:<%=time%>,
                    tooltip: {
                        formatter: '{b} 新闻条数达到一个高度'
                    },
                    symbol: 'diamond',
                    symbolSize: 16
                },
               <%}%>
            ],
            label: {
                formatter : function(s) {
                    return s;
                }
            }
        },
        title: {
            subtext: '近期新闻情感趋势'
        },
        tooltip: {
        },
        legend: {
            x: 900,
            data: ['积极', '中等', '消极'],

        },
        calculable : true,
        grid: {
            top: 120,
            bottom: 120,
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true,
                        formatter: function (params) {
                            return params.value.replace('\n', '');
                        }
                    }
                }
            }
        },
        xAxis: [
            {
                'type':'category',
                'axisLabel':{'interval':0},
                'data':[
                	"行政措施","金融外汇措施","财政税收措施","人事措施","知识产权保护","外资引进","技术引进","执行力度、成果","改进创新","科技建设","科技人物","自然事件","批评类新闻","其他"
                ],
                splitLine: {show: false}
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '新闻条数'
            }
        ],
        series: [
            {name: '积极', type: 'bar'},
            {name: '中等', type: 'bar'},
            {name: '消极', type: 'bar'},
            {
                name: '新闻条数占比',
                type: 'pie',
                center: ['85%', '22%'],
                radius: '28%',
                z: 100
            }
        ]
    },
    <%

	   SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
	   Calendar calendar=Calendar.getInstance();
	//   System.out.println("当前系统时间: "+sdFormat.format(calendar.getTime()));
	   calendar.add(Calendar.DATE,-1);
	   //System.out.println("减少1天的时间是：: "+sdFormat.format(calendar.getTime()));
	  String time=sdFormat.format(calendar.getTime())+"新闻情感趋势汇总";   
	   calendar.add(Calendar.DATE,-1);
	 //  System.out.println("减少2天的时间是：: "+sdFormat.format(calendar.getTime()));
	  String time2=sdFormat.format(calendar.getTime())+"新闻情感趋势汇总";   
	   calendar.add(Calendar.DATE,-1);
	//   System.out.println("减少3天的时间是：: "+sdFormat.format(calendar.getTime()));
	  String time3=sdFormat.format(calendar.getTime())+"新闻情感趋势汇总";   
	   calendar.add(Calendar.DATE,-1);
	//   System.out.println("减少4天的时间是：: "+sdFormat.format(calendar.getTime()));
	  String time4=sdFormat.format(calendar.getTime())+"新闻情感趋势汇总";   
	   calendar.add(Calendar.DATE,-1);
	 //  System.out.println("减少5天的时间是：: "+sdFormat.format(calendar.getTime()));
	  String time5=sdFormat.format(calendar.getTime())+"新闻情感趋势汇总";   

    
    %>

    options: [
        {
            title: {text:"<%=time%>"},
            series: [  
                {data: dataMap.dataPI['2002']},
                {data: dataMap.dataSI['2002']},
                {data: dataMap.dataTI['2002']},
                {data: [
                    {name: '积极', value: dataMap.dataPI['2002sum']},
                    {name: '中等', value: dataMap.dataSI['2002sum']},
                    {name: '消极', value: dataMap.dataTI['2002sum']}
                ]}
            ]
        },
        {
        	
            title : {text:"<%=time2%>"},
            series : [
                
                {data: dataMap.dataPI['2003']},
                {data: dataMap.dataSI['2003']},
                {data: dataMap.dataTI['2003']},
                {data: [
                    {name: '积极', value: dataMap.dataPI['2003sum']},
                    {name: '中等', value: dataMap.dataSI['2003sum']},
                    {name: '消极', value: dataMap.dataTI['2003sum']}
                ]}
            ]
        },
        {
            title : {text: "<%=time3%>"},
            series : [
              
                {data: dataMap.dataPI['2004']},
                {data: dataMap.dataSI['2004']},
                {data: dataMap.dataTI['2004']},
                {data: [
                    {name: '积极', value: dataMap.dataPI['2004sum']},
                    {name: '中等', value: dataMap.dataSI['2004sum']},
                    {name: '消极', value: dataMap.dataTI['2004sum']}
                ]}
            ]
        },
        {
            title : {text: "<%=time4%>"},
            series : [
               
                {data: dataMap.dataPI['2005']},
                {data: dataMap.dataSI['2005']},
                {data: dataMap.dataTI['2005']},
                {data: [
                    {name: '积极', value: dataMap.dataPI['2005sum']},
                    {name: '中等', value: dataMap.dataSI['2005sum']},
                    {name: '消极', value: dataMap.dataTI['2005sum']}
                ]}
            ]
        },
        {
            title : {text: "<%=time5%>"},
            series : [
               
                {data: dataMap.dataPI['2006']},
                {data: dataMap.dataSI['2006']},
                {data: dataMap.dataTI['2006']},
                {data: [
                    {name: '积极', value: dataMap.dataPI['2006sum']},
                    {name: '中等', value: dataMap.dataSI['2006sum']},
                    {name: '消极', value: dataMap.dataTI['2006sum']}
                ]}
            ]
        },

    ]
};;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>


  </body>
</html>
<!-- 本周趋势 -->
         <%
       SimpleDateFormat sdFormat1=new SimpleDateFormat("yyyy-MM-dd");
       Calendar calendar1=Calendar.getInstance();
       String et=sdFormat1.format(calendar1.getTime());
       String st="";
       //System.out.println("当前系统时间: "+sdFormat1.format(calendar1.getTime()));//计算时间
       %>

<script type="text/javascript">
var dom = document.getElementById("hottopic");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
		
    title: {
        text: '热点话题趋势变化'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['热点新闻1','热点新闻2','热点新闻3','热点新闻4','热点新闻5']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        
        data:[
			<%
			String[]allTime=new String[7];
			 calendar1.add(Calendar.DATE,-7);//先减少7天开始算
			 st=sdFormat1.format(calendar1.getTime());
			  for(int i=0;i<6;i++){
			       calendar1.add(Calendar.DATE,+1);
			       allTime[i]=sdFormat1.format(calendar1.getTime());
			     //  System.out.println("减少1天的时间是：: "+sdFormat.format(calendar.getTime()));
			      %>
			      '<%=sdFormat1.format(calendar1.getTime())%>',
			      <% }
			      calendar1.add(Calendar.DATE,+1);
			      allTime[6]=sdFormat1.format(calendar1.getTime());
			%>
			'<%=sdFormat1.format(calendar1.getTime())%>']
    },
    yAxis: {
        type: 'value'
    },
    series: [
    	<%
    	String []datas=new String[]{"热点新闻1","热点新闻2","热点新闻3","热点新闻4","热点新闻5"};
    	List<HotTopic> htopics=HotTopicDao.loadHot5(st,et);
    	int dt=0;//用来控制
    	for(HotTopic ht:htopics)
    	{
    	%>
    	  {
	            name:'<%=datas[dt]%>',
	            type:'line',
	            stack: '<%="热度"+dt%>',
	            smooth:true,
	            areaStyle: {normal: {}},
	            data:[
    		<%
    			
		    	String []res=cutTime.cuttime(ht.getTimehot());
				String []timeGets=new String[res.length];
				String []num=new String[res.length];
				for(int i=0;i<res.length;i++)
				{
					String []spiltRes=res[i].split("\t");
					timeGets[i]=spiltRes[0];
					num[i]=spiltRes[1];//截取出来的时间以及对应的数量
				}
				String []allNum=new String[]{"0","0","0","0","0","0","0"};//叠加的所有
				
			    for(int m=0;m<res.length;m++)
			    {
			    	for(int i=0;i<7;i++)
					{
			    		 if(allTime[i].equals(timeGets[m])&&allNum[i]=="0")
			    			 allNum[i]=num[m];
					}//对应日期之间 数量的赋值
			    }
				for(int i=0;i<7;i++)
				{	
					if(ht.getTime().contains(allTime[i]))
					{
						int a=Integer.parseInt(allNum[i])+Integer.parseInt(ht.getHotnum());
						allNum[i]=a+"";//将最火的新闻出来那一天的数量与与他类似新闻数量叠加
					}
					// System.out.println(ht.getTime()+"新闻日期是，热度是："+ht.getHotnum());
					// System.out.println(allTime[i]+"的热度是："+allNum[i]);
					// System.out.println("---------------------------------------------------------------");
				%>
						'<%=allNum[i]%>',
		<%}%>
    			]
	        },
	        <%dt++;
	     }%>
      
    ]
};
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
</script>
<!-- 近一个月热门事件 -->
      	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="Picture/echarts.min.js"></script>
		<script src="Picture/dataTool.js"></script>
		
				<%
		SimpleDateFormat sdFormat2=new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar2=Calendar.getInstance();
        String now=sdFormat2.format(calendar2.getTime());
        calendar2.add(Calendar.DATE,-29);
        String st2=sdFormat2.format(calendar2.getTime());//开始时间
    	String et2=sdFormat2.format(calendar2.getTime());//结束时间   	 
        String [] news1=new String[30];
        String [] news2=new String[30];
        String [] news3=new String[30];
        String [] news4=new String[30];
        String [] news5=new String[30];
        String max="select * from wynews where time between '"+st2+"' and '"+now+"' order by CONVERT(hotnum,SIGNED) desc limit 1";
        List<WYNews> maxNum=WYNewsDaoImpl.load(max);
        int day=0;
        for(int i=0;i<30;i++){
        	 st2=et2;
       	  	 calendar2.add(Calendar.DATE,+1);
       	 	 et2=sdFormat2.format(calendar2.getTime());//上一次的结束时间是下一次的开始时间
        	List<WYNews> wysTime=WYNewsDaoImpl.loadTimeEveryDay(st2, et2);
        	for(int j=0;j<wysTime.size();j++)
        	{
        		if(j%5==0)
        			news1[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"\'";
        		else if(j%5==1)
        			news2[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'";
        		else if(j%5==2)
        			news3[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'";
        		else if(j%5==3)
        			news4[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'";
        		else if(j%5==4)
        			news5[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'"; 
        	}
        }
		%>
		
<script type="text/javascript">
			var dom = document.getElementById("HotThing");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			var dataBJ = [
			 	<%for(int i=0;i<30;i++){
			 	if(news1[i]!=null){%>
			    [<%=news1[i]%>],
			    <%}}%> 
			];
			
			var dataGZ = [
		<%for(int i=0;i<30;i++){
		if(news2[i]!=null){%>
			    [<%=news2[i]%>],
			    <%}}%>  
			];
			
			var dataSH = [
				<%for(int i=0;i<30;i++){
				if(news3[i]!=null){%>
			    [<%=news3[i]%>],
			    <%}}%> 
			];
			var dataS4 = [
				<%for(int i=0;i<30;i++){
				if(news4[i]!=null){%>
					    [<%=news4[i]%>],
					    <%}}%>  
					];
					
					var dataG5 = [
						<%for(int i=0;i<30;i++){
						if(news5[i]!=null){%>
					    [<%=news5[i]%>],
					    <%}}%> 
					];
			var schema = [
			    {name: 'date', index: 0, text: '日'},
			    {name: 'AQIindex', index: 1, text: '热度'},
			];
			
			
			var itemStyle = {
			    normal: {
			        opacity: 0.8,
			        shadowBlur: 10,
			        shadowOffsetX: 0,
			        shadowOffsetY: 0,
			        shadowColor: 'rgba(0, 0, 0, 0.5)'
			    }
			};
			
			option = {
			    backgroundColor: '#404a59',
			    color: [
			        '#dd4444', '#fec42c', '#0e62c7','#7a1b78','#407739'
			    ],
			    legend: {
			        y: 'top',
			        data: ['今日话题Top1', '今日话题Top2', '今日话题Top3', '今日话题Top4', '今日话题Top5'],
			        textStyle: {
			            color: '#fff',
			            fontSize: 16
			        }
			    },
			    grid: {
			        x: '10%',
			        x2: 150,
			        y: '18%',
			        y2: '10%'
			    },
			    tooltip: {
			        padding: 10,
			        backgroundColor: '#222',
			        borderColor: '#777',
			        borderWidth: 1,
			        formatter: function (obj) {
			            var value = obj.value;
			            return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
			                + obj.seriesName + '   ' + value[0] + '日    '
			                + schema[1].text + '：' + value[1]
			                + '</div>'
			                + value[3] + '<br>';
			        }
			    },
			    xAxis: {
			        type: 'category',
			        name: '日期',
			        nameGap: 16,
			        nameTextStyle: {
			            color: '#fff',
			            fontSize: 14
			        },
			        max:30,//设置日期最大
			        splitLine: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#eee'
			            }
			        },
			    },
			    yAxis: {
			    	max:<%=maxNum.get(0).getHotnum()%>,
			    	min:100,
			    	 splitNumber :10,
			        type: 'value',
			        name: '事件热度',
			        nameLocation: 'end',
			        nameGap: 30,
			        nameTextStyle: {
			            color: '#fff',
			            fontSize: 16
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#eee'
			            }
			        },
			        splitLine: {
			            show: false
			        }
			    },
			    visualMap: [
			        {
			            left: 'right',
			            top: '10%',
			            dimension: 2,
			            min: 0,
			            max: 5000,//圆形大小
			            itemWidth: 30,
			            itemHeight: 120,
			            calculable: true,
			            precision: 0.1,
			            text: ['圆形大小：热度'],
			            textGap: 30,
			            textStyle: {
			                color: '#fff'
			            },
			            inRange: {
			                symbolSize: [10, 70]
			            },
			            outOfRange: {
			                symbolSize: [10, 70],
			                color: ['rgba(255,255,255,.2)']
			            },
			            controller: {
			                inRange: {
			                    color: ['#c23531']
			                },
			                outOfRange: {
			                    color: ['#444']
			                }
			            }
			        },
			        {
			            left: 'right',
			            bottom: '5%',
			            dimension: 2,
			            min: 0,
			            max: 4000,//颜色深浅
			            itemHeight: 120,
			            calculable: true,
			            precision: 0.1,
			            text: ['明暗：热度'],
			            textGap: 30,
			            textStyle: {
			                color: '#fff'
			            },
			            inRange: {
			                colorLightness: [1, 0.5]
			            },
			            outOfRange: {
			                color: ['rgba(255,255,255,.2)']
			            },
			            controller: {
			                inRange: {
			                    color: ['#c23531']
			                },
			                outOfRange: {
			                    color: ['#444']
			                }
			            }
			        }
			    ],
			    series: [

			        {
			            name: '今日话题Top1',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataBJ,
			        }, 
			        {
			            name: '今日话题Top2',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataSH
			        },
			        {
			            name: '今日话题Top3',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataGZ
			        }, 
			        {
			            name: '今日话题Top4',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataS4
			        },
			        {
			            name: '今日话题Top5',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataG5
			        }
			
			    ]
			};;
			myChart.on("click", function (param){  
		      	  var name=param.value;
		      	  alert(name)
		      	window.location.href="News.jsp?title="+name;
		      });
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
</script>
<!-- 积极 -->
    <script src="echarts.js"></script>
<script type="text/javascript">
        //柱状图
        var asd =document.getElementById('ji');
        var pieChart = echarts.init(asd);
        var labelTop = {//上层样式
            normal : {
                color :'#0099cc',
                label : {
                    show : true,
                    position : 'center',
                    formatter : '{b}',
                    textStyle: {
                        baseline : 'bottom',
                        fontSize:26
                    }
                },
                labelLine : {
                    show : false
                }
            }
        };
        var labelFromatter = {//环内样式
            normal : {//默认样式
                label : {//标签
                    formatter : function (a,b,c){return 100 - c + '%'},
                    // labelLine.length：30,  //线长，从外边缘起计算，可为负值
                    textStyle: {//标签文本样式
                        color:'black',
                        align :'center',
                        baseline : 'top'//垂直对其方式
                    }
                }
            },
        };
        var labelBottom = {//底层样式
            normal : {
                color: '#d6e0eb',
                label : {
                    show : true,
                    position : 'center',
                    fontSize:22
                },
                labelLine : {
                    show : false
                }
            },
            emphasis: {//悬浮式样式
                color: 'rgba( 0,0,0,0)'
            }
        };
        var radius = [60,72];// 半径[内半径，外半径]

        var pieChartOption = {
            title : {
                text: '',
                subtext: '',
                x:'center',
                //正标题样式
                textStyle: {
                    fontSize:44,
                    fontFamily:'Arial',
                    fontWeight:100,
                    //color:'#1a4eb0',
                },
                //副标题样式
                subtextStyle: {
                    fontSize:28,
                    fontFamily:'Arial',
                    color:"#1a4eb0",
                },
            },
            animation:false,
            tooltip : {         // 提示框. Can be overwrited by series or data
                trigger: 'axis',
                //show: true,   //default true
                showDelay: 0,
                hideDelay: 50,
                transitionDuration:0,
                borderRadius : 8,
                borderWidth: 2,
                padding: 10,    // [5, 10, 15, 20]
            },
            series : [
                {
                    type : 'pie',
                    center : ['50%', '70%'],//圆心坐标（div中的%比例）
                    radius : radius,//半径
                    x: '0%', // for funnel
                    itemStyle : labelTop,//graphStyleA,//图形样式 // 当查到的数据不存在（并非为0），此属性隐藏
                    data : [
                    	<%
                    	String bai=(((double)emotions.get(0).getCount()/(double)sumEmotion)*100+"");
                    	if(bai.length()>5)
                    		bai=bai.substring(0,5);
                    	//System.out.println(bai);
                    	double duo=100-Double.valueOf(bai);
                    	//System.out.println(duo);
                    	%>
                        {name:'<%=emotions.get(0).getEmotion()%>\n', value:<%=bai%>,itemStyle : labelTop},
                        {name:'\n<%=bai%>%', value:<%=duo%>, itemStyle : labelBottom}
                    ]
                }
            ]
        };
        pieChart.setOption(pieChartOption);
</script>
<!--中性 -->
    <script src="echarts.js"></script>
<script type="text/javascript">
        //柱状图
        var asd =document.getElementById('zhong');
        var pieChart = echarts.init(asd);
        var labelTop = {//上层样式
            normal : {
                color :'#ff9d3c',
                label : {
                    show : true,
                    position : 'center',
                    formatter : '{b}',
                    textStyle: {
                        baseline : 'bottom',
                        fontSize:26
                    }
                },
                labelLine : {
                    show : false
                }
            }
        };
        var labelFromatter = {//环内样式
            normal : {//默认样式
                label : {//标签
                    formatter : function (a,b,c){return 100 - c + '%'},
                    // labelLine.length：30,  //线长，从外边缘起计算，可为负值
                    textStyle: {//标签文本样式
                        color:'black',
                        align :'center',
                        baseline : 'top'//垂直对其方式
                    }
                }
            },
        };
        var labelBottom = {//底层样式
            normal : {
                color: '#ffdab5',
                label : {
                    show : true,
                    position : 'center',
                    fontSize:22
                },
                labelLine : {
                    show : false
                }
            },
            emphasis: {//悬浮式样式
                color: 'rgba( 0,0,0,0)'
            }
        };
        var radius = [60,72];// 半径[内半径，外半径]

        var pieChartOption = {
            title : {
                text: '',
                subtext: '',
                x:'center',
                //正标题样式
                textStyle: {
                    fontSize:44,
                    fontFamily:'Arial',
                    fontWeight:100,
                    //color:'#1a4eb0',
                },
                //副标题样式
                subtextStyle: {
                    fontSize:28,
                    fontFamily:'Arial',
                    color:"#1a4eb0",
                },
            },
            animation:false,
            tooltip : {         // 提示框. Can be overwrited by series or data
                trigger: 'axis',
                //show: true,   //default true
                showDelay: 0,
                hideDelay: 50,
                transitionDuration:0,
                borderRadius : 8,
                borderWidth: 2,
                padding: 10,    // [5, 10, 15, 20]
            },
            series : [
                {
                    type : 'pie',
                    center : ['50%', '70%'],//圆心坐标（div中的%比例）
                    radius : radius,//半径
                    x: '0%', // for funnel
                    itemStyle : labelTop,//graphStyleA,//图形样式 // 当查到的数据不存在（并非为0），此属性隐藏
                    data : [
                    	<%
                    	bai=(((double)emotions.get(1).getCount()/(double)sumEmotion)*100+"");
                    	if(bai.length()>5)
                    		bai=bai.substring(0,5);
                    	System.out.println("地点");
                    	 duo=100-Double.valueOf(bai);
                    	//System.out.println(duo);
                    	%>
                        {name:'<%=emotions.get(1).getEmotion()%>\n', value:<%=bai%>,itemStyle : labelTop},
                        {name:'\n<%=bai%>%', value:<%=duo%>, itemStyle : labelBottom}
                    ]
                }
            ]
        };
        pieChart.setOption(pieChartOption);
</script>
<!--中性 -->
    <script src="echarts.js"></script>
<script type="text/javascript">
        //柱状图
        var asd =document.getElementById('xiao');
        var pieChart = echarts.init(asd);
        var labelTop = {//上层样式
            normal : {
                color :'#369f33',
                label : {
                    show : true,
                    position : 'center',
                    formatter : '{b}',
                    textStyle: {
                        baseline : 'bottom',
                        fontSize:26
                    }
                },
                labelLine : {
                    show : false
                }
            }
        };
        var labelFromatter = {//环内样式
            normal : {//默认样式
                label : {//标签
                    formatter : function (a,b,c){return 100 - c + '%'},
                    // labelLine.length：30,  //线长，从外边缘起计算，可为负值
                    textStyle: {//标签文本样式
                        color:'black',
                        align :'center',
                        baseline : 'top'//垂直对其方式
                    }
                }
            },
        };
        var labelBottom = {//底层样式
            normal : {
                color: '#b3e3c0',
                label : {
                    show : true,
                    position : 'center',
                    fontSize:22
                },
                labelLine : {
                    show : false
                }
            },
            emphasis: {//悬浮式样式
                color: 'rgba( 0,0,0,0)'
            }
        };
        var radius = [60,72];// 半径[内半径，外半径]

        var pieChartOption = {
            title : {
                text: '',
                subtext: '',
                x:'center',
                //正标题样式
                textStyle: {
                    fontSize:44,
                    fontFamily:'Arial',
                    fontWeight:100,
                    //color:'#1a4eb0',
                },
                //副标题样式
                subtextStyle: {
                    fontSize:28,
                    fontFamily:'Arial',
                    color:"#1a4eb0",
                },
            },
            animation:false,
            tooltip : {         // 提示框. Can be overwrited by series or data
                trigger: 'axis',
                //show: true,   //default true
                showDelay: 0,
                hideDelay: 50,
                transitionDuration:0,
                borderRadius : 8,
                borderWidth: 2,
                padding: 10,    // [5, 10, 15, 20]
            },
            series : [
                {
                    type : 'pie',
                    center : ['50%', '70%'],//圆心坐标（div中的%比例）
                    radius : radius,//半径
                    x: '0%', // for funnel
                    itemStyle : labelTop,//graphStyleA,//图形样式 // 当查到的数据不存在（并非为0），此属性隐藏
                    data : [
                    	<%
                    	 bai=(((double)emotions.get(2).getCount()/(double)sumEmotion)*100+"");
                    	if(bai.length()>5)
                    		bai=bai.substring(0,5);
                    	//System.out.println(bai);
                    	 duo=100-Double.valueOf(bai);
                    	//System.out.println(duo);
                    	%>
                        {name:'<%=emotions.get(2).getEmotion()%>\n', value:<%=bai%>,itemStyle : labelTop},
                        {name:'\n<%=bai%>%', value:<%=duo%>, itemStyle : labelBottom}
                    ]
                }
            ]
        };
        pieChart.setOption(pieChartOption);
</script>
<!-- 新闻数量 -->
<%
List<WYNews> wyDays=WYNewsDaoImpl.loadTimeNumDay(stTime,etTime);
%>
       <script type="text/javascript">
var dom = document.getElementById("tian");
var myChart = echarts.init(dom);
var app = {};
option = null;
var dataAxis = [
	<%for(WYNews wyd:wyDays){%>
	'<%=wyd.getTime().substring(5)%>',
	<%}%>];
var data = [220, 182, 191, 234, 290, 330, 310, 123];
var yMax = 500;
var dataShadow = [];

for (var i = 0; i < data.length; i++) {
    dataShadow.push(yMax);
}

option = {
    title: {
        text: '近一周新闻量趋势',
        subtext: '年份：<%=wyDays.get(0).getTime().substring(0,4)%>'
    },
    xAxis: {
        data: dataAxis,
        axisLabel: {
            inside: true,
            textStyle: {
                color: '#fff'
            }
        },
        axisTick: {
            show: false
        },
        axisLine: {
            show: false
        },
        z: 10
    },
    yAxis: {
        axisLine: {
            show: false
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            textStyle: {
                color: '#999'
            }
        }
    },
    dataZoom: [
        {
            type: 'inside'
        }
    ],
    series: [
        { // For shadow
            type: 'bar',
            itemStyle: {
                normal: {color: 'rgba(0,0,0,0.05)'}
            },
            barGap:'-100%',
            barCategoryGap:'40%',
            data: dataShadow,
            animation: false
        },
        {
            type: 'bar',
            itemStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#83bff6'},
                            {offset: 0.5, color: '#188df0'},
                            {offset: 1, color: '#188df0'}
                        ]
                    )
                },
                emphasis: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#2378f7'},
                            {offset: 0.7, color: '#2378f7'},
                            {offset: 1, color: '#83bff6'}
                        ]
                    )
                }
            },
            data: data
        }
    ]
};

// Enable data zoom when user click bar.
var zoomSize = 6;
myChart.on('click', function (params) {
    console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
    myChart.dispatchAction({
        type: 'dataZoom',
        startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
        endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
    });
});;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>