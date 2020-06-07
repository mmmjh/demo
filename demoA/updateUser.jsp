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
    <title>用户信息</title>
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
        	User userget=(User)session.getAttribute("user");//当前登录用户
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
                <li class="nav-item"><a href="login.jsp" class="nav-link logout"> <span class="d-none d-sm-inline">退出</span><i class="fa fa-sign-out"></i></a></li>
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
                    <li><a href="BigData.jsp"> <i class="fa fa-bar-chart"></i>数据大屏</a></li>
                     <li><a href="#exampledropdownDropdown1" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>专题舆情</a>
                      <ul id="exampledropdownDropdown1" class="collapse list-unstyled ">
                        <li><a href="KeyWords.jsp">专题词设置</a></li>
                         <li><a href="Keycharts.jsp">专题舆情分析</a></li>
                      </ul>
                    </li>
                    <li><a href="#exampledropdownDropdown2" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>用户中心</a>
                      <ul id="exampledropdownDropdown2" class="collapse list-unstyled ">
                         <li><a href="updateUser.jsp">个人信息设置</a></li>
                        <li><a href="#">关于</a></li>
                      </ul>
                    </li>
        </nav>  <!-- Sidebar Navidation Menus--><span class="heading">菜单栏</span>
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
        <div class="content-inner" style="background-image:url(bak.jpg)  ;background-size:100% 100%; background-repeat:no-repeat ;">
       <div class="col-lg-8" style="margin-top:20px;margin-left:33px">
                  <div style="width:1307px;height:800px;background-color:#fff">
                    <div class="card-header d-flex align-items-center" >
                      <h3 class="h4">修改账户信息</h3>
                    </div>
                      <%
        	User user=(User)session.getAttribute("user");
            %>
               <%
            request.setCharacterEncoding("UTF-8");
            String old="",newOne="",newTwo="",name="";
        	if(request.getParameter("old")!=null)//关键字
        		old=request.getParameter("old");
        	if(request.getParameter("name")!=null)//关键字
        		name=request.getParameter("name");  
        	if(request.getParameter("new")!=null)//关键字
        		newOne=request.getParameter("new");
        	if(request.getParameter("newTwo")!=null)//关键字
        		newTwo=request.getParameter("newTwo"); 
        	System.out.println(name+"\t"+old+"mmm"+newOne);
        	if(!name.equals("")&&!newOne.equals("")){
       		 	String getPwd=UserDaoImpl.loadUserPWD(name);//查找旧密码
        	//System.out.println(getPwd+"旧的");
        	if(!getPwd.equals(old)){
       		%>
       		<script>
       			alert("旧密码错误！");
       			</script>
       		<%}
       		if(!name.equals("")&&!newOne.equals("")&&getPwd.equals(old))
       		{	UserDaoImpl.update1(name, newOne);
       		%>
       		<script>
       			alert("密码修改成功！");
       			</script>
       		<%
       		}}
            %>
					    <div class="modal-body" style="margin-left:400px;margin-top:80px;border: 1px solid #e6e6e6;width:510px">
                                    <form class="form-horizontal" action="updateUser.jsp" method="post">
                                      <div class="form-group">
                                        <h5>修改用户信息</h5>
                                     <div class="col-lg-10">
                                          <p style="margin-top:30px">用户名<p><input  type="text" value="<%=user.getUsername() %>"    id="name" name="name"  class="form-control"  style="margin-top:-46px;margin-left:105px">
                                             <p style="margin-top:30px">旧密码</p><input type="password"   placeholder=" 请输入旧密码" id="old" name="old" class="form-control"  style="margin-top:-46px;margin-left:105px" >
                                           <p style="margin-top:30px">新密码</p><input type="password" placeholder=" 请输入新密码" id="new" name="new" class="form-control"  style="margin-top:-46px;margin-left:105px" >
                                          <p style="margin-top:30px">确认新密码</p><input type="password"  onblur="Isnull()"  placeholder=" 确认新密码" id="newTwo" name="newTwo" class="form-control"  style="margin-top:-46px;margin-left:105px">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                          <button class="btn btn-primary" type="submit" style="width:400px;margin-left:20px">修改提交</button>
                                        </div>
                                      </div>
                                    </form>
                                  </div>

                  </div>
                </div>
     </div>
</body>
</html>
<script>
function Isnull(){
	var em=document.getElementById('new').value
	var em1=document.getElementById('newTwo').value
	 if (em != em1)
		   {
		     alert("两次密码不一致");
		   }
	 }
</script>

 