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
<%@page import="com.paNews.*"%>
<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="人力资源管理平台" />
<title>人力资源管理平台</title>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/fontastic.css">
    <link rel="stylesheet" href="../https://fonts.googleapis.com/css?family=Poppins:350,400,700">
    <link rel="stylesheet" href="../css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="../css/custom.css">

<link type="text/css" rel="stylesheet" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<style type="text/css">
        *{
            padding: 0%;
            margin: 0%;
        }

        html, body{
            background:#f2f2f2;
        }

        .calendar{
            margin: 45px;
            width: 450px;
            height: 350px;
            background: white;
            box-shadow: 0px 1px 1px rgba(0,0,0,.1);
        }

        .title{
            height: 70px;
            border-bottom: 1px solid rgba(0,0,0,.1);
            position: relative;
            text-align: center;
        }

        #calendar-title{
            font-size: 25px;
            text-transform: uppercase;
            font-family: Arial, Helvetica, sans-serif;
            padding: 14px 0 0 0;
        }

        #calendar-year{
            font-size: 15px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: normal;
        }

        #pre{
            position: absolute;
            top: 0px;
            left: 0px;
            background: url(prev.png) no-repeat 50% 50%;

            /*没规定大小时，图片显示 0X0*/
            width: 60px;
            height: 70px;
            
        }

        #next{
            position: absolute;
            top: 0px;
            right: 0px;
            background: url(next.png) no-repeat 50% 50%;
            width: 60px;
            height: 70px;
        }  

        .body-list ul{
            font-size: 14px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            width: 100%;
            box-sizing: border-box;
      
        }  

        .body-list ul li{
            list-style: none;
            /*
            display:inline-block; 
            width: 13.3%;
            */

            /*100/7 = 14.28%*/
            display: block;
            width: 14.28%;
            float: left;

            /*规定行高，垂直居中*/
            height: 36px;
            line-height: 36px;
            box-sizing: border-box;
            text-align: center;
            
        }


        .green{
            color:#6ac13c;
        }

        .lightgrey{ /*浅灰色显示过去的日期*/
	        color:#a8a8a8;
        }   
        .darkgrey{ /*深灰色显示将来的日期*/
	        color:#565656;
        }

        /*日期当天用绿色背景绿色文字加以显示*/
        .greenbox{
            border: 1px solid #6ac13c;
            background: #e9f8df;
        }
    </style>
</head>
<body>
<div class="header">
  <div class="top" > <p style="font-size:1.5em;color:#fff;font-weight:700px;"><span style="margin-top:7px">舆情查 网络舆情监控平台</span></p>
    <ul class="nav" style="margin-top:-50px;margin-left:370px">
      <li class="seleli"><a href="#">信息管理</a></li>
      <li style="margin-left:800px"><a href="../index.jsp">进入网站首页</a></li>
	   <li style="margin-left:10px"><a href="#">退出</a></li>
    </ul>
  </div>
