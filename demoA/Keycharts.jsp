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
<title>具体主题词监控</title>
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
          <!-- Page Header-->

          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">首页</a></li>
              <li class="breadcrumb-item active">主题词监控</li>
            </ul>
          </div>
          <%
         	request.setCharacterEncoding("UTF-8");
      		String keyword="互联网";
      		keyword = request.getParameter("key");//关键字
      		String ci = request.getParameter("ci");//次关键字
			String guolv= request.getParameter("guolv");//过滤词  
			Inkeyword keyNew=KeyDao.loaddan(keyword, ci, guolv,userget.getUsername() );//获取监测词的所有信息进行大查询 
			
			//查询爆发高点
			List<WYNews> wyHigh=WYNewsDaoImpl.loadMainGroup(keyword, ci, guolv, keyNew.getHowlong(), keyNew.getLocationKey(),keyNew.getLocationCi(),"count(time)","desc");
			//查询事件起点
			List<WYNews> wystart=WYNewsDaoImpl.loadMainGroup(keyword, ci, guolv, keyNew.getHowlong(), keyNew.getLocationKey(),keyNew.getLocationCi(),"time","asc");
			String startNew="",high="";
			if(wyHigh.size()==0)
			{
				startNew="暂无相关信息";
				high="暂无相关信息";		
			}
			else
			{
				startNew=wystart.get(0).getTime() ;
				high=wyHigh.get(0).getTime()+"\n"+"("+wyHigh.get( 0).getCount()+")篇报道";
		//	System.out.println(high+"demo");
			}
			String tmpSQL="select count(*) from wynews where (title like '%"+keyword+"%'  or con like '%"+keyword+"%') and  (title like '%"+ci+"%'  or con like '%"+ci+"%')  ";
			String tmpSQLHot="select sum(hotnum) from wynews where (title like '%"+keyword+"%'  or con like '%"+keyword+"%') and  (title like '%"+ci+"%'  or con like '%"+ci+"%')  ";
			if(guolv!=null &&!guolv.equals(""))
			{	
				tmpSQL+="  and  (title not like '%"+guolv+"%'  or con not  like '%"+guolv+"%')";
				tmpSQLHot+="  and  (title not like '%"+guolv+"%'  or con not  like '%"+guolv+"%')";
			}
			String all=tmpSQL+"&&"+tmpSQLHot;
			session.setAttribute("sql", all);//将接收到的地点传过去
			//session.setAttribute("sql", tmpSQL);//将接收到的地点传过去
			%>
          <!-- Charts Section-->
             <div><a href="#zuhe"   data-toggle="modal"    style="margin-top:55px;margin-left:50px">查看组合</a></div>
          <section class="charts">
            <div class="container-fluid" style="margin-left:-10px">
            <div style="width:1380px;height:150px;background-color:#fff;margin-top:-90px"></div>
            <div><h3 style="margin-left:650px;margin-top:-135px"><%=keyword %></h3></div>
            <hr style="width:1370px;margin-left:-8px">
            <div><h3 style="margin-left:80px;">源发时间</h3></div>
            <div><h2 style="margin-left:60px;color:red"><%=startNew%></h2></div>
            <div><h3 style="margin-left:650px;margin-top:-40px">-----》</h3></div>
            <div><h3 style="margin-left:1200px;margin-top:-50px">爆发高点</h3></div>
            <div><h3 style="margin-left:1155px;color:red"><%=high %></h3></div>
            
            <!-- 查看组合弹窗-->
             <div aria-hidden="true" role="dialog" tabindex="-1" id="zuhe" class="modal fade">
                              <div class="modal-dialog">
                                <div class="modal-content text-left" style="margin-top:200px;width:370px;height:350px;margin-left:50px">
                                  <div  style="background-color:#8285fd;height:50px">
                                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button"><i class="ti-close"></i></button>
                                    <h4 class="modal-title" style="color:#fff;margin-top:10px;margin-left:15px"> 组合主题词</h4>
                                  </div>
                                  <div class="modal-body">
                                    <p><%=ci %></p>
                                  </div>
                                </div>
                              </div>
                            </div>

              <div class="row" style="margin-top:40px">
                <!-- 点图-->
                <div class="col-lg-8">
                  <div class="line-chart-example card" style="width:1380px">
                    <div class="card-close">
                    </div>
                    <div class="card-header d-flex align-items-center" >
                      <h3 class="h4">相关人物、机构、行为关联图</h3>
                    </div>
                    <div class="card-body">
                     <div id="mainAll" style="width: 1304px;height:764px;">      
                    </div>
                  </div>
                </div>
                   <!-- 地图-->
                 <div class="col-lg-8" style="margin-top:20px;margin-left:-13px">
                  <div style="width:1377px;height:450px;background-color:#fff">
                    <div class="card-header d-flex align-items-center" >
                      <h3 class="h4">相关区域分布走势</h3>
                      <h3 class="h4" style="margin-left:1080px"><a href="map.jsp">查看具体分布</a></h3>
                    </div>				
				   <div class="card-body">
                     <div id="mainMap" style="height:400px;width:1000px;padding:10px;margin-top:-20px;margin-left:-160px"></div>
                   </div>
                     <div id="di" style="height:400px;width:1000px;padding:10px;margin-top:-390px;margin-left:520px"></div>
              
                </div>
                 <!-- 话题趋势分析-->
                <div class="col-lg-6">
                  <div class="radar-chart-example card" style="width:1380px;height:650px;margin-left:-14px;margin-top:20px">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4"><%=keyword%>/话题趋势</h3>
                    </div>
                     <div class="card-body">
 						 <div id="zhuQu" style="height:600px;width:100%;margin-top:-50px"></div>
 				 </div>
                  </div>
                </div>
                
                <!-- Pie Chart -->
                <div class="col-lg-6">
                  <div class="pie-chart-example card" style="width:1370px;margin-left:-10px">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">事件信息(当前监测范围：</h3><h5  style="color:red"><%=keyNew.getHowlong() %></h5><h3>)</h3>
                    </div>
                       <%
                       request.setCharacterEncoding("UTF-8");
                       String []mei=new String[6];
                       mei[0]= request.getParameter("tx");//腾讯
                       mei[1] = request.getParameter("wy");//网易
                       mei[2] = request.getParameter("tou");//头条
                       mei[3] = request.getParameter("wy");//souhu
                       mei[4] = request.getParameter("renm");//人民日报
                       mei[5] = request.getParameter("qi");//人民日报
                      
                       String emotion = request.getParameter("emotion");//情感
                      // System.out.println(emotion+"输出");
                       String start= request.getParameter("start");//开始时间
                       String end= request.getParameter("end");//结束时间
                  
                       //对情感判空
                       if(emotion==null)
                    	   emotion="";
                       //对时间判空
                       if(start == null || "".equals(start ))
                      		start = "";
                       if(end == null || "".equals(end ))
                      		end = "";
                       
                          	//分页的条件
          					int pageIndex = 1;
          					int pageSize =5;
          					int id=1;
          					if(request.getParameter("pageIndex")!=null&&request.getParameter("pageIndex")!="")
          					pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
          				    Pager pager=WYNewsDaoImpl.loadZhuti(mei, emotion, start, end, keyNew.getHowlong(), keyword,pageIndex,pageSize);
          				   List<WYNews> wynews=pager.getDatas();
                             %>
                       <form action="Keycharts.jsp" method="post" class="pull-right position">
                       <input type="hidden"  name="key" value=<%=keyword %>>
                       <input type="hidden"  name="ci" value=<%=ci %>>
                       <input type="hidden"  name="guolv" value=<%=guolv %>>
                      <div class="card-header d-flex align-items-center">
                      <h5 class="h5" style="margin-left:20px">媒体类型</h5>
                      <input id="tx" name="tx" type="checkbox" value="腾讯网" style="margin-left:40px"> 腾讯网
                      <input id="wy" name="wy" type="checkbox" value="网易科技报道" style="margin-left:60px"> 网易新闻
                      <input id="tou" name="tou" type="checkbox" value=" 今日头条" style="margin-left:60px"> 今日头条
                      <input id="sou" name="sou" type="checkbox" value="搜狐" style="margin-left:60px"> 搜狐
                      <input id="renm" name="renm" type="checkbox" value="人民网-人民日报" style="margin-left:60px"> 人民网-人民日报
                       <input id="qi" name="qi" type="checkbox" value="其他" style="margin-left:60px"> 其他
                    </div>
                     <div class="card-header d-flex align-items-center">
                      <h5 class="h5" style="margin-left:20px">情感类别</h5>
                      <input id="ji" name="emotion"  type="radio" value="积极" style="margin-left:40px"> 正面积极
                      <input id="mid" name="emotion"  type="radio" value="中等" style="margin-left:60px"> 中性
                      <input id="xiao" name="emotion"   type="radio" value="消极" style="margin-left:60px"> 负面消极
                    </div>
                     <div class="card-header d-flex align-items-center">
                      <h5 class="h5" style="margin-left:20px">日期限定</h5>
                      <input id="start" name="start"  type="date" value="" style="margin-left:60px;width:100px"> <p style="margin-left:40px;margin-top:15px">至</p>
                      <input id="end" name="end"  type="date" value="" style="margin-left:60px;width:100px"> 
                      <button class="btn btn-primary" type="submit" style="width:200px;height:50px;margin-left:600px;margin-top:60px">查找</button>
                  </div>
                   <div class="card-header d-flex align-items-center" style="height:10px">
                     <h5>文章信息如下</h5>
                    </div>
			</form>
                      <div class="table-responsive">
                            <table class="table table-inbox table-hover table-responsive" border="1"  >    
                                <% for(WYNews key:wynews){ %>
                                <tr >
                                  <td >
                                    <input type="checkbox" class="mail-checkbox" style="width:20px;text-align:center;margin-top:45px">
                                  </td>
                                  <td class="view-message "  style="width:800px;text-align:left" >
                                   <p ><h3 style="color:blue"><%=key.getTitle()%></h3></p>
                                   <p>摘要：<%=key.getSummary()%></p>
                                  </td>
                                   <td class="view-message "  style="width:200px;text-align:center;">
                                   <p style="margin-top:40px"><img src="image/huo.jpg" style="width:30px;height:30px"><%=key.getTime()%></p>
                                   </td>
                                  <td class="view-message  "  style="width:200px;text-align:center">
                                   <p style="margin-top:40px"><img src="image/time.jpg" style="width:30px;height:30px"><%=key.getHotnum()%></p>
                                  </td>
                                  <td class="view-message "  style="width:100px;text-align:center;"><p style="margin-top:40px"><a href="<%=key.getUrl()%>" >查看</a></p></td>
                                   <td class="view-message "  style="width:100px;text-align:center"><p style="margin-top:40px">
                                   <a   href="New110.jsp?title=<%= key.getTitle()%>"  >加入预警</a></p></td>
                                
                                </tr>
                               <%;id++;} %>                        
                               <!-- 设置分页的页码 -->	
								<tr>
									<td colspan="8" align="center">
										<a href="KeyWords.jsp?pageIndex=1&keyword=<%=""%>">首页</a>
										
										<!-- 如果是第一页的话 , 就不显示 上一页 -->
										<%
											if(pageIndex > 1){
										%>
											<a href="Keycharts.jsp?pageIndex=<%=pageIndex-1 %>&key=<%=keyword%>&ci=<%=ci %>&guolv=<%=guolv%>">上一页</a>
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
												<a href="Keycharts.jsp?pageIndex=<%=i%>&key=<%=keyword%>&ci=<%=ci %>&guolv=<%=guolv%>"><%=i %></a>
										<%
												}
											}	
										%>	
										<%
											if( pageIndex < totalPage){
										%>
											<a href="Keycharts.jsp?pageIndex=<%=pageIndex + 1 %>&key=<%=keyword%>&ci=<%=ci %>&guolv=<%=guolv%>">下一页</a>
										<%
											}
										%>
										<a href="Keycharts.jsp?pageIndex=<%=totalPage%>&key=<%=keyword%>&ci=<%=ci %>&guolv=<%=guolv%>">尾页</a>
									</td>
								</tr>
                               
                            </table>
                          </div>
                    <hr style="margin-top:-17px">
                  </div>
                </div>

            
              </div>
            </div>
          </section>
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
    <script src="js/charts-custom.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>
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
     	               String allword="";
     	              List<WYNews> wynew=WYNewsDaoImpl.load5g("互联网");
     	              for( WYNews user : wynew ){
     	            	allword+= user.getKeywords();
     	              }
     	             String []keys=allword.split(", ");
     	             Random rand = new Random();
     	            //System.out.println("关键字xssssssssssssss"+allword);
     	            allword="";
     				for(int i=0;i<keys.length;i++){
     					 //System.out.println(keys[i]);
     					if(allword.indexOf(keys[i])==-1){
     						allword+=keys[i];
     				%>
     				 {
     					 name: '<%=""+keys[i]+""%>',
     					  value: <%=((rand.nextInt(15)+1))*10%>, 
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
  
    
 <!-- 趋势图 -->
 	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="Picture/echarts.min.js"></script>
		<script src="Picture/dataTool.js"></script>
 <%		
	   String [] data1;
		%>
<script type="text/javascript">
var dom = document.getElementById("zhuQu");
var myChart = echarts.init(dom);
var app = {};
option = null;
var base;
var oneDay = 24 * 3600 * 1000;
var date = [];
var data = [];
<%for (WYNews wy:wystart) 
	{
	if(wy.getTime()!=null){
	data1=wy.getTime().split("-");
%>
     base =new Date(<%=data1[0]%>,<%=data1[1]%>,<%=data1[2]%>);
     var now = new Date(base);
    date.push([now.getFullYear(), now.getMonth() , now.getDate()].join('/'));
    data.push(<%=wy.getCount()%>);
   
<%}}%>
option = {
    tooltip: {
        trigger: 'axis',
        position: function (pt) {
            return [pt[0], '10%'];
        }
    },
    title: {
        left: 'center',
        text: '',
    },
    toolbox: {
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: date
    },
    yAxis: {
        type: 'value',
        boundaryGap: [0, '100%']
    },
    dataZoom: [{
        type: 'inside',
        start: 0,
        end: 10
    }, {
        start: 0,
        end: 10,
        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
        handleSize: '80%',
        handleStyle: {
            color: '#fff',
            shadowBlur: 3,
            shadowColor: 'rgba(0, 0, 0, 0.6)',
            shadowOffsetX: 2,
            shadowOffsetY: 2
        }
    }],
    series: [
        {
            name:'实时数据',
            type:'line',
            smooth:true,
            symbol: 'none',
            sampling: 'average',
            itemStyle: {
                color: 'rgb(255, 70, 131)'
            },
            areaStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgb(255, 158, 68)'
                }, {
                    offset: 1,
                    color: 'rgb(255, 70, 131)'
                }])
            },
            data: data
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
       <!-- 具体大图 -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="Picture/echarts.js"></script>
		<script src="Picture/dataTool.js"></script>    
			<% 
		List<WYNews> wys1=WYNewsDaoImpl.loadMain(keyNew.getKeyword(),keyNew.getCombineKey(),keyNew.getNoContain(), keyNew.getHowlong(), keyNew.getLocationKey(), keyNew.getLocationCi());
		//List<WYNews> wysres=WYNewsDaoImpl.loadMainEmotion();
		String pers="",acts="",oras="",keys1="",loas="";
		for(WYNews wy:wys1)
		{
			pers+=wy.getAboutperson();
			loas+=wy.getAboutloc();
			acts+=wy.getAboutaction();
			oras+=wy.getAboutora();
			keys1+=wy.getKeywords();
			keys1+=", ";
		}
		//System.out.println(acts+"mjh");
	//	String a=resper.substring(beginIndex);
		String []keyRes1=Nums.ciNum(keys1, ",");//主题词
		String []perRes1=Nums.ciNum(pers, "；");//人物
		String[]oraRes1=Nums.ciNum(oras, "；");//机构
		String []actRes1=Nums.ciNum(acts, "；");//行为
		String []loaRes1=Nums.ciNum(loas, "；");//地点
		session.setAttribute("lo", loaRes1);//将接收到的地点传过去
		%>
		  
       <script type="text/javascript">
var dom = document.getElementById("mainAll");
var myChart = echarts.init(dom);
var app = {};
option = null;
myChart.hideLoading();
        categories=[
            {
                "name": "人物",
                "keyword": {},
                "base": "HTMLElement"
            },
            {
                "name": "机构",
                "keyword": {},
                "base": "WebGLRenderingContext"
            },
            {
                "name": "行为措施",
                "keyword": {},
                "base": "SVGElement"
            },
            {
                "name": "主题",
                "keyword": {}
            }
        ],
        nodes=[
        	<%
        	int lenK=0;
        	if(keyRes1.length>10)
        		lenK=10;
        	else
        		lenK=keyRes1.length;
        	for(int i=0;i<lenK;i++)
        	{
        		String sizeK=keyRes1[i].substring(keyRes1[i].indexOf("=")+1,keyRes1[i].length());
        		if(sizeK.equals("1")||sizeK.equals("2"))
        			sizeK=Integer.toString(Integer.parseInt(sizeK)*10);//保证点不能太小
        	   else if(sizeK.equals("3")||sizeK.equals("4")||sizeK.equals("5"))
        				sizeK=Integer.toString(Integer.parseInt(sizeK)*3);//保证点不能太小
        		if(keyRes1[i].substring(0,keyRes1[i].indexOf("=")).length()>1)//主题词10个
        		{
        	%>
		            {
		                name: "<%=keyRes1[i].substring(0,keyRes1[i].indexOf("="))%>",
		                value: 100,
		                category: 3,
		                symbolSize:<%=sizeK%>,
		            },
            <%
        		}
        		else
        			lenK++;
        	}%>
        	<%
        	int lenP=0;
        	if(perRes1.length>100)
        		lenP=100;
        	else
        		lenP=perRes1.length;
        	for(int i=0;i<lenP;i++)//人物 100个
        	{
        		String sizeK=perRes1[i].substring(perRes1[i].indexOf("=")+1,perRes1[i].length());
        		if(sizeK.equals("1")||sizeK.equals("2"))
        			sizeK=Integer.toString(Integer.parseInt(sizeK)*10);//保证点不能太小
        	   else if(sizeK.equals("3")||sizeK.equals("4")||sizeK.equals("5"))
        				sizeK=Integer.toString(Integer.parseInt(sizeK)*3);//保证点不能太小
        		if(Integer.parseInt(sizeK)>20)
        			sizeK=Integer.toString(Integer.parseInt(sizeK)/3);

        		if(perRes1[i].substring(0,perRes1[i].indexOf("=")).length()>1)
        		{
        	%>
		            {
		                name: "<%=perRes1[i].substring(0,perRes1[i].indexOf("="))%>",
		                value: 100,
		                category: 0,
		                symbolSize:<%=sizeK%>,
		            },
            <%
        		}
        	}%>
        	<%
        	int lenO=0;
        	if(oraRes1.length>100)
        		lenO=100;
        	else
        		lenO=oraRes1.length;
        	for(int i=0;i<lenO;i++)//机构
        	{
        		String sizeK=oraRes1[i].substring(oraRes1[i].indexOf("=")+1,oraRes1[i].length());
        		if(sizeK.equals("1")||sizeK.equals("2"))
        			sizeK=Integer.toString(Integer.parseInt(sizeK)*10);//保证点不能太小
        	   else if(sizeK.equals("3")||sizeK.equals("4")||sizeK.equals("5"))
        				sizeK=Integer.toString(Integer.parseInt(sizeK)*3);//保证点不能太小
   				if(Integer.parseInt(sizeK)>20)
           			sizeK=Integer.toString(Integer.parseInt(sizeK)/3);
        		if(oraRes1[i].substring(0,oraRes1[i].indexOf("=")).length()>1)
        		{
        	%>
		            {
		                name: "<%=oraRes1[i].substring(0,oraRes1[i].indexOf("="))%>",
		                value: 100,
		                category: 1,
		                symbolSize:<%=sizeK%>,
		            },
            <%
        		}
        	}%>
        	<%
        	int lenA=0;
        	if(actRes1.length>500)
        		lenA=500;
        	else
        		lenA=actRes1.length;
        	for(int i=0;i<lenA;i++)//行为 前五百个
        	{
        		String sizeK=actRes1[i].substring(actRes1[i].indexOf("=")+1,actRes1[i].length());
       			if(sizeK.equals("1")||sizeK.equals("2"))
           			sizeK=Integer.toString(Integer.parseInt(sizeK)*10);//保证点不能太小
           	   else if(sizeK.equals("3")||sizeK.equals("4")||sizeK.equals("5"))
           				sizeK=Integer.toString(Integer.parseInt(sizeK)*3);//保证点不能太小
   				if(Integer.parseInt(sizeK)>20)
        			sizeK=Integer.toString(Integer.parseInt(sizeK)/3);
        		if(actRes1[i].substring(0,actRes1[i].indexOf("=")).length()>1)
        		{
        	%>
		            {
		                name: "<%=actRes1[i].substring(0,actRes1[i].indexOf("="))%>",
		                value: 100,
		                category: 2,
		                symbolSize:<%=sizeK%>,
		            },
            <%
        		}
        	}%>
    
        
        ],
links=[
	{
        source:0,
        target: 19
    },
	<%
	for(int i=0;i<10;i++)
	{%>
		{
	        source: <%=i%>,
	        target: <%=i*2-1%>
	    },
	<%i=i+1;}%>
	{
        source: 9,
        target: 4
    },
    <%
	for(int i=10;i<110;i++)//人物和行为
	{
		if(i%3==0)
		{
	%>
			{
		        source: <%=i%>,
		        target: <%=i*2+5%>
		    },
		    {
		        source: <%=i%>,
		        target: <%=809-i*5%>
		    },
		    {
		        source: <%=i%>,
		        target: <%=i+210%>
		    },
		    {
		        source: <%=i+300%>,
		        target: <%=i+210%>
		    },
		    {
		        source: <%=i%>,
		        target: <%=809-i%>
		    },

    <%}
		else if(i%2==0)
		{
	%>
		 {
		        source: <%=i%>,
		        target: <%=i+27%>
		    },
		    {
		        source: <%=i%>,
		        target: <%=509-i*10%>
		    },
    <%}
		else
		{
	%>
		 {
		        source: <%=i%>,
		        target: <%=209-i%>
		    },
			{
		        source: <%=i%>,
		        target: <%=lenK+lenO+lenP-lenA-i%>
		    },
    <%}
    }%>
    <%
	for(int i=110;i<210;i++)//机构和行为
	{
		 if(i%4==0)
		{
	%>
		 {
		        source: <%=i%>,
		        target: <%=i+27%>
		    },
		    {
		        source: <%=i%>,
		        target: <%=209-i*5%>
		    },
		    {
		        source: <%=i%>,
		        target: <%=809-i*3%>
		    },
    <%}
		else
		{
	%>
			{
		        source: <%=i%>,
		        target: <%=209-i%>
		    },
    <%}
    }%>
    <%for(int i=210;i<809;i++){%>
    {
        source: <%=i%>,
        target: <%=i+1%>
    },
    {
        source: <%=i%>,
        target: <%=i+2%>
    },
    {
        source: <%=i%>,
        target: <%=i+3%>
    },
    {
        source: <%=i%>,
        target: <%=i+4%>
    },
    <%i=i+6;}%>
],
    option = {
        	/* 	color: ['#fc853e','#28cad8','#9564bf','#bd407e','#e5a214'], 用来改点的颜色*/		
        legend: {
            data: ['人物', '机构', '行为措施', '主题']
        },
        series: [{
            type: 'graph',
            layout: 'force',
            roam: true,    //实现缩放
            animation: false,
            label: {
                normal: {
                    position: 'right',
                    formatter: '{b}'
                }
            },
            draggable: true,
            focusNodeAdjacency: true,//点击时其他点变暗
            data: nodes.map(function (node, idx) {
                node.id = idx;
                return node;
            }),
            categories: categories,
            force: {
                // initLayout: 'circular'
                // repulsion: 20,
                edgeLength: 5,
                repulsion: 20,
                gravity: 0.2
            },
            edges: links
        }]
    };

    myChart.setOption(option);
    myChart.on('click', function (params) {
        var data=params.value
        //点没有source属性
        if(data.source==undefined){
            nodeName=params.name
            window.open("zaiti.jsp?a="+nodeName)
        }

});
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}

       </script>
        <!-- 地图 -->

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
					x: 200,//调整该图像距离地图的距离
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
								int allHot=0;
								String allWorld="上海，东莞，东营，中山，临汾，临沂，丹东，丽水，乌鲁木齐，佛山，保定，兰州，包头，北京，北海，南京，南宁，南昌，南通，厦门，台州，合肥，呼和浩特，咸阳，哈尔滨，唐山，嘉兴，大同，大连，天津，太原，威海，宁波，宝鸡，宿迁，常州，广州，廊坊，延安，张家口，徐州，德州，惠州，成都，扬州，承德，拉萨，无锡，日照，昆明，枣庄，柳州，株洲，汕头，江门，沈阳，沧州，河源，泉州，泰安，泰州，济南，济宁，海口，淄博，淮安，深圳，清远，温州，渭南，湖州，湘潭，滨州，潍坊，烟台，玉溪，珠海，盐城，盘锦，石家庄，福州，秦皇岛，绍兴，聊城，肇庆，舟山，苏州，莱芜，菏泽，营口，葫芦岛，河北，衢州，西宁，西安，贵阳，连云港，邢台，邯郸，郑州，鄂尔多斯，重庆，金华，铜川，银川，镇江，长春，长沙，长治，阳泉，青岛，韶关，新疆，西藏，黑龙江，吉林，辽宁，内蒙古，宁夏，山西，青海，甘肃，山东，陕西，河南，安徽，江苏，上海，四川，贵州，江西，湖南，浙江，湖北，福建，云南，台湾，广西，广东，香港，澳门，海南";
								for(int i=0;i<loaRes1.length;i++)
								{if(allWorld.contains(loaRes1[i].substring(0,loaRes1[i].indexOf("="))))
									{
									allHot+=Integer.parseInt(loaRes1[i].substring(loaRes1[i].indexOf("=")+1,loaRes1[i].length()));
									%>
									{name:'<%=loaRes1[i].substring(0,loaRes1[i].indexOf("="))%>',value:<%=loaRes1[i].substring(loaRes1[i].indexOf("=")+1,loaRes1[i].length())%>},
							<%}
								}%>
							]
						}
					},
					
					{
						name: '热度',
						type: 'map',
						mapType: 'china',
						data:[],
						markLine : {
							smooth:true,
							effect : {
								show: true,
								scaleSize: 1,
								period: 30,
								color: '#fff',
								shadowBlur: 10
							},
							itemStyle : {
								normal: {
									label:{show:true},
									borderWidth:1,
									lineStyle: {
										type: 'solid',
										shadowBlur: 10
									}
								}
							},
							data : [
								<%
								int mubiao=0;
								while(!allWorld.contains(loaRes1[mubiao].substring(0,loaRes1[mubiao].indexOf("="))))
									{mubiao++;
										
									}
								for(int i=mubiao+1;i<loaRes1.length;i++)
								{
									//System.out.println(loaRes1[i]+"di");
									if(allWorld.contains(loaRes1[i].substring(0,loaRes1[i].indexOf("="))))
									{
									%>
									[{name:'<%=loaRes1[i].substring(0,loaRes1[i].indexOf("="))%>'}, {name:'<%=loaRes1[mubiao].substring(0,loaRes1[mubiao].indexOf("="))%>',value:<%=loaRes1[mubiao].substring(loaRes1[mubiao].indexOf("=")+1,loaRes1[mubiao].length())%>}],
							<%}
								}%>
							]
						},
						markPoint : {
							symbol:'emptyCircle',
							symbolSize : function (v){
								return 0.1
							},
							effect : {
								show: false,
								shadowBlur : 0
							},
							itemStyle:{
								normal:{
									label:{show:true,
										  position:'top',
										  textStyle: {
													fontSize: 14
												}
										  }
								},
								emphasis: {
									label:{show:false}
								}
							},
							data : [
								<%
								for(int i=mubiao+1;i<loaRes1.length;i++)
								{if(allWorld.contains(loaRes1[i].substring(0,loaRes1[i].indexOf("="))))
									{
									//System.out.println(loaRes1[i]);
									%>
									{name:'<%=loaRes1[i].substring(0,loaRes1[i].indexOf("="))%>',value:<%=loaRes1[i].substring(loaRes1[i].indexOf("=")+1,loaRes1[i].length())%>*2},
							<%}
								}%>
							]
						}
					}
				]
        });
	});
}
    </script>
    <!-- 区域分布的饼图 -->
    	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="echarts.js"></script>
		<script src="dataTool.js"></script>    	
       <script type="text/javascript">
