<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ways.*"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import=" java.util.Calendar"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Calendar"%>
    
        <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主题词设置页</title>
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
      <%
        	User userget=(User)session.getAttribute("user");
       %>
    <%
              	request.setCharacterEncoding("UTF-8");
                   request.setCharacterEncoding("UTF-8");
                   System.out.println("mjh"+request.getParameter("keyword")+"\tcs");
             	    if(request.getParameter("keyword")!=null&&!request.getParameter("keyword").equals(""))
             		{
              		SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
                    Calendar calendar=Calendar.getInstance();
                    Inkeyword key=new Inkeyword();
                    key.setTime(sdFormat.format(calendar.getTime()));
                    request.setCharacterEncoding("UTF-8");
                    key.setKeyword(request.getParameter("keyword"));
                    KeyDao.add(key, userget.getUsername());
                    System.out.println("增加主题词成功");
             		} 
         %>
  <%
                request.setCharacterEncoding("UTF-8");
                String zhu="",ci="",guo="",howlong="",locationKey="",locationCi="";
                if(request.getParameter("comkey")!=null)
                	zhu=request.getParameter("comkey");
                if(request.getParameter("cikey")!=null)
                	ci=request.getParameter("cikey");
                if(request.getParameter("guolv")!=null)
                	guo=request.getParameter("guolv");
                if(request.getParameter("howlong")!=null)
                	howlong=request.getParameter("howlong");
                if(request.getParameter("locationKey")!=null)
                	locationKey=request.getParameter("locationKey");
                if(request.getParameter("locationCi")!=null)
                	locationCi=request.getParameter("locationCi");
                System.out.println(ci+"呵呵");
                System.out.println(zhu+"祥和居");
                if(!zhu.equals("")&&!howlong.equals("")&&!locationKey.equals(""))
                	KeyDao.update1(zhu, ci, guo, howlong, locationKey, locationCi, userget.getUsername());
%>   
<%
//删除
String kw="";
if(request.getParameter("KW")!=null)
	kw=  request.getParameter("KW");
if(!kw.equals(""))
	KeyDao.delete(kw, userget.getUsername());