</div>

  <div id="nav">
  <iframe src="../manager.jsp" style="width:370px;height:830px"></iframe>
  </div>
 <%
	request.setCharacterEncoding("UTF-8");
	String keyword="互联网";
	if(request.getParameter("act")!=null)//关键字
	{	WYNewsDaoImpl.deleID();
	%>
	<script>
	alert("已去重！");
	</script>
	<% 
	System.out.println("去重成功");
	}
	if(request.getParameter("add")!=null)//关键字
	{	
			py.qqnews();
			System.out.println("爬虫成功");
			%>
			<script>
			alert("已爬取数据！");
			</script>
			<% 
	}
	if(request.getParameter("delete")!=null)//关键字
	{	
			WYNewsDaoImpl.delete(request.getParameter("delete"));
			%>
			<script>
			alert("已删除该数据！");
			</script>
			<% 
	}
 %>


    <div class="rig_link" style="margin-left:400px;height:93px;margin-top:-820px">
      <ul>
        <li><a href="manager.jsp?add=de"><img src="images/img_02.jpg" alt="" title=""><p style="margin-left:35px;margin-top:-20px;color:black;font-weight:700;">新闻爬取</p></a></li>
        <li><a href="manager.jsp?act=del"><img src="images/img_03.jpg" alt="" title=""><p style="margin-left:35px;margin-top:-20px;color:black;font-weight:700;">新闻去重</p></a></li>
		<li><a href="https://mail.163.com"><img src="images/img_01.jpg" alt="" title=""><p style="margin-left:35px;margin-top:-20px;color:black;font-weight:700;">进入邮箱</p></a></li>
      </ul>
    </div>
    <div class="rig_lm03" style="width:1200px;margin-left:400px;marin-top:30px;height:40px">
      <div class="title" style="height:40px"><img src="images/listicon.jpg" class="icon" style="padding-top:13px;margin-left:-396px">
        <h2 style="margin-left:-376px">信息管理</h2>
      </div>
      <div class="detail">
        <div class="inner03">
          <div id="tabCot_product" class="zhutitab">
            <div class="tabContainer" style="height:54px">
              <ul class="tabHead" id="tabCot_product-li-currentBtn-" style="margin-left:-0px">
                <li class="currentBtn"><a href="javascript:void(0)" title="绩效考核" rel="1">舆情管理</a><span class="grey_numb"></span></li>
                <li ><a href="javascript:void(0)" title="人事考核" rel="2">用户管理</a><span class="red_numb"></span></li>
                <li ><a href="javascript:void(0)" title="TAB名称" rel="3">个人信息设置</a><span class="red_numb"></span></li>
              </ul>
              <div class="clear"></div>
            </div>
            <div id="tabCot_product_1" class="tabCot"  >         
		    <%
		    WYNewsDaoImpl wys=new WYNewsDaoImpl();
		    List<WYNews> wynew = wys.loadallFind("","","","","","","","","","","","","","","","");
		    %>    
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
								<th width="100" style="font-size:1.1em">操作</th>
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
								<td class="f-14">
									<a title="删除" href="manager.jsp?delete=<%=user.getTitle()  %>" onclick="system_data_del(this,'10001')"  style="text-decoration:none;margin-left:-10px"><i class="Hui-iconfont">&#xe6e2;</i></a>
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
     		</div>
     		<%
     		List<User> users=UserDaoImpl.load();
     		%>
            <div id="tabCot_product_2" class="tabCot"  style="display: none;">
            	<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="r">共有数据：<strong><%=users.size() %></strong> 条</span>
			</div>	
			<div class="mt-20">
					<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
						<td  width="95"><input type="checkbox" value="" name=""></td>
							<th width="95" style="font-size:1.1em">ID</th>
							<th width="130" style="font-size:1.1em">用户名</th>
							<th width="95" style="font-size:1.1em">密码</th>
							<th width="105" style="font-size:1.1em">手机号码</th>
							<th width="100" style="font-size:1.1em">邮箱</th>
							<th width="110" style="font-size:1.1em">操作</th>
						</tr>
					</thead>
					<tbody>		
					<%
						   num=0;
							  for( User user : users ){
								  if(!user.getUsername().equals("root")){
								  num++;
							%>			
						<tr class="text-c">
						<td><input type="checkbox" value="" name=""></td>
							    <td> <%=num%></td>
								<td><%=user.getUsername()%></a></td>
								<td> <%=user.getPassword() %></td>
								<td> <%=user.getPhone()%></td>
								<td> <%=user.getEmail() %></td>
							<td class="f-14">
								<a title="修改" href="javascript:;" onclick="system_data_del(this,'10001')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
					
							</td>
						</tr>
						<%}} %>
					</tbody>
				</table>
			</div>
             </div>
            <div id="tabCot_product_3" class="tabCot"  style="display: none;"> 
            <%
            User user=(User)session.getAttribute("user");//当前登录用户
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
        	if(!newOne.equals("")){
       		 	String getPwd=UserDaoImpl.loadUserPWD("root");//查找旧密码
        	//System.out.println(getPwd+"旧的");
        	if(!getPwd.equals(old)){
       		%>
       		<script>
       			alert("旧密码错误！");
       			</script>
       		<%}
       		if(!newOne.equals("")&&getPwd.equals(old))
       		{	UserDaoImpl.update1("root", newOne);
       		%>
       		<script>
       			alert("密码修改成功！");
       			</script>
       		<%
       		}}
            %>
              <form class="form-horizontal" action="manager.jsp" method="post">
                                      <div class="form-group" style="border: 1px solid #e6e6e6;margin-left:350px;margin-top:40px">
                                        <h5>修改用户信息</h5>
                                        <hr/>
                                        <div class="col-lg-10">
                                          <p style="margin-top:30px">用户名<p><input  disabled="disabled" type="text"  value="<%=user.getUsername() %>"    id="name" name="name"  class="form-control"  style="margin-top:-46px;margin-left:105px">
                                             <p style="margin-top:30px">旧密码</p><input type="password"   placeholder=" 请输入旧密码" id="old" name="old" class="form-control"  style="margin-top:-46px;margin-left:105px" >
                                           <p style="margin-top:30px">新密码</p><input type="password" placeholder=" 请输入新密码" id="new" name="new" class="form-control"  style="margin-top:-46px;margin-left:105px" >
                                          <p style="margin-top:30px">确认新密码</p><input type="password"  onblur="Isnull()"  placeholder=" 确认新密码" id="newTwo" name="newTwo" class="form-control"  style="margin-top:-46px;margin-left:105px">
                                        </div>
                                                                              <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10" style="">
                                          <button class="btn btn-primary" type="submit" style="width:400px;margin-left:-50px;margin-top:30px">修改提交</button>
                                        </div>
                                      </div>
                                      </div>

                  </form>
            <p>注：管理员账户名不可修改，初始密码为：root</p>
             </div>
            <script language="JavaScript" type="text/javascript" src="js/tab.js"></script> 
          </div>
        </div>
      </div>
      <hr style="margin-top:40px;margin-left:0px"/>
    </div>
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