var dom = document.getElementById("di");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '嵌套环形图';

option = {
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    title: {
        left:450,
        text: '地区分布TOP8',
    },
    legend: {
        orient: 'vertical',
        x: 140,
        data:['直达','营销广告','搜索引擎','邮件营销','联盟广告','视频广告','百度','谷歌','必应','其他','马佳慧']
    },
    series: [
        {
            name:'总热度',
            type:'pie',
            selectedMode: 'single',
            radius: [0, '30%'],

            label: {
                normal: {
                    position: 'inner'
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:<%=allHot%>, name:'区域分布', selected:false},
            ]
        },
        {
            name:'热度',
            type:'pie',
            radius: ['40%', '55%'],
            label: {
                normal: {
                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                    backgroundColor: '#eee',
                    borderColor: '#aaa',
                    borderWidth: 1,
                    borderRadius: 4,
                    rich: {
                        a: {
                            color: '#999',
                            lineHeight: 22,
                            align: 'center'
                        },
                        hr: {
                            borderColor: '#aaa',
                            width: '100%',
                            borderWidth: 0.5,
                            height: 0
                        },
                        b: {
                            fontSize: 16,
                            lineHeight: 33
                        },
                        per: {
                            color: '#eee',
                            backgroundColor: '#334455',
                            padding: [2, 4],
                            borderRadius: 2
                        }
                    }
                }
            },
            data:[
            	<%
            	int stop=0;
            	String sheng="山东，河北，吉林，黑龙江，辽宁，内蒙古，新疆，甘肃，宁夏，山西，陕西，河南，安徽，江苏，浙江，福建，广东，江西，海南，广西，贵州，湖南，湖北，四川，云南，西藏，青海，天津，上海，重庆，北京，台湾，香港";
            	for(int i=0;i<loaRes1.length;i++){
            		if(sheng.contains(loaRes1[i].substring(0,loaRes1[i].indexOf("=")))){
            			stop++;
            			if(stop>8)
            				break;
            	%>
                {value:<%=loaRes1[i].substring(loaRes1[i].indexOf("=")+1,loaRes1[i].length())%>, name:'<%=loaRes1[i].substring(0,loaRes1[i].indexOf("="))%>'},
 		   <%}
 		   }%>
            ]
        }
    ]
};;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>