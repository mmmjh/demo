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
<%@page import="com.model.User"%>
<%@page import="com.utils.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录页</title>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
  <%
  request.setCharacterEncoding("UTF-8");
  User user=new User(); String res="";
  if(request.getParameter("username")!=null){
	  user.setUsername(request.getParameter("username"));
  }
  if(request.getParameter("password")!=null){
	  user.setPassword(request.getParameter("password"));
	  res= UserDaoImpl.loadUser(user);
	  
  }
  System.out.println(request.getParameter("username")+"\t"+request.getParameter("password"));
  %>
  <script>
  <%if(res.equals("登陆成功")){
	  session.setAttribute("user", user);
	  if(!user.getUsername().equals("root")){
  %>
  	  window.location.href="index.jsp";
 <% 
	  }
	  else{
	%>
	  window.location.href="Manager/manager.jsp";
	<%
	  }
  }
  else if(!res.equals("")){
  %>
  alert('<%=res%>')
  <%}%>
  </script>
  <body>
    <div class="page login-page" >
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>网络舆情监控系统</h1>
                  </div>
                  <p>海量信息，等你挖掘。</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white" >
              <div class="form d-flex align-items-center">
                <div class="content">
                   <form action="login.jsp" method="post"  class="form-validate">
                    <div class="form-group">
                      <input id="username"   name="username"  type="text" name="loginUsername" required data-msg="Please enter your username" class="input-material">
                      <label for="login-username" class="label-material">用户名</label>
                    </div>
                    <div class="form-group">
                      <input id="password" name="password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                      <label for="login-password" class="label-material">密码</label>
                    </div>    <button type="submit" class="btn btn-primary" style="height:40px">开始检索</button>
                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                  </form>
                  <a href="#" class="forgot-pass">忘记密码?</a><br><small>没有账户? </small><a href="register.jsp" class="signup">注册</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>网络舆情监控系统 <a href="#" class="external"></a>
          <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
        </p>
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