</body>
</html>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

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
 <script type="text/javascript">
        var month_olypic = [31,29,31,30,31,30,31,31,30,31,30,31];//闰年每个月份的天数
        var month_normal = [31,28,31,30,31,30,31,31,30,31,30,31];
        var month_name =["January","Febrary","March","April","May","June","July","Auguest","September","October","November","December"];
        //获取以上各个部分的id
        var holder = document.getElementById("days");
        var prev = document.getElementById("prev");
        var next = document.getElementById("next");
        var ctitle = document.getElementById("calendar-title");
        var cyear = document.getElementById("calendar-year");
        //获取当天的年月日
        var my_date = new Date();
        var my_year = my_date.getFullYear();//获取年份
        var my_month = my_date.getMonth(); //获取月份，一月份的下标为0
        var my_day = my_date.getDate();//获取当前日期

        //根据年月获取当月第一天是周几
        function dayStart(month,year){
            var tmpDate = new Date(year, month, 1);
            return (tmpDate.getDay());
        }
        //根据年份判断某月有多少天(11,2018),表示2018年12月
        function daysMonth(month, year){
            var tmp1 = year % 4;
            var tmp2 = year % 100;
            var tmp3 = year % 400;

            if((tmp1 == 0 && tmp2 != 0) || (tmp3 == 0)){
                return (month_olypic[month]);//闰年
            }else{
                return (month_normal[month]);//非闰年
            }
        }
        //js实现str插入li+class,不要忘了用innerhtml进行插入
        function refreshDate(){
            var str = "";
            //计算当月的天数和每月第一天都是周几，day_month和day_year都从上面获得
            var totalDay = daysMonth(my_month,my_year);
            var firstDay = dayStart(my_month, my_year);
            //添加每个月的空白部分
            for(var i = 0; i < firstDay; i++){
                str += "<li>"+"</li>";
            }

            //从一号开始添加知道totalDay，并为pre，next和当天添加样式
            var myclass;
            for(var i = 1; i <= totalDay; i++){
                //三种情况年份小，年分相等月份小，年月相等，天数小
                //点击pre和next之后，my_month和my_year会发生变化，将其与现在的直接获取的再进行比较
                //i与my_day进行比较,pre和next变化时，my_day是不变的
                console.log(my_year+" "+my_month+" "+my_day);
                console.log(my_date.getFullYear()+" "+my_date.getMonth()+" "+my_date.getDay());
                if((my_year < my_date.getFullYear())||(my_year == my_date.getFullYear() && my_month < my_date.getMonth()) || (my_year == my_date.getFullYear() && my_month == my_date.getMonth() && i < my_day)){
                    myclass = " class='lightgrey'";
                }else if(my_year == my_date.getFullYear() && my_month == my_date.getMonth() && i == my_day){
                    myclass = "class = 'green greenbox'";
                }else{
                    myclass = "class = 'darkgrey'";
                }
                str += "<li "+myclass+">"+i+"</li>";
            }
            holder.innerHTML = str;
            ctitle.innerHTML = month_name[my_month];
            cyear.innerHTML = my_year;
        }
        //调用refreshDate()函数，日历才会出现
        refreshDate();
        //实现onclick向前或向后移动
        pre.onclick = function(e){
            e.preventDefault();
            my_month--;
            if(my_month < 0){
                my_year--;
                my_month = 11; //即12月份
            }
            refreshDate();
        }
        
        next.onclick = function(e){
            e.preventDefault();
            my_month++;
            if(my_month > 11){
                my_month = 0;
                my_year++;
            }
            refreshDate();
        }
    </script>