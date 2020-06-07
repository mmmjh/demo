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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册页</title>
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
  String username="";String pwd="",OKpwd="";
  if(request.getParameter("username")!=null){
	  username=request.getParameter("username");
	  user.setUsername(request.getParameter("username"));
  }
  if(request.getParameter("password")!=null){
	  user.setPassword(request.getParameter("password"));
	  pwd=request.getParameter("password");
	  res =UserDaoImpl.add(user);
  }
  if(request.getParameter("OKpassword")!=null){
	  OKpwd=request.getParameter("OKpassword");
  }

  %>
  <script>
  <%if(res.equals("注册成功")){
	  session.setAttribute("userReg", user);
  %>
  window.location.href="login.jsp";
  <%}else if(!res.equals("")){%>
  alert(<%=res%>)
  <%}%>
  </script>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>网络舆情监控系统</h1>
                  </div>
                  <p>海量数据，深度挖掘。</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                   <form action="register.jsp" method="post" class="form-validate">
                    <div class="form-group">
                      <input id="username"  name="username" type="text" name="registerUsername" required data-msg="Please enter your username" class="input-material">
                      <label for="register-username" class="label-material">用户名</label>
                    </div>
                    <div class="form-group">
                      <input id="password" name="password" type="password" name="registerEmail" required data-msg="Please enter a valid email address" class="input-material">
                      <label for="register-email" class="label-material">密码     </label>
                    </div>
                    <div class="form-group">
                      <input id="OKpassword" name="OKpassword" type="password" name="registerPassword" required data-msg="Please enter your password" class="input-material">
                      <label for="register-password" class="label-material">确认密码        </label>
                    </div>
                    <div class="form-group">
                      <button id="regidter" type="submit" name="registerSubmit" class="btn btn-primary" style="width:500px">Register</button>
                    </div>
                  </form><small>已有账号? </small><a href="login.html" class="signup">登录</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>网络舆情监控系统<a href="http://www.cssmoban.com/" target="_blank" title="模板之家"></a> <a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a></p>
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