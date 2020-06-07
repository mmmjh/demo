<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ways.*"%>
<%@page import="com.model.*"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
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
    <title>新闻中心页</title>
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
                      <h3 class="h4" >多条件检索</h3>
                    </div>
                    <div class="card-body">
                    <!-- 检索开始 -->
                    <%
                    System.out.println("页面开始");
                	//筛选
                	request.setCharacterEncoding("UTF-8");
                	String keyword="";
                	keyword = request.getParameter("keyword");//关键字
                    String xzWay = request.getParameter("xzWay");//行政措施
                    String jrWay = request.getParameter("jrWay");//金融外汇措施
                    String czWay = request.getParameter("czWay");//财政税收措施
                    String peoWay = request.getParameter("peoWay");//人事措施
                    String kno = request.getParameter("kno");//知识产权保护
                    String waiy= request.getParameter("wy");//外资引进
                    String res = request.getParameter("res");//执行力度、成果
                    String jis= request.getParameter("jis");//技术引进
                    String gai= request.getParameter("gai");//改进创新
                    String jians=request.getParameter("jians");//科技建设
                    String peo = request.getParameter("peo");//科技人物专写
                    String normal= request.getParameter("normal");//自然事件
                    String pi= request.getParameter("pi");//批评类新闻
                    String qita=request.getParameter("else");//其他
                    String loc="";
                    if(request.getParameter("ocationCi")!=null)
                    	loc=request.getParameter("ocationCi");
                    
                //    String[]aa=new String[]{"诺贝尔"}; 
                   // aa =keyword.split("\\s+");//分割关键字
                    if(keyword== null || "".equals(keyword))
                		keyword = "";
                	if(xzWay == null || "".equals(xzWay ))
                		xzWay  = "";
                	if(jrWay== null || "".equals(jrWay))
                		jrWay = "";
                	if(czWay== null || "".equals(czWay))
                		czWay = "";
                	if(peoWay== null || "".equals(peoWay))
                		peoWay = "";
                	if(kno== null || "".equals(kno))
                		kno= "";
                	if(waiy== null || "".equals(waiy))
                		waiy = "";
                	if(res ==null)
                		res="";
                	if(jis==null)
                		jis="";
                	if(gai==null)
                		gai="";
                	if(jians==null)
                		jians="";
                	if(peo==null)
                		peo="";
                	if(normal==null)
                		normal="";
                	if(pi==null)
                		pi="";
                	if(qita==null)
                		qita="";
                		//分页的条件
					int pageIndex = 1;
					int pageSize = 15;
					try{
						pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
	                    System.out.println("做一个输出："+pageIndex +keyword);
					}catch(Exception e){
					}
				    //System.out.println("多条件\t"+keyword+xzWay +jrWay+czWay+peoWay+kno+waiy+res+jis+gai+jians+peo+normal+pi+qita);
                    WYNewsDaoImpl wys=new WYNewsDaoImpl();
                    List<WYNews> wynew = wys.loadallFind(keyword,xzWay,jrWay,czWay,peoWay,kno,waiy,res,jis,gai,jians,peo,normal,pi,qita,loc);
 
                    %>
                   
                      <form class="form-horizontal" action="find.jsp" method="post">
                        <div class="form-group row">
                          <label class="col-sm-3 form-control-label" style="margin-left:150px">关键字</label>
                          <div class="col-sm-9"   style="margin-top:-40px;margin-left:200px">
                            <input type="text" class="form-control" id="keyword" name="keyword" style="width:1000px">
                            <small class="help-block-none">多关键字之间用空格间隔</small>
                          </div>
                        </div>         
                        <div class="line" style="margin-top:-10px;"></div>
                         
                        <div class="form-group row" style="margin-left:190px;margin-top:-25px">
                          <label class="col-sm-3 form-control-label">(政策)措施</label>
                          <div class="col-sm-9" style="margin-left:-150px">
                            <label class="checkbox-inline">
                              <input id="xzWay" name="xzWay" type="checkbox" value="行政措施"> 行政措施
                            </label>
                            <label class="checkbox-inline" style="margin-left:15px">
                              <input id="jrWay"  name="jrWay"  type="checkbox" value="金融外汇措施">金融外汇措施
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="czWay"  name="czWay" type="checkbox" value="财政税收措施">财政税收措施
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="peoWay"  name="peoWay" type="checkbox" value="人事措施">人事措施
                            </label>
                          </div>
                          </div>
                            <div style="margin-top:-30px"><label class="col-sm-3 form-control-label" style="margin-left:137px;">多条件</label></div>
                            <div class="form-group row" style="margin-left:-290px;margin-top:-10px" >
                          <label class="col-sm-3 form-control-label"  style="margin-left:-277px;margin-top:15px" >(政策)目标</label>
                          <div class="col-sm-9" style="margin-left:-76px;width:800px;margin-top:15px">
                            <label class="checkbox-inline">
                              <input id="kno"  name="kno" type="checkbox" value="知识产权保护"> 知识产权保护
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="wz" name="wz"  type="checkbox" value="外资引进">外资引进
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="res" name="res"  type="checkbox" value="执行力度、成果">执行力度、成果
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="jis" name="jis"  type="checkbox" value="技术引进">技术引进
                            </label>
                             <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="gai" name="gai"  type="checkbox" value="改进创新">改进创新
                            </label>
                             <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="jians" name="jians" type="checkbox" value="科技建设">科技建设
                            </label>
                          </div>
                        </div>
                        <div class="form-group row" style="margin-left:190px;margin-top:-10px">
                          <label class="col-sm-3 form-control-label" >(科技)相关</label>
                          <div class="col-sm-9" style="margin-left:-150px">
                            <label class="checkbox-inline">
                              <input id="peo" name="peo" type="checkbox" value="科技人物专写"> 科技人物专写
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="norlmal" name="normal" type="checkbox" value="自然事件">自然事件
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="pi" name="pi" type="checkbox" value="批评类新闻">批评类新闻
                            </label>
                            <label class="checkbox-inline"  style="margin-left:15px">
                              <input id="else" name="else" type="checkbox" value="其他">其他
                            </label>
                          </div>
                          </div>
                           <div class="line" style="margin-top:-10px;"></div>
                            <div class="form-group row" style="margin-left:140px;margin-top:-10px">
                          <label class="col-sm-3 form-control-label" >区域选择</label>
                          <div class="col-sm-9" style="margin-left:-150px">
                             <select class="form-control" id="locationCi" name="locationCi" style="border-radius: 15px; margin-top:0px;margin-left:-40px;height:30px;width:600px" >
												    <%
												    String loca="全部，上海，乌鲁木齐，北京，南京，南昌，厦门，合肥，呼和浩特，咸阳，哈尔滨，新疆，西藏，黑龙江，吉林，辽宁，内蒙古，宁夏，山西，青海，甘肃，山东，陕西，河南，安徽，江苏，上海，四川，贵州，江西，湖南，浙江，湖北，福建，云南，台湾，广西，广东，香港，澳门，海南";
												   String[]locs=loca.split("，");
												   for(int i=0;i<locs.length;i++){
												    %>
												    <option ><%=locs[i] %></option>		
												    <%} %>														
												</select>
                          </div>
                    
                             <button type="submit" class="btn btn-primary" style="height:40px">开始检索</button>
                          </div>
                             </form>
                             <!-- 检索结束，下面显示结果 -->
                        <div class="line"></div>
                      <div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		
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
    