<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ways.*"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>负面新闻页</title>
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--引用百度地图API-->
    <script src="http://api.map.baidu.com/api?key=&amp;v=1.1&amp;services=true" type="text/javascript"></script>
       <meta charset="utf-8">
<title>多条件检索页面</title>
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
      <header class="header">
         <nav class="navbar" style="background-color:#5e87b0">
          <!--搜索框-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="输入要搜索的内容..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!--上部栏-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="index.jsp" class="navbar-brand d-none d-sm-inline-block">
                  <div class="brand-text d-none d-lg-inline-block"><span>网络舆情 </span><strong>监控系统</strong></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- 上部 -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!--搜索栏-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                 <%
        	User userget=(User)session.getAttribute("user");//当前登录用户
            %>
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
               
                <!-- 退出登录    -->
                <li class="nav-item"><a href="login.html" class="nav-link logout"> <span class="d-none d-sm-inline">退出</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
     <div class="page-content d-flex align-items-stretch"    style="background-color:#cfd9f1"> 
        <nav class="side-navbar">
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">

                <h1 class="h4">你好！<%=userget.getUsername() %></h1>

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
              <li class="breadcrumb-item" style="margin-top:-15px"><a href="index.jsp">首页</a></li>
              <li class="breadcrumb-item active" style="margin-top:-15px">舆情中心</li>
            </ul>
          </div>
          <!-- Forms Section-->
          <section class="forms"> 
            <div class="container-fluid">
              <div class="row">
            
                <!-- Form Elements -->
                <div class="col-lg-12">
                  <div class="card">
                    <div class="card-close">
                      <div class="dropdown" style="margin-top:-30px">
                        <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                      </div>
                    </div>
                    <div class="card-header d-flex align-items-center" style="margin-top:-30px;height:50px">
                      <h3 class="h4" >负面舆情中心</h3>
                    </div>
                    <div class="card-body" style="margin-top:-20px">
						<% 
						request.setCharacterEncoding("UTF-8");
						//String sqlBad= request.getParameter("aa");//sql语句
						String sqlBad=(String)session.getAttribute("sqlBad");
						System.out.println(sqlBad+"\tdemo");
						List<WYNews> wynew=WYNewsDaoImpl.load(sqlBad);
						%>
                      <div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="r">共有数据：<strong><%=wynew.size() %></strong> 条</span>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
				<td><input type="checkbox" value="" name=""></td>
					<th width="95" style="font-size:1.1em">ID</th>
					<th width="130" style="font-size:1.1em">新闻标题</th>
					<th width="95" style="font-size:1.1em">关键字</th>
					<th width="105" style="font-size:1.1em">情感</th>
					<th width="100" style="font-size:1.1em">类别</th>
					<th width="100" style="font-size:1.1em">来源</th>
					<th width="80" style="font-size:1.1em">发表时间</th>
					<th width="105" style="font-size:1.1em">热度</th>
					<th width="110" style="font-size:1.1em">操作</th>
				</tr>
			</thead>
			<tbody>		
			<%
					  int num=0;
					  for( WYNews user : wynew ){
						  num++;
					%>			
				<tr class="text-c">
				<td><input type="checkbox" value="" name=""></td>
					    <td> <%=num%></td>
						<td><a href="<%=user.getUrl()%>"> <%=user.getTitle() %></a></td>
						<td> <%=user.getKeywords() %></td>
						<td> <%=user.getEmotion()%></td>
						<td> <%=user.getType() %></td>
						<td> <%=user.getPublisher() %></td>
						<td> <%=user.getTime() %></td>
						<td> <%=user.getHotnum() %></td>
					<td class="f-14"><a style="text-decoration:none"  href="New110.jsp?title=<%=user.getTitle() %>"  title="加入预警"><img src="image/add.jpg" style="width:15px;height:15px"></a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</div>
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
					</script>
                   <div class="line" ></div>
                   <label >图表展示<br></label>
                   <div id="main" style="margin-left:70px;height:300px;width:1200px;margin-top:-10px;border: 2px solid;border-radius: 25px;"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- 底部-->
          <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                                  <p>邮箱 &copy; Hebeimjhui@163.com <a href="#" target="_blank" title="模板之家">石家庄铁道大学</a> - 软件工程系 <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">马佳慧</a></p>
                </div>
                <div class="col-sm-6 text-right">
                  <p></p>
                
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
        var chart = echarts.init(document.getElementById('main')); 
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
        	        size: ['120%', '120%'],
        	        gridSize: 1,
                    sizeRange: [12, 50],
                    rotationRange: [-30, 90],
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
     	              for( WYNews user : wynew ){
     	            	allword+= user.getKeywords();
     	            	allword+=",";
     	              }
     	             String []keys=Nums.ciNum(allword,",");
     	             int lenk=0;
     	             if(keys.length>200)
     	            	 lenk=200;
     	             else
     	            	 lenk=keys.length;
     				for(int i=0;i<lenk;i++){
     				%>
     				 {
     					 name: '<%=keys[i].substring(0,keys[i].indexOf("="))%>',
     					  value: <%=keys[i].substring(keys[i].indexOf("=")+1,keys[i].length())%>*10, 
     	                itemStyle: createRandomItemStyle()        	               
     	            },
     	        	<%
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
      	window.location.href="zaiti.jsp?a="+name;
      });
       
    </script>
    