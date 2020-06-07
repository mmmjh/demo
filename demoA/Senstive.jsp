<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ways.*"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io. BufferedWriter "%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
    <title>敏感词设置页</title>
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
        <%
        request.setCharacterEncoding("UTF-8");
  		String con1="互联网";
            		  System.out.println(request.getParameter("con1")+"mmm");
        if( request.getParameter("con1")!=null)
        {	
        	con1 = request.getParameter("con1");//关键字
        	FileOutputStream fos = new FileOutputStream("C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\暴恐词库.txt",false);//连续向文件写入而不是替换内容
    		OutputStreamWriter osw = new OutputStreamWriter(fos, "gbk");
    		osw.write(con1);
    		osw.close();
    		System.out.println("更新");
        }
    	String con2="互联网";
        if( request.getParameter("con2")!=null)
        {	
        	con2 = request.getParameter("con2");//关键字
        	FileOutputStream fos = new FileOutputStream("C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\反动词库.txt",false);//连续向文件写入而不是替换内容
    		OutputStreamWriter osw = new OutputStreamWriter(fos, "gbk");
    		osw.write(con2);
    		osw.close();
    		System.out.println("更新");
        }
    	String con3="互联网";
        if( request.getParameter("con3")!=null)
        {	
        	con3 = request.getParameter("con3");//关键字
        	FileOutputStream fos = new FileOutputStream("C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\贪腐词库.txt",false);//连续向文件写入而不是替换内容
    		OutputStreamWriter osw = new OutputStreamWriter(fos, "gbk");
    		osw.write(con3);
    		osw.close();
    		System.out.println("更新");
        }
    	String con4="互联网";
        if( request.getParameter("con4")!=null)
        {	
        	con4 = request.getParameter("con4");//关键字
        	FileOutputStream fos = new FileOutputStream("C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\色情词库.txt",false);//连续向文件写入而不是替换内容
    		OutputStreamWriter osw = new OutputStreamWriter(fos, "gbk");
    		osw.write(con4);
    		osw.close();
    		System.out.println("更新");
        }
    	String con5="互联网";
        if( request.getParameter("con5")!=null)
        {	
        	con5 = request.getParameter("con5");//关键字
        	FileOutputStream fos = new FileOutputStream("C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\其他.txt",false);//连续向文件写入而不是替换内容
    		OutputStreamWriter osw = new OutputStreamWriter(fos, "gbk");
    		osw.write(con5);
    		osw.close();
    		System.out.println("更新");
        }
        %>
        
        <%//初始化词库
        String fileName1 ="C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\暴恐词库.txt";
        BufferedReader br1=new BufferedReader(new InputStreamReader(new FileInputStream(fileName1),"gbk"));
    	String line = null;
    	String allLine1="";
    	while ((line = br1.readLine()) != null) {
    		allLine1+=line;
    		allLine1+="\n";
    	}
    	br1.close();
    	
    	 String fileName2 ="C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\反动词库.txt";
         BufferedReader br2=new BufferedReader(new InputStreamReader(new FileInputStream(fileName2),"gbk"));
     	String line2 = null;
     	String allLine2="";
     	while ((line2 = br2.readLine()) != null) {
     		allLine2+=line2;
     		allLine2+="\n";
     	}
     	br2.close();

    	
    	String fileName4 ="C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\色情词库.txt";
        BufferedReader br4=new BufferedReader(new InputStreamReader(new FileInputStream(fileName4),"gbk"));
    	String line4 = null;
    	String allLine4="";
    	while ((line4 = br4.readLine()) != null) {
    		allLine4+=line4;
    		allLine4+="\n";
    	}
    	br4.close();
    	
    	String fileName5 ="C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\贪腐词库.txt";
        BufferedReader br5=new BufferedReader(new InputStreamReader(new FileInputStream(fileName5),"gbk"));
    	String line5 = null;
    	String allLine5="";
    	while ((line5 = br5.readLine()) != null) {
    		allLine5+=line5;
    		allLine5+="\n";
    	}
    	br5.close();
    	
    	String fileName6 ="C:\\马佳慧的\\ecworkspace\\AShow\\WebContent\\Test\\其他.txt";
        BufferedReader br6=new BufferedReader(new InputStreamReader(new FileInputStream(fileName6),"gbk"));
    	String line6 = null;
    	String allLine6="";
    	while ((line6 = br6.readLine()) != null) {
    		allLine6+=line6;
    		allLine6+="\n";
    	}
    	br6.close();
        %>
     <div class="page-content d-flex align-items-stretch"    style="background-color:#cfd9f1"> 
           <div class="col-lg-8" style="margin-top:20px;margin-left:33px">
                  <div style="width:1307px;height:1170px;background-color:#fff">
                    <div class="card-header d-flex align-items-center" >
                      <h3 class="h4">敏感词中心</h3>
                    </div>        
                    <form class="form-horizontal" action="Senstive.jsp" method="post">    
                      		
					   <div id="china-map" style="margin-top:-20px;margin-left:3px;width:1100px;min-height:700px;height:auto">
					    <h3 style="color:blue;margin-top:60px;margin-left:30px">暴恐词库</h3>   
							<div style="border: 1px solid black; margin-left:130px;width:500px;margin-top:-20px" id="id">
								<textarea id="con1"  name="con1" contenteditable="true" style="height:300px;width:500px;" ><%=allLine1 %></textarea>
							</div>
							<h3 style="color:blue;margin-top:-306px;margin-left:660px">反动词库</h3>   
							<div style="border: 1px solid black; margin-left:750px;width:500px;margin-top:-20px" id="id">
								<textarea id="con2"  name="con2" contenteditable="true" style="height:300px;width:500px;" ><%=allLine2 %></textarea>
							</div>
							<h3 style="color:blue;margin-top:30px;margin-left:30px">贪腐词库</h3>   
							<div style="border: 1px solid black; margin-left:130px;width:500px;margin-top:-20px" id="id">
								<textarea id="con3"  name="con3" contenteditable="true" style="height:300px;width:500px;" ><%=allLine5 %></textarea>
							</div>
							<h3 style="color:blue;margin-top:-306px;margin-left:660px">色情词库</h3>   
							<div style="border: 1px solid black; margin-left:750px;width:500px;margin-top:-20px" id="id">
								<textarea id="con4"  name="con4" contenteditable="true" style="height:300px;width:500px;" ><%=allLine4 %></textarea>
							</div>
						
						<h3 style="color:blue;margin-top:30px;margin-left:30px">其他词库</h3>   
							<div style="border: 1px solid black; margin-left:130px;width:500px;margin-top:-20px" id="id">
								<textarea id="con5"  name="con5" contenteditable="true" style="height:300px;width:500px;" ><%=allLine6 %></textarea>
							</div>
							<button class="btn btn-primary"  type="submit" style="width:800px;margin-left:250px;margin-top:10px;">提交修改</button>
                  </div>
                  </form>
                </div>
        </div>
   </div>


</body>
</html>
