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
    <meta content="text/html; charset=gbk" http-equiv="content-type">
    <title></title>
    <style type="text/css">
  .time_line_box{
        position: relative;
        height: 60px;
        overflow: hidden;
    }
    .time_line{
        position: absolute;
    z-index: 1;
    left: 0;
    top: 49px;
    height: 2px;
    background: #dfdfdf;
    -webkit-transition: -webkit-transform 0.4s;
    -moz-transition: -moz-transform 0.4s;
    transition: transform 0.4s;
    }
    .order_item{
        position: absolute;
    bottom: 0;
    z-index: 2;
    text-align: center;
    font-size: 13px;
    padding-bottom: 15px;
    color: #825FFB;
    }
    .order_item:after{
        content: '';
    position: absolute;
    left: 50%;
    right: auto;
    transform: translateX(-50%);
    bottom: -5px;
    height: 10px;
    width: 10px;
    border-radius: 50%;
    border: 2px solid #dfdfdf;
    background-color: #f8f8f8;
    }
    .selected:after{
        background-color: #845FFD;
    border-color: #845FFD;
    }
    .filling_line{
        position: absolute;
    z-index: 1;
    left: 0;
    top: 0;
    height: 100%;
    width: 100%;
    background-color: #845FFD;
    transform-origin: left center;
    transition-property: transform;
    transition-duration: 0.3s;
    transition-timing-function: initial;
    transition-delay: initial;
    }
    .time_tip{
        width: 100%;
        height: 100px;
        line-height: 70px;
        text-align: center;
        color: #151BFD;
        border-bottom: 1px solid #ddd;
    }
  </style>
  </head>
  <body>
  <div class="time_line_box">
            <div class="time_line" style="width:100%;">
                <ol>
                    <li>
                        <a class="order_item" style="left:10%;">预约</a>
                    </li>
                    <li>
                        <a class="order_item selected" style="left:25%;">行家确认</a>
                    </li>
                    <li>
                        <a class="order_item" style="left:45%;">付款</a>
                    </li>
                    <li>
                        <a class="order_item" style="left:65%;">见面</a>
                    </li>
                    <li>
                        <a class="order_item" style="left:85%;">评价</a>
                    </li>
                </ol>
                <span class="filling_line" style="transform: scaleX(0.28);"></span>
            </div>
        </div>
        <div class="time_tip">
                付款剩余时间：23：58
        </div>
  </body>
</html>
