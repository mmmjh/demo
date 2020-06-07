<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ways.*"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="demo.test.cn.gavinnie.test.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>预警信息页</title>
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
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <style>

#popBox{
    position: absolute;
    display:none;
    width:300px;
    height:200px;
    left:40%;
    top:20%;
    z-index:11;
    background:#B8F764; 
}

#popLayer{
    position: absolute;
    display:none;
    left:0;
    top:0;
    z-index:10;
    background:#DCDBDC;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);/* 只支持IE6、7、8、9 */
}

</style>
<script type="text/javascript">
    function popBox(){
        var popBox = document.getElementById('popBox');
        var popLayer = document.getElementById('popLayer');

        popLayer.style.width = document.body.scrollWidth + "px";
        popLayer.style.height = document.body.scrollHeight + "px";

        popLayer.style.display = "block";
        popBox.style.display = "block";
    }//end func popBox()

    function closeBox(){
        var popBox = document.getElementById('popBox');
        var popLayer = document.getElementById('popLayer');

        popLayer.style.display = "none";
        popBox.style.display = "none";

    }//end func closeBox()

</script>
            <style> 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 35%; 
            height: 55%; 
            padding: 20px; 
            border: 1px solid #b0c2f9;
            background-color: #b0c2f9;; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style> 
    
        <script type="text/javascript">
        $(function(){
        })
        function openDialog(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
    </script>
                    <%
        	User userget=(User)session.getAttribute("user");//当前登录用户
            %>
   <!-- 接受添加信息 -->
   <%
   request.setCharacterEncoding("UTF-8");
   String title="";
   if(request.getParameter("title")!=null)
   		title= request.getParameter("title");
  if(request.getParameter("title")!=null)
  {
	List<WYNews> wyget= WYNewsDaoImpl.load("select * from wynews where title like '%"+title+"%'");
	  JingNews jing=new JingNews();
	  jing.setTitle(title);
	  jing.setHot(wyget.get(0).getHotnum());
	  jing.setPubTime(wyget.get(0).getTime());
	  JingDao.add(jing,userget.getUsername());//加入预警
	  System.out.println("添加成功");
  }
   %>
   <!-- 接受删除消息 -->
   <%
   request.setCharacterEncoding("UTF-8");
   String deltitle="";
   if(request.getParameter("delTitle")!=null)
   		deltitle= request.getParameter("delTitle");
  if(request.getParameter("delTitle")!=null)
  {
	  WYNewsDaoImpl.delete(deltitle,userget.getUsername() );
  }
   %>
   <!-- 接受修改信息 -->
   <%
   request.setCharacterEncoding("UTF-8");
   String tit="";String hot110="";
   String way1 ="";String way2="";String way3="",sta="未预警";
   String phone="";String email="";
   // System.out.println(emotion+"输出");
   if(request.getParameter("tit")!=null)
   	tit= request.getParameter("tit");
   if(request.getParameter("hot110")!=null){
	  	   System.out.println(request.getParameter("hot110").substring(0,4)+"csbkj");
	  	   	hot110= request.getParameter("hot110");
   }
   if(request.getParameter("status")!=null){
 	     sta= request.getParameter("status");
   }
   if(request.getParameter("way1")!=null)
  		 way1=request.getParameter("way1");//通知方式
  	  if(request.getParameter("way2")!=null)
   		 way2=request.getParameter("way2");//通知方式
     if(request.getParameter("way3")!=null)
            way3=request.getParameter("way3");//通知方式
      if(request.getParameter("phone")!=null)
    		 phone=request.getParameter("phone");//通知方式
      if(request.getParameter("email")!=null)
             email=request.getParameter("email");//通知方式
     String ways=way3;
       if(!way1.equals(""))
       {
      	 ways+="&&";
      	 ways+=way1;
       }
       if(!way2.equals(""))
       {
      	 ways+="&&";
      	 ways+=way2;
       }
       List<JingNews>getNew=JingDao.loadTit(tit,userget.getUsername());
/*       // System.out.println(hot110.substring(0, 4));
       if(request.getParameter("hot110")!=null&&!sta.equals("已查看，处理")&&Integer.parseInt(getNew.get(0).getHot())>Integer.parseInt(hot110.substring(0, 4)))
       {
    	   System.out.println(tit+"标题");
    	   sta="已预警，未处理";
       }
 */
       if(!hot110.equals("")||(ways.contains("短信")||ways.contains("邮件")))
       {
     	System.out.println("更新");
      	JingDao.update(getNew.get(0).getHot(),ways, tit, hot110,phone,email,sta,userget.getUsername());
       }
      	
   
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
                		if((Integer.parseInt(jnew.getHot())>10000)&&jnew.getHot110().contains("大于")&&jnew.getStatus().equals("已预警，未处理"))
           				{
           					allJing++;
           				}
                		if(!jnew.getHot110().contains("大于")&&jnew.getStatus().equals("已预警，未处理"))
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

          <!-- Forms Section-->
          <section class="forms" style="margin-top:20px"> 
            <div class="container-fluid">
              <div class="row">
       <%		 
                List<JingNews> yvNew=JingDao.load(userget.getUsername());
             %>         

                <!-- Form Elements -->
                <div class="col-lg-12">
                  <div class="card" style="margin-top:40px">
                    	<div class="card-header d-flex align-items-center" style="margin-top:-30px;height:50px">
                      			<h3 class="h4" >预警舆情汇总</h3>
                   		 </div>
	                    <div class="card-body" style="height:800px;margin-top:-20px">
	
									<div class="page-container">
									<div class="cl pd-5 bg-1 bk-gray mt-20">
										<span class="r">共有数据：<strong><%=yvNew.size() %></strong> 条</span>
									</div>
									<div class="mt-20">
										<table class="table table-border table-bordered table-bg table-hover table-sort">
											<thead>
												<tr class="text-c">
														<th width="25"><input type="checkbox" name="" value=""></th>
														<th width="300">预警文章</th>
														<th width="140">发表时间</th>
														<th width="105">实时热度</th>
														<th width="105">预警方式</th>
														<th width="105">预警热度</th>
														 <th width="105">处置状态</th>
														 <th width="120">操作</th>
											      </tr>
											</thead>
											<tbody>					
											     <%
												for(JingNews yv:yvNew){
												%>	
													<tr class="text-c">
														<td><input type="checkbox" value="" name=""></td>
														<td><a href="Location.jsp?title=<%=yv.getTitle()%>"><%=yv.getTitle() %></a></td>
														<td><%=yv.getPubTime()%></td>
														<td><img src="image/hot.jpg" style="width:30px;height:30px"><%=yv.getHot() %></td>
														<td><%=yv.getWay() %></td>
														<td><img src="image/time.jpg" style="width:30px;height:30px"><%=yv.getHot110() %></td>
														<%
														if(yv.getStatus().equals("已预警，未处理")){
														%>
														<td ><font color="red"><%=yv.getStatus() %></font></td>
														<%} else{%>
														<td ><%=yv.getStatus() %></td>
														<%} %>
													
														<td class="f-14">
														     <a  name="popBox" onclick="popBox();select(this,'<%=yv.getPhone() %>' ,'<%=yv.getEmail() %>','<%=yv.getHot110() %>','<%=yv.getStatus() %>','<%=yv.getWay() %>')" title="<%=yv.getTitle() %>"  ><i class="Hui-iconfont">&#xe6df;</i></a>
															<a title="查看" href="Location.jsp?title=<%=yv.getTitle() %>"  class="ml-5" style="text-decoration:none"><img src="img/so.jpg" style="width:20px;height:20px"></a>
															<a title="删除" href="New110.jsp?delTitle=<%=yv.getTitle() %>" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
													  </td>
													</tr>
											<%} %>
											</tbody>
								</table>
							</div>
						</div>
  
                </div>
                </div>
                </div>
                </div>
                </div>
                </section>
                </div>
                </div>
                </div>
             <script type="text/javascript">//给弹出框的title赋值
								function select(obj,ph,em,hot,sta,way) {
            							// alert(($(obj).attr('title')));
								        document.getElementById('tit').value=($(obj).attr('title'))
										document.getElementById('phone').value=ph
										document.getElementById('email').value=em
										document.getElementById('hot110').value=hot
										document.getElementById('status').value=sta
										if(sta.indexOf("已预警") != -1)
											document.getElementById('status').disabled=false
										else
											document.getElementById('status').disabled=true
										//alert(way)
										if(way.indexOf("短信") >0)
											{
												document.getElementById("way1").checked=true;
												document.getElementById("phone").style.display = "block";
							                	 document.getElementById("ph").style.display = "block";
											}
								        if(way.indexOf("邮件") >0)
								        	{
												 document.getElementById("way2").checked=true;
												 document.getElementById("email").style.display = "block";
							                	 document.getElementById("em").style.display = "block";
								        	}

								    }
			</script>
           
            <script>
            function exe(){//判断短信复选框是否被选中 从而弹出相应的input
                var vals=document.getElementById("way1").checked;
                 
                if(vals==true){
                	 document.getElementById("phone").style.display = "block";
                	 document.getElementById("ph").style.display = "block";
                }
                if(vals==false){
                	 document.getElementById("phone").style.display = "none";
                	 document.getElementById("ph").style.display = "none";
                }
            }
            function exeEmail(){//判断复选框是否被选中 从而弹出相应的input
                var vals=document.getElementById("way2").checked;
                 
                if(vals==true){
                	 document.getElementById("email").style.display = "block";
                	 document.getElementById("em").style.display = "block";
                }
                if(vals==false){
                	 document.getElementById("email").style.display = "none";
                	 document.getElementById("em").style.display = "none";
                }
            }
            </script>
            
             <div id="popLayer"  ></div>
					<div id="popBox"  style="margin-left:-30px;margin-top:-50px;width:520px;height:auto;background-color:#fff">
					 <div style="height:80px;margin-top:-10px"><h3 style="margin-top:-10px">预警设置项</h3></div>
					    <div style="margin-top:-62px"><a href="javascript:void(0)" onclick="closeBox()" style="margin-left:480px;margin-top:-50px"><img src="image/bi.jpg" style="width:30px;height:30px"></a></div>
					    <hr style="margin-top:10px"/>
					       <form class="form-horizontal" action="New110.jsp" method="post">
							    <div>
							        <p style="margin-top:30px;font-size:1.2em;margin-left:40px">新闻标题<p><input type="text" placeholder="" id="tit" name="tit"  class="form-control"  style="margin-top:-38px;margin-left:135px;">
							         <p style="margin-top:30px;font-size:1.2em;margin-left:40px">阈值区间<p>
							           <select class="form-control"  id="hot110" name="hot110" style="margin-top:-46px;margin-left:135px" >
																		     <option >1000-2000</option>										
																		     <option >2000-3000</option>	
																		     <option >3000-5000</option>										
																		     <option >5000-10000</option>									
																		     <option >大于10000</option>												
									 </select>
									  <p style="margin-top:30px;font-size:1.2em;margin-left:40px">通知类型</p>
									  <p><input type="checkbox" id="way1" name="way1"  onclick="exe()"   style="margin-top:-68px;margin-left:140px;width:30px;height:30px" value="短信"><p style="margin-top:-65px;font-size:1.2em;margin-left:180px">短信</p></p>
							  		  <p><input type="checkbox" id="way2" name="way2"  onclick="exeEmail()"   style="margin-top:-77px;margin-left:240px;width:30px;height:30px" value="邮件"><p style="margin-top:-69px;font-size:1.2em;margin-left:277px">邮件</p></p>
							    	  <p><input type="checkbox" id="way3" name="way3"  checked   style="margin-top:-78px;margin-left:340px;width:30px;height:30px" value="本网站提示" readonly="readonly"><p style="margin-top:-70px;font-size:1.2em;margin-left:379px;" >本网站提示</p></p>
							           <p id="ph"  style="margin-top:30px;font-size:1.2em;margin-left:40px;display:none;" >手机号码<p><input type="text" placeholder="请输入11位正确手机号" id="phone" name="phone"  onblur="Isphone()" class="form-control"  style="margin-top:-38px;margin-left:135px;display:none;" >
							    		<p id="em" style="margin-top:30px;font-size:1.2em;margin-left:40px;display:none;">通知邮箱<p><input type="text" placeholder="请输入正确邮箱" id="email" name="email"  class="form-control"   onblur="Isemail()" style="margin-top:-38px;margin-left:135px;display:none;">
							            <p style="margin-top:30px;font-size:1.2em;margin-left:40px">处理状态<p>
							                   <select class="form-control"  id="status" name="status" style="margin-top:-46px;margin-left:135px" >
																		     <option >已查看，处理</option>										
																		     <option >已预警，未处理</option>						
																		     <option >未预警</option>						
												 </select>
							    </div>
							    <div class="col-lg-offset-2 col-lg-10" style="height:100px">
                                          <button class="btn btn-primary" type="submit" style="width:400px;margin-left:-45px;margin-top:20px">添加</button>
                                 </div>
                      
						</form>

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
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
	]
});
<%
%>
</script>
<!-- 手机号和邮箱合法性验证 -->
<script>
function Isphone(){
	var phone=document.getElementById('phone').value
	  var flag = false;
	var message = "";
	var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[4-9]{1})|(18[0-9]{1})|(199))+\d{8})$/;
	if (!myreg.test(phone)) {
	    // console.log("手机号码不能为空");
	    message = "请输入有效的手机号码！";  
		alert(message)
	} else if (phone.length != 11) {
	    //console.log("请输入11位手机号码！");
	    message = "请输入11位手机号码！";
		alert(message)
	} else if (phone=='') {
	    //console.log("请输入有效的手机号码！");
	    message = "不能为空";
		alert(message)
	}
	}
function Isemail(){
	var em=document.getElementById('email').value
	 if (em == "")
		   {
		     alert("请输入电子信箱!");
		   }
		   else{
		  //对电子邮件的验证
		  var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		   if(!myreg.test(em)){
		    alert('提示:请输入有效的E_mail！');
		   }
		}
	 }
</script> 
 <%  for(JingNews jn:yvNew)//发邮件
            {
            	if((Integer.parseInt(jn.getHot())>10000)||Integer.parseInt(jn.getHot())>Integer.parseInt(jn.getHot110().substring(0,jn.getHot110().indexOf("-"))))
            	{
            		mailTest.testSendEmail(jn.getTitle(), jn.getUrl());
            		System.out.println("发邮件提示");
            	}
            
            } 
%>         

                     