%>
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
        <div class="content-inner">
          
          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">首页</a></li>
              <li class="breadcrumb-item active">舆情检索           </li>
            </ul>
          </div>
          <!-- Forms Section-->
          <section class="forms"> 
            <div class="container-fluid">
              <div class="row">
            
                <!-- Form Elements -->
                <div class="col-lg-12" style="height:1300px">
                  <div class="card">
                    <div class="card-close">
                      <div class="dropdown" style="margin-top:-30px;height:1300px">
                        <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                      </div>
                    </div>
                    <div class="card-header d-flex align-items-center" style="margin-top:-30px">
                      <h3 class="h4" >主题词设置</h3>
                    </div>
                    <div class="card-body" style="height:500px">
  
                      <div class="mail-box">
                        <aside class="sm-side" style="width:300px">
                          <div class="inbox-body text-center">
                          </div>
                          <div style="margin-top:-10px;margin-right:10px;height:160px;background-color:#fff">
                          <div style="background-color:#cbdcf8;height:40px"></div>
                          <h5 class="input-text" style="margin-top:-26px">今日主题词</h5>                    
                             <div id="hw" style="height:390px;width:280px;margin-top:30px;margin-left:0px; border: 2px solid;border-radius: 25px;"></div>
                          </div>
                        </aside>
                  
                      <aside class="lg-side" style="margin-top:-160px;margin-left:320px">

                          <div
                           class="inbox-head" style="height:40px;background-color:#cbdcf8;margin-top:-25px">
                                                
                            <form action="#" class="pull-right position">
                              <div class="input-append inner-append" style="margin-top:5px">
                              <a href="#myModal" data-toggle="modal" title="点击添加" style="height:45px;width:150px">增加主题词</a>
                              </div>
                            </form>
                          </div>
 				 <div style="margin-top:-30px"><h5 class="input-text" style="margin-top:3px">主题词监控列表</h5></div>
                          <div class="table-responsive">
                            <table class="table table-inbox table-hover table-responsive" border="1"  >
                            <tr>
                                  <td class="view-message "  style="width:70px;text-align:center">序号</td>
                                  <td class="view-message "  style="width:120px;text-align:center">主题词</td>
                                  <td class="view-message  "  style="width:140px;text-align:center">主题词位置</td>
                                  <td class="view-message "  style="width:200px;text-align:center">次主题词</td>
                                  <td class="view-message  "  style="width:170px;text-align:center">次主题词位置</td>
                                  <td class="view-message  "  style="width:200px;text-align:center">过滤词</td>
                                  <td class="view-message  "  style="width:130px;text-align:center">创建时间</td>
                                  <td class="view-message  "  style="width:120px;text-align:center">时间范围</td>
                                  <td class="view-message  "  style="width:260px;text-align:center" colspan="2">操作</td>
                                </tr>
                                  <!-- 增加主题词 -->
                              <%
                          	//分页的条件
          					int pageIndex = 1;
          					int pageSize =7;
          					int id=1;
          					if(request.getParameter("pageIndex")!=null&&request.getParameter("pageIndex")!="")
          						pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
                            Pager pager = KeyDao.load(pageIndex, pageSize,userget.getUsername() );
                            List<Inkeyword> keys=pager.getDatas();
                              for(Inkeyword key:keys){ 
                             // System.out.println(key.getLocationKey ()+key.getLocationCi ()+"weizhi ");
                              %>
                                <tr >
                                  <td class="view-message "  style="width:70px;text-align:center"><%=id %></td>
                                  <td class="view-message "  style="width:120px;text-align:center"><a href="Keycharts.jsp?key=<%=key.getKeyword()%>&ci=<%=key.getCombineKey()%>&guolv=<%=key.getNoContain()%>"><%=key.getKeyword() %></a></td>
                                  <td class="view-message "  style="width:140px;text-align:center"><%=key.getLocationKey() %></td>
                                  <td class="view-message "  style="width:200px;text-align:center"><%=key.getCombineKey()%></td>
                                   <td class="view-message "  style="width:160px;text-align:center"><%=key.getLocationCi()%></td>
                                   <td class="view-message "  style="width:200px;text-align:center"><%=key.getNoContain() %></td>
                                  <td class="view-message  "  style="width:130px;text-align:center"><%=key.getTime()%></td>
                                   <td class="view-message "  style="width:120px;text-align:center"><%=key.getHowlong() %></td>
                                  <td class="view-message "  style="width:80px;text-align:center"><a href="KeyWords.jsp?KW=<%=key.getKeyword()%>">移除</a></td>
                                  <td class="view-message "  style="width:180px;text-align:center">
                                  <a href="#zuhe"  data-toggle="modal"   title="<%=key.getKeyword()%>"  id="testa"  onclick="select(this)">组合其他/编辑</a></td>
                                </tr>

                               <%;id++;} %>
								    <script type="text/javascript">
										function select(obj) {
										       // alert($(obj).attr('title'));
										        document.getElementById('comkey').value=($(obj).attr('title'))
										    }
										</script>
                               <!-- 设置分页的页码 -->	
								<tr>
									<td colspan="10" align="center">
										<a href="KeyWords.jsp?pageIndex=1&keyword=<%=""%>">首页</a>
										
										<!-- 如果是第一页的话 , 就不显示 上一页 -->
										<%
											if(pageIndex > 1){
										%>
											<a href="KeyWords.jsp?pageIndex=<%=pageIndex-1 %>&keyword=<%="" %>">上一页</a>
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
												<a href="KeyWords.jsp?pageIndex=<%=i%>&keyword=<%="" %>"><%=i %></a>
										<%
												}
											}	
										%>	
										<%
											if( pageIndex < totalPage){
										%>
											<a href="KeyWords.jsp?pageIndex=<%=pageIndex + 1 %>&keyword=<%=""%>">下一页</a>
										<%
											}
										%>
										<a href="KeyWords.jsp?pageIndex=<%=totalPage%>&keyword=<%=""%>">尾页</a>
									</td>
								</tr>
                               
                            </table>
                          </div>

                        </aside>
                     </div>
                </div>
                </div>
                </div>
                </div>
                </section>
                </div>
                </div>
                </div>
  
                <!-- 组合关键词 -->
                            <div aria-hidden="true" role="dialog" tabindex="-1" id="zuhe" class="modal fade" style="margin-top:-13px">
                              <div class="modal-dialog">
                                <div class="modal-content text-left" style="margin-top:150px">
                                  <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button"><i class="ti-close"></i></button>
                                    <h4 class="modal-title">事件专题编辑</h4>
                                  </div>                               
                                  <div class="modal-body">
                                    <form class="form-horizontal" action="KeyWords.jsp" method="post">
                                      <div class="form-group">
                                        <h5>输入要组合监控的主题词</h5>
                                        <div class="col-lg-10">
                                          <p style="margin-top:30px">主关键字<p><input type="text"    placeholder="" id="comkey" name="comkey"  class="form-control"  style="margin-top:-46px;margin-left:105px">
                                           <p style="margin-top:30px">次关键字</p><input type="text" placeholder=" 多主题词之间用分号间隔" id="cikey" name="cikey" class="form-control"  style="margin-top:-46px;margin-left:105px" >
                                          <p style="margin-top:30px">过滤词</p><input type="text" placeholder=" 多过滤词之间用分号间隔" id="guolv" name="guolv" class="form-control"  style="margin-top:-46px;margin-left:105px">
                                           <p style="margin-top:30px">时间范围</p>
                                              <select class="form-control"  id="howlong" name="howlong" style="margin-top:-46px;margin-left:105px" >
											     <option >全部</option>										
											     <option >一天内</option>	
											     <option >三天内</option>										
											     <option >一周内</option>									
											     <option >一月内</option>	
											     <option >一年内</option>													
											</select>
                                          <p style="margin-top:30px">主关键词位置</p>
		                                        <select class="form-control" id="locationKey" name="locationKey" style="margin-top:-46px;margin-left:105px" >
												    <option >全部位置</option>										
												    <option >标题位置</option>									
												    <option >正文位置</option>									
												</select>
											 <p style="margin-top:30px">次关键词位置</p>
		                                        <select class="form-control" id="locationCi" name="locationCi" style="margin-top:-46px;margin-left:105px" >
												    <option >全部位置</option>										
												    <option >标题位置</option>									
												    <option >正文位置</option>									
												</select>
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                          <button class="btn btn-primary" type="submit" style="width:400px;margin-left:20px">添加</button>
                                        </div>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                                </div>
                                </div>  
                          
                            <div aria-hidden="true" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                              <div class="modal-dialog">
                                <div class="modal-content text-left" style="margin-top:200px">
                                  <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button"><i class="ti-close"></i></button>
                                    <h4 class="modal-title">新建主题词</h4>
                                  </div>
                                  <div class="modal-body">
                                    <form class="form-horizontal" action="KeyWords.jsp" method="post">
                                      <div class="form-group">
                                        <h5 style="margin-top:10px">输入主题词</h5>
                                        <div class="col-lg-10">
                                          <input type="text" placeholder="请输入一个主题词"  id="keyword" name="keyword" class="form-control" style="margin-left:80px;margin-top:-35px">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                          <button class="btn btn-primary" type="submit" style="width:200px;margin-left:100px">添加</button>
                                        </div>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>
                            
                            
                            <!-- Common -->
    <script src="assets/js/lib/jquery.min.js"></script>
    <script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
    <script src="assets/js/lib/menubar/sidebar.js"></script>
    <script src="assets/js/lib/preloader/pace.min.js"></script>
    <script src="assets/js/lib/bootstrap.min.js"></script>
    <script src="assets/js/scripts.js"></script>

    <!-- Calender -->
    <script src="assets/js/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/js/lib/moment/moment.js"></script>
    <script src="assets/js/lib/calendar/fullcalendar.min.js"></script>
    <script src="assets/js/lib/calendar/fullcalendar-init.js"></script>

    <!--  Flot Chart -->
    <script src="assets/js/lib/flot-chart/excanvas.min.js"></script>
    <script src="assets/js/lib/flot-chart/jquery.flot.js"></script>
    <script src="assets/js/lib/flot-chart/jquery.flot.pie.js"></script>
    <script src="assets/js/lib/flot-chart/jquery.flot.time.js"></script>
    <script src="assets/js/lib/flot-chart/jquery.flot.stack.js"></script>
    <script src="assets/js/lib/flot-chart/jquery.flot.resize.js"></script>
    <script src="assets/js/lib/flot-chart/jquery.flot.crosshair.js"></script>
    <script src="assets/js/lib/flot-chart/curvedLines.js"></script>
    <script src="assets/js/lib/flot-chart/flot-tooltip/jquery.flot.tooltip.min.js"></script>
    <script src="assets/js/lib/flot-chart/flot-chart-init.js"></script>

    <!--  Chartist -->
    <script src="assets/js/lib/chartist/chartist.min.js"></script>
    <script src="assets/js/lib/chartist/chartist-plugin-tooltip.min.js"></script>
    <script src="assets/js/lib/chartist/chartist-init.js"></script>

    <!--  Chartjs -->
    <script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
    <script src="assets/js/lib/chart-js/chartjs-init.js"></script>

    <!--  Knob -->
    <script src="assets/js/lib/knob/jquery.knob.min.js "></script>
    <script src="assets/js/lib/knob/knob.init.js "></script>

    <!--  Morris -->
    <script src="assets/js/lib/morris-chart/raphael-min.js"></script>
    <script src="assets/js/lib/morris-chart/morris.js"></script>
    <script src="assets/js/lib/morris-chart/morris-init.js"></script>

    <!--  Peity -->
    <script src="assets/js/lib/peitychart/jquery.peity.min.js"></script>
    <script src="assets/js/lib/peitychart/peitychart.init.js"></script>

    <!--  Sparkline -->
    <script src="assets/js/lib/sparklinechart/jquery.sparkline.min.js"></script>
    <script src="assets/js/lib/sparklinechart/sparkline.init.js"></script>

    <!-- Select2 -->
    <script src="assets/js/lib/select2/select2.full.min.js"></script>

    <!--  Validation -->
    <script src="assets/js/lib/form-validation/jquery.validate.min.js"></script>
    <script src="assets/js/lib/form-validation/jquery.validate-init.js"></script>

    <!--  Circle Progress -->
    <script src="assets/js/lib/circle-progress/circle-progress.min.js"></script>
    <script src="assets/js/lib/circle-progress/circle-progress-init.js"></script>

    <!--  Vector Map -->
    <script src="assets/js/lib/vector-map/jquery.vmap.js"></script>
    <script src="assets/js/lib/vector-map/jquery.vmap.min.js"></script>
    <script src="assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.algeria.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.argentina.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.brazil.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.france.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.germany.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.greece.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.iran.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.iraq.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.russia.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.tunisia.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.europe.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.usa.js"></script>

    <!--  Simple Weather -->
    <script src="assets/js/lib/weather/jquery.simpleWeather.min.js"></script>
    <script src="assets/js/lib/weather/weather-init.js"></script>

    <!--  Owl Carousel -->
    <script src="assets/js/lib/owl-carousel/owl.carousel.min.js"></script>
    <script src="assets/js/lib/owl-carousel/owl.carousel-init.js"></script>

    <!--  Calender 2 -->
    <script src="assets/js/lib/calendar-2/moment.latest.min.js"></script>
    <script src="assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
    <script src="assets/js/lib/calendar-2/pignose.init.js"></script>


    <!-- Datatable -->
    <script src="assets/js/lib/data-table/datatables.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.dataTables.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.flash.min.js"></script>
    <script src="assets/js/lib/data-table/jszip.min.js"></script>
    <script src="assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="assets/js/lib/data-table/datatables-init.js"></script>

    <!-- JS Grid -->
    <script src="assets/js/lib/jsgrid/db.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.core.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.load-indicator.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.load-strategies.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.sort-strategies.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.field.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.text.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.number.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.select.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.checkbox.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.control.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid-init.js"></script>

    <!--  Datamap -->
    <script src="assets/js/lib/datamap/d3.min.js"></script>
    <script src="assets/js/lib/datamap/topojson.js"></script>
    <script src="assets/js/lib/datamap/datamaps.world.min.js"></script>
    <script src="assets/js/lib/datamap/datamap-init.js"></script>

    <!--  Nestable -->
    <script src="assets/js/lib/nestable/jquery.nestable.js"></script>
    <script src="assets/js/lib/nestable/nestable.init.js"></script>

    <!--ION Range Slider JS-->
    <script src="assets/js/lib/rangeSlider/ion.rangeSlider.min.js"></script>
    <script src="assets/js/lib/rangeSlider/moment.js"></script>
    <script src="assets/js/lib/rangeSlider/moment-with-locales.js"></script>
    <script src="assets/js/lib/rangeSlider/rangeslider.init.js"></script>

    <!-- Bar Rating-->
    <script src="assets/js/lib/barRating/jquery.barrating.js"></script>
    <script src="assets/js/lib/barRating/barRating.init.js"></script>

    <!-- jRate -->
    <script src="assets/js/lib/rating1/jRate.min.js"></script>
    <script src="assets/js/lib/rating1/jRate.init.js"></script>

    <!-- Sweet Alert -->
    <script src="assets/js/lib/sweetalert/sweetalert.min.js"></script>
    <script src="assets/js/lib/sweetalert/sweetalert.init.js"></script>

    <!-- Toastr -->
    <script src="assets/js/lib/toastr/toastr.min.js"></script>
    <script src="assets/js/lib/toastr/toastr.init.js"></script>


    <!--  Dashboard 1 -->
    <script src="assets/js/dashboard1.js"></script>
    <script src="assets/js/dashboard2.js"></script>
                
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
        var chart = echarts.init(document.getElementById('hw')); 
        var option = {
        	    title: {
        	        text: '',
        	        link: ''
        	    },
        	    tooltip: {
        	        show: true
        	    },
        	    series: [{
        	        name: '近期热词',
        	        type: 'wordCloud',
        	        size: ['180%', '180%'],
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
        	              List<WYNews> wynew=WYNewsDaoImpl.loadallToday();
        	              for( WYNews user : wynew ){
        	            	 String []tmpKey= user.getKeywords().split(", ");
        	            	for(String tk:tmpKey)
        	            	{
        	            		allword+=tk.trim() ;
        	            		allword+=", ";
        	            	}
        	              }
        	             String []keys1=Nums.ciNum(allword,", ");
        				for(int i=0;i<keys1.length;i++){
        					
        					if(keys1[i]!=null){		
        				%>
        				 {
        					 name: '<%=keys1[i].substring(0,keys1[i].indexOf("="))%>',
        					 value: <%=Integer.parseInt(keys1[i].substring(keys1[i].indexOf("=")+1,keys1[i].length()))*15%>, 
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
    