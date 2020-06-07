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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>数据大屏展示</title>
		<link rel="stylesheet" type="text/css" href="css/app.css" />
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
		<link rel="stylesheet" type="text/css" href="Picture/laydate.css" />
		<script src="Picture/laydate.js"></script> 
		  <style type="text/css">
	td {height: 28px;};
</style>
	</head>
	<% 
	String st="2019-12-18",et="2020-01-08",kw="";
	 request.setCharacterEncoding("UTF-8");
	 if(request.getParameter("test1")!=null&&request.getParameter("test1").length()>1)
  		 st= request.getParameter("test1");//开始
  	 if(request.getParameter("test2")!=null&&request.getParameter("test2").length()>1)
  	 	et = request.getParameter("test2");//结束
  	if(request.getParameter("kw")!=null&&request.getParameter("kw").length()>1)
  	  	 kw = request.getParameter("kw");//结束
	String sql="select * from wynews   where time between '"+st+"' and '"+et+"'  and title like '%"+kw+"%' and CONVERT(hotnum,SIGNED)>500 order by CONVERT(hotnum,SIGNED) desc";
	String sqlwy="select * from wynews where time between '"+st+"' and '"+et+"'  and con like '%"+kw+"%'  order by CONVERT(hotnum,SIGNED) desc";
	List<WYNews> wys=WYNewsDaoImpl.load(sql);//热点
	List<WYNews> wysAll=WYNewsDaoImpl.load(sqlwy);//普通新闻
	String pers="",acts="",oras="",keys1="",locs="";
	for(WYNews wy:wysAll)
	{
		pers+=wy.getAboutperson();
		acts+=wy.getAboutaction();
		oras+=wy.getAboutora();
		locs+=wy.getAboutloc();
		keys1+=wy.getKeywords();
		keys1+=", ";
	}
	//System.out.println(acts+"mjh");
//	String a=resper.substring(beginIndex);
	String []keyRes1=Nums.ciNum(keys1, ",");//主题词
	String []perRes1=Nums.ciNum(pers, "；");//人物
	String[]oraRes1=Nums.ciNum(oras, "；");//机构
	String []actRes1=Nums.ciNum(acts, "；");//行为
	String []locRes1=Nums.ciNum(locs, "；");//地点	
	String sqlBad="select * from wynews where time !='2019-11-06 20:26:29' and emotion='消极' and (time between '"+st+"' and '"+et+"') and con like '%"+kw+"%'  order by CONVERT(hotnum,SIGNED) desc";
	String sqlGood="select * from wynews where  time !='2019-11-06 20:26:29' and emotion='积极' and (time between '"+st+"' and '"+et+"') and con like '%"+kw+"%'  order by CONVERT(hotnum,SIGNED) desc";
	String sqlGen="select * from wynews where time !='2019-11-06 20:26:29' and  (time between '"+st+"' and '"+et+"') and con like '%"+kw+"%'  and CONVERT(hotnum,SIGNED)>1000 order by CONVERT(hotnum,SIGNED) desc";
	List<WYNews> wysBad=WYNewsDaoImpl.load(sqlBad);
	List<WYNews> wysGood=WYNewsDaoImpl.load(sqlGood);
	List<WYNews> wysGen=WYNewsDaoImpl.load(sqlGen);
session.setAttribute("sqlBad", sqlBad);
session.setAttribute("sqlGood", sqlGood);
	%>
	<body>
		<header id="header">
			<h3 class="header-title" style="margin-top:-2px">新闻舆情监测全景概览</h3>
			<div class="header-info header-info-l">数据日期：<%=st %>——<%=et %></span></div>
			<div class="header-info header-info-r" >
			<form action="BigData.jsp" method="post" class="pull-right position">
					<input type="text"  style="height: 36px;margin-left:-245px; width:102px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;" placeholder="请选择开始日期" id="test1" name="test1">
					<input  type="submit" style="width:50px;height:1px;" value=""/>
					<input type="text"  style="height: 36px;margin-left:3px; width:102px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;" placeholder="请选择结束日期" id="test2" name="test2">
					 <input class="btn btn-primary" type="submit" style="width:100px;height:36px;margin-left:20px" value="检索"/>
			</form>
			</div>
		</header>
		
		<footer id="footer"></footer>
		
		<div id="container">
			<div id="flexCon">
				<div class="flex-row">
					<div class="flex-cell flex-cell-l">
						<div class="chart-wrapper" style="margin-top:-30px">
							<h3 class="chart-title">热度排行Top10</h3>
							<div class="chart-div" id="rankChart" style="height:300px">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-c" style="padding-right:0;margin-left:-120px;margin-top:-70px">
						<div class="chart-wrapper">
							<h3 class="chart-title" style="margin-left:100px;margin-top:80px">涉及区域统计数据</h3>
							<div class="chart-div" id="mapChart" style="width:800px;height:500px;margin-top:-90px;margin-left:-30px">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-c" style="padding-right:0;margin-left:-120px;margin-top:-70px">
						<div class="chart-wrapper">
							<h3 class="chart-title" style="margin-left:190px;margin-top:80px">时间范围内信息统计</h3>
							<div class="chart-div" style=" margin-top:-80px;width:200px; margin-left:170px;height:300px;background: url(image/report01.png) center no-repeat">
								<p style="font-weight: bold; font-size: 18px; color: #ff0000;margin-top:120px;margin-left:65px"><a href="BadNews.jsp" style="color:red">负面舆情</a></p>
								<small style="font-size: 24px;color:#fff;margin-left:74px"><%=wysBad.size() %>条</small>
							</div>
							<div class="chart-div" style=" margin-top:80px;width:200px; margin-left:170px;height:300px;background: url(image/report02.png) center no-repeat">
								<p style="font-weight: bold; font-size: 18px; color: #ff0000;margin-top:120px;margin-left:65px"><a href="goodNews.jsp" >正面舆情</a></p>
								<small style="font-size: 24px;color:#fff;margin-left:74px"><%=wysGood.size() %>条</small>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-r" style="padding-left:0;">
						<div class="chart-wrapper">
							<h3 class="chart-title" style="margin-top:10px;margin-left:-110px">监测范围热点舆情</h3>
				         <div class="flex-cell flex-cell-r" style="padding-left:0;margin-top:-30px">
						<div class="chart-wrapper" style="margin-left:-120px;margin-top:-10pxpx">
									<div style="padding-top: 30px;">
									<table width="590" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="4FBFF9">
										<tr>
											<td width="240" align="center" style="color:#fff">新闻标题</td>
											<td width="180" align="center" style="color:#fff">发表时间</td>
											<td width="70" align="center" style="color:#fff">热度</td>
											<td width="100" align="center" style="color:#fff">操作</td>
										</tr>
									</table>
									</div>
									<div id="demo" style="overflow: hidden; height: 240;">
										<div id="demo1">
											<table width="590" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="4FBFF9">
											<%for(int i=0;i<wysGen.size();i++) {%>
												<tr>
												<%if(wysGen.get(i).getTitle().length()>10){ %>
													<td width="240" align="center" style="color:#fff"><a href="<%=wysGen.get(i).getUrl()%>" style="color:#fff"><%=wysGen.get(i).getTitle().substring(0,10)+"...." %></a></td>
													<%}else{ %>
													<td width="300" align="center" style="color:#fff"><a href="<%=wysGen.get(i).getUrl()%>" style="color:#fff"><%=wysGen.get(i).getTitle() %></a></td>
													<%} %>
													<td width="180" style="color:#fff" align="center" ><%=wysGen.get(i).getTime() %></td>
													<td width="70" style="color:#fff;" align="center" ><%=wysGen.get(i).getHotnum() %></td>
													<td width="100" style="color:#fff;" align="center" ><a href="Location.jsp?title=<%=wysGen.get(i).getTitle() %>">查看分析</a></td>
												</tr>
												<%} %>
											</table>
										</div>
										<div id="demo2"></div>
									</div>
							      </div>
						        </div>
							</div>
						</div>
					</div>
				</div>
				<div class="flex-row">
					<div class="flex-cell flex-cell-lc" style="padding-bottom:0;margin-top:-370px">
						<div  style="margin-top:-50px;width:300px;height:400px">
							<h3 class="chart-title" >近10日舆情情感监控走势</h3>
							<div class="chart-div" id="trendChart" style="margin-top:310px;width:1150px;height:370px">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-r" style="padding-bottom:0;margin-top:-20px">
						<div class="chart-wrapper" style="margin-top:-380px;width:500px">
							<h3 class="chart-title" style="margin-left:30px">监测范围内热词Top</h3>
							<div class="chart-div" id="csrcChart" style="margin-left:160px;height:326px;margin-top:-5px;width:440px; background-image:url(panel.png) ;margin-left:40px;background-size:100% 100%;margin-top:10px;background-repeat:no-repeat ">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/countUp.min.js"></script>
		<script type="text/javascript" src="js/echarts.min.js"></script>
		<script type="text/javascript" src="js/echarts-map-china.js"></script>
		<script type="text/javascript" src="js/echarts-theme-shine.js"></script>
		<script type="text/javascript">
			$(function() {
				//获取当天日期
				(function() {
					const now = new Date();
					const year = now.getFullYear();
					const month = now.getMonth()+1;
					const day = now.getDate();
					$("#nowDate").html(year+"年"+month+"月"+day+"日");
				})();
				
				//获取统计数据
				$.ajax({
					url: "data/count-data.json",
					dataType: "json"
				}).done(function(data) {
					//console.log('Data: ', data);
					rollNum("listedCompany", 0, data.listed_companies_total);
					rollNum("listedSecurity", 0, data.listed_securities_total);
					rollNum("totalMarket", 0, data.total_market_value, 2);
					rollNum("circulationMarket", 0, data.circulation_market_value, 2);
					rollNum("shRatio", 0, data.sh_pe_ratio, 2);
					rollNum("szRatio", 0, data.sz_pe_ratio, 2);
				}).fail(function(jqXHR, textStatus) {
					console.log("Ajax Error: ", textStatus);
				});
				
				//获取排行数据
				const rankChart = echarts.init(document.getElementById("rankChart"), "shine");
				const rankChartOpt = {
					tooltip: {
						trigger: "axis",
						axisPointer: {
							type: "shadow"
						},
						formatter: function(params) {
							const param = params[0];
							const marker = '<span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#e6b600;"></span>';
							const suffix = '<span style="margin-left:5px;font-size:12px;"></span>';
							return param.name + "<br />" +
								marker + "排名：" + (param.dataIndex+1) + "<br />" +
								marker + "热度：" + param.value + suffix;
						}
					},
					grid: {
						top: 10,
						bottom: 10,
						left: 60
					},
					xAxis: {
						show: false,
						type: "value"
					},
					yAxis: {
						type: "category",
						inverse: true,
						axisLine: {show: false},
						axisTick: {show: false},
						axisLabel: {
							fontSize: 12,
							color: "#b0c2f9"
						}
					},
					series: [{
						name: "市价总值排行",
						type: "bar",
						barCategoryGap: "60%",
						label: {
							show: true,
							position: "right",
							fontSize: 12,
							color: "#188df0",
							emphasis: {
								color: "#e6b600"
							}
						},
						itemStyle: {
			                normal: {
			                    color: new echarts.graphic.LinearGradient(
			                        0, 1, 1, 1,
			                        [
			                            {offset: 0, color: '#b0c2f9'},
			                            {offset: 0.5, color: '#188df0'},
			                            {offset: 1, color: '#185bff'}
			                        ]
			                    )
			                },
			                emphasis: {
			                    color: new echarts.graphic.LinearGradient(
			                        0, 1, 1, 1,
			                        [
			                            {offset: 0, color: '#b0c2f9'},
			                            {offset: 0.7, color: '#e6b600'},
			                            {offset: 1, color: '#ceac09'}
			                        ]
			                    )
			                }
			            }
					}]
				};
				rankChart.setOption(rankChartOpt);
				$.ajax({
					url: "data/ranking-list.json",
					dataType: "json"
				}).done(function() {
					$("#rankChart").addClass("chart-done");
				}).done(function(data) {
					//console.log('Data: ', data);
					const xData = [];
					const yData = [];
					<%
					int stop=0;
	            	String sheng="山东，河北，吉林，黑龙江，辽宁，内蒙古，新疆，甘肃，宁夏，山西，陕西，河南，安徽，江苏，浙江，福建，广东，江西，海南，广西，贵州，湖南，湖北，四川，云南，西藏，青海，天津，上海，重庆，北京，台湾，香港";
	            	for(int i=0;i<locRes1.length;i++){
	            		if(sheng.contains(locRes1[i].substring(0,locRes1[i].indexOf("=")))){
	            			stop++;
	            			if(stop>10)
	            				break;
					%>
										xData.push(<%=locRes1[i].substring(locRes1[i].indexOf("=")+1,locRes1[i].length())%>);
										yData.push("<%=locRes1[i].substring(0,locRes1[i].indexOf("="))%>");
					<%}
					}%>
					rankChart.setOption({
						yAxis: {
							data: yData
						},
						series: [{
							name: "市价总值排行",
							data: xData
						}]
					});
				}).fail(function(jqXHR) {
					console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
				});
				
				//预测趋势
				const trendChart = echarts.init(document.getElementById("trendChart"), "shine");
				const trendChartOpt = {
					tooltip: {
						trigger: "axis",
						axisPointer: {
							type: "none"
						}
					},
					legend: {
						left: "center",
						bottom: 3,
						itemWidth: 15,
						itemHeight: 10,
						textStyle: {
							fontSize: 12,
							color: "#b0c2f9"
						},
						data: ["总条数", "正面舆情", "负面舆情"]
					},
					grid: {
						top: 40,
						bottom: 50,
						left: 60,
						right: 60
					},
					xAxis: {
						type: "category",
						axisLine: {
							lineStyle: {color: "#b0c2f9"}
						},
						axisTick: {show: false},
						axisLabel: {
							fontSize: 12,
							color: "#b0c2f9"
						}
					},
					yAxis: [{
						name: "总条数",
						type: "value",
						splitNumber: 5,
						axisLine: {
							lineStyle: {color: "#e74c3c"}//Y轴坐标颜色
						},
						splitLine: {show: false},
						axisTick: {color: "#e74c3c"},
						axisLabel: {
							fontSize: 12,
							color: "#e74c3c",
						}
					}, {
						name: "负面舆情",
						type: "value",
						splitNumber: 5,


						axisLine: {
							lineStyle: {color: "#b0c2f9"}
						},
						splitLine: {show: false},
						axisTick: {color: "#b0c2f9"},
						axisLabel: {
							fontSize: 12,
							color: "#b0c2f9",
						}
					}],
					visualMap: {
				        show: false,
				        seriesIndex: 2,
				        dimension: 0,
				        pieces: [{
				            lte: 9,
				            color: "rgba(176, 58, 91, 1)"
				        }, {
				            gt: 9,
				            lte: 11,
				            color: "rgba(176, 58, 91, 0.5)"
				        }]
				    },
					series: [
						{
						name: "总条数",
						type: "pictorialBar",
						symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
						barCategoryGap: "40%",
						itemStyle: {
							color: function(params) {
								if(params.dataIndex >= 10) {
									return "rgba(119, 96, 246, 0.5)";
								}
								return "rgba(119, 96, 246, 1)";
							}
						   },
						markPoint: {
							itemStyle: {
								color: "rgba(119, 96, 246, 1)"
							},
							data: [{
								name: "最大值",
								type: "max"
							}]
						   },
						markLine: {
							lineStyle: {
								color: "rgba(119, 96, 246, 1)"
							},
							label: {
								position: "middle",
								formatter: "近10日平均舆情数：{c}条"
							},
							data: [{
								name: "平均值",
								type: "average"
							}]
						}
					},
					{
						name: "正面舆情",
						type: "pictorialBar",
						symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
						barCategoryGap: "40%",
						itemStyle: {
							color: function(params) {
								if(params.dataIndex >= 10) {
									return "rgba(230, 182, 0, 0.5)";
								}
								return "rgba(230, 182, 0, 1)";
							}
						},
						markPoint: {
							itemStyle: {
								color: "rgba(230, 182, 0, 1)"
							},
							data: [{
								name: "最大值",
								type: "max"
							}]
						},
						markLine: {
							lineStyle: {
								color: "rgba(230, 182, 0, 1)"
							},
							label: {
								position: "middle",
								formatter: "近10日正面舆情均值：{c}条"
							},
							data: [{
								name: "平均值",
								type: "average"
							}]
						}
					}, {
						name: "负面舆情",
						type: "line",
						yAxisIndex: 1
					}]
				};
				trendChart.setOption(trendChartOpt);
				$.ajax({
					url: "data/month-count.json",
					dataType: "json"
				}).done(function() {
					$("#trendChart").addClass("chart-done");
				}).done(function(data) {
					//console.log('Data: ', data);
					const xData = [];
					const yData1 = [];
					const yData2 = [];
					const yData3 = [];
					/* for(let i in data) {
						xData.push(data[i].month);
						yData1.push(data[i].sh_market_capitalization);
						yData2.push(data[i].sh_transaction_amount);
						yData3.push(data[i].sh_pe_ratio);
					} */
					<%
					//List<WYNews> wysType=WYNewsDaoImpl.loadNum();//查询每种类别的新闻条数
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			        Calendar calendar = Calendar.getInstance();
			        Date date=null;
			        date =(Date) sdf.parse(et);//结束时间
			        calendar.setTime(date);
			        int day=calendar.get(Calendar.DATE);
			        calendar.set(Calendar.DATE,day-10);
			        day=calendar.get(Calendar.DATE);
			        String lastDay = sdf.format(calendar.getTime());
			        String  st1=lastDay;
			        String[]days=new String[12];
					for(int i=0;i<11;i++)
					{
						days[i]=lastDay;
						%>//设定时间
						
						xData.push('<%=lastDay%>');
					<%
					 calendar.set(Calendar.DATE,day+1);
			         day=calendar.get(Calendar.DATE);
			         lastDay = sdf.format(calendar.getTime());
					}
					%>
					<%
					List<WYNews>wysDay=WYNewsDaoImpl.loadDay(st1, et,kw);
					int flag=0,i1=0;
					int []resNum=new int[12];
					for(int i=0;i<wysDay.size();i++)
					{
						if(i1>=12)
							break;
						if(wysDay.get(i).getTime().equals(days[i1]))
						{					
							//System.out.println(days[i1]+"\tmjh "+wysDay.get(i).getTime()+"\tlsd  "+wysDay.get(i).getCount());
							flag+=wysDay.get(i).getCount();
							resNum[i1]=wysDay.get(i).getCount();	
						}
						else
						{
							resNum[i1]=0;
							i--;
						}
						i1++;
					}
					for(int i=0;i<10;i++)
					{
					%>
					yData1.push(<%=resNum[i]%>);				
					<%}%>
					yData1.push(<%=flag/12%>);
				
					<%
					flag=0;i1=0;
					List<WYNews>wysDayJi=WYNewsDaoImpl.loadDayEmo(st1, et,"积极",kw);
					int []resNumJi=new int[12];
					for(int i=0;i<wysDayJi.size();i++)
					{	
						if(i1>=12)
						break;
						if(wysDayJi.get(i).getTime().equals(days[i1]))
						{					
							flag+=wysDayJi.get(i).getCount();
							resNumJi[i1]=wysDayJi.get(i).getCount();	
						}
						else
						{
							resNumJi[i1]=0;
							i--;
						}
						i1++;
					}
						for(int i=0;i<10;i++)
					{
					%>					
					yData2.push(<%=resNumJi[i]%>);
					<%}%>
					yData2.push(<%=flag/12%>);
			
					<%
					flag=0;i1=0;
					List<WYNews>wysDayBad=WYNewsDaoImpl.loadDayEmo(st1, et,"消极",kw);
					int []resNumBad=new int[12];
					for(int i=0;i<wysDayBad.size();i++)
					{
						if(i1>=12)
							break;
							if(wysDayBad.get(i).getTime().equals(days[i1]))
							{					
								flag+=wysDayBad.get(i).getCount();
								resNumBad[i1]=wysDayBad.get(i).getCount();	
							}
							else
							{
								resNumBad[i1]=0;
								i--;
							}
							i1++;
					}
						for(int i=0;i<10;i++)
					{
					%>					
					yData3.push(<%=resNumBad[i]%>);
					<%}%>
					yData3.push(<%=flag/12%>);
		
					trendChart.setOption({
						xAxis: {
							data: xData,
						},
						series: [{
							name: "总条数",
							data: yData1
						}, {
							name: "正面舆情",
							data: yData2
						}, {
							name: "负面舆情",
							data: yData3
						}]
					});
				}).fail(function(jqXHR) {
					console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
				});
				
			
				//浏览器窗口大小变化时，重置报表大小
				$(window).resize(function() {
					rankChart.resize();
					mapChart.resize();
					trendChart.resize();
				});
			});
			
			//数字变化特效
			function rollNum(elId, startVal, endVal, decimalNum) {
				let n = decimalNum || 0;
				let countUp = new CountUp(elId, startVal, endVal, n, 2.5, {
					useEasing: true, 
					useGrouping: true, 
					separator: ',', 
					decimal: '.'
				});
				if(!countUp.error) {
				    countUp.start();
				}else {
				    console.error(countUp.error);
				}
			}
		</script>
	</body>
</html>
<!-- 地图 -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="Picture/echarts.js"></script>
         <script src="Picture/china.js"></script>
		<script src="dataTool.js"></script>
		<script type="text/javascript">
var myChart = echarts.init(document.getElementById('mapChart'));

//注意引入版本
//注意不同版本使用差别

var data = [                        //元素为对象的数组
	<%
	String allWorld="上海，东莞，东营，中山，临汾，临沂，丹东，丽水，乌鲁木齐，佛山，保定，兰州，包头，北京，北海，南京，南宁，南昌，南通，厦门，台州，合肥，呼和浩特，咸阳，哈尔滨，唐山，嘉兴，大同，大连，天津，太原，威海，宁波，宝鸡，宿迁，常州，广州，廊坊，延安，张家口，徐州，德州，惠州，成都，扬州，承德，拉萨，无锡，日照，昆明，枣庄，柳州，株洲，汕头，江门，沈阳，沧州，河源，泉州，泰安，泰州，济南，济宁，海口，淄博，淮安，深圳，清远，温州，渭南，湖州，湘潭，滨州，潍坊，烟台，玉溪，珠海，盐城，盘锦，石家庄，福州，秦皇岛，绍兴，聊城，肇庆，舟山，苏州，莱芜，菏泽，营口，葫芦岛，河北，衢州，西宁，西安，贵阳，连云港，邢台，邯郸，郑州，鄂尔多斯，重庆，金华，铜川，银川，镇江，长春，长沙，长治，阳泉，青岛，韶关，新疆，西藏，黑龙江，吉林，辽宁，内蒙古，宁夏，山西，青海，甘肃，山东，陕西，河南，安徽，江苏，上海，四川，贵州，江西，湖南，浙江，湖北，福建，云南，台湾，广西，广东，香港，澳门，海南";
	for(int i=0;i<locRes1.length;i++)
	{
	//	if(allWorld.contains(locRes1[i].substring(0,locRes1[i].indexOf("="))))
		//{
		%>
		{name:'<%=locRes1[i].substring(0,locRes1[i].indexOf("="))%>',value:<%=locRes1[i].substring(locRes1[i].indexOf("=")+1,locRes1[i].length())%>},
<%//}

	}%>
	 {name: '重庆', value: 10},
]
var geoCoordMap = {                 //对象
		'上海': [121.4648,31.2891],'东莞': [113.8953,22.901],'东营': [118.7073,37.5513],'中山': [113.4229,22.478],'临汾': [111.4783,36.1615],'临沂': [118.3118,35.2936],'丹东': [124.541,40.4242],'丽水': [119.5642,28.1854],'乌鲁木齐': [87.9236,43.5883],'佛山': [112.8955,23.1097],'保定': [115.0488,39.0948],'兰州': [103.5901,36.3043],'包头': [110.3467,41.4899],'北京': [116.4551,40.2539],'北海': [109.314,21.6211],'南京': [118.8062,31.9208],'南宁': [108.479,23.1152],'南昌': [116.0046,28.6633],'南通': [121.1023,32.1625],'厦门': [118.1689,24.6478],'台州': [121.1353,28.6688],'合肥': [117.29,32.0581],'呼和浩特': [111.4124,40.4901],'咸阳': [108.4131,34.8706],'哈尔滨': [127.9688,45.368],'唐山': [118.4766,39.6826],'嘉兴': [120.9155,30.6354],'大同': [113.7854,39.8035],'大连': [122.2229,39.4409],'天津': [117.4219,39.4189],'太原': [112.3352,37.9413],'威海': [121.9482,37.1393],'宁波': [121.5967,29.6466],'宝鸡': [107.1826,34.3433],'宿迁': [118.5535,33.7775],'常州': [119.4543,31.5582],'广州': [113.5107,23.2196],'廊坊': [116.521,39.0509],'延安': [109.1052,36.4252],'张家口': [115.1477,40.8527],'徐州': [117.5208,34.3268],'德州': [116.6858,37.2107],'惠州': [114.6204,23.1647],'成都': [103.9526,30.7617],'扬州': [119.4653,32.8162],'承德': [117.5757,41.4075],'拉萨': [91.1865,30.1465],'无锡': [120.3442,31.5527],'日照': [119.2786,35.5023],'昆明': [102.9199,25.4663],'杭州': [119.5313,29.8773],'枣庄': [117.323,34.8926],'柳州': [109.3799,24.9774],'株洲': [113.5327,27.0319],'武汉': [114.3896,30.6628],'汕头': [117.1692,23.3405],'江门': [112.6318,22.1484],'沈阳': [123.1238,42.1216],'沧州': [116.8286,38.2104],'河源': [114.917,23.9722],'泉州': [118.3228,25.1147],'泰安': [117.0264,36.0516],'泰州': [120.0586,32.5525],'济南': [117.1582,36.8701],'济宁': [116.8286,35.3375],'海口': [110.3893,19.8516],'淄博': [118.0371,36.6064],'淮安': [118.927,33.4039],'深圳': [114.5435,22.5439],'清远': [112.9175,24.3292],'温州': [120.498,27.8119],'渭南': [109.7864,35.0299],'湖州': [119.8608,30.7782],'湘潭': [112.5439,27.7075],'滨州': [117.8174,37.4963],'潍坊': [119.0918,36.524],'烟台': [120.7397,37.5128],'玉溪': [101.9312,23.8898],'珠海': [113.7305,22.1155],'盐城': [120.2234,33.5577],'盘锦': [121.9482,41.0449],'石家庄': [114.4995,38.1006],'福州': [119.4543,25.9222],'秦皇岛': [119.2126,40.0232],'绍兴': [120.564,29.7565],'聊城': [115.9167,36.4032],'肇庆': [112.1265,23.5822],'舟山': [122.2559,30.2234],'苏州': [120.6519,31.3989],'莱芜': [117.6526,36.2714],'菏泽': [115.6201,35.2057],'营口': [122.4316,40.4297],'葫芦岛': [120.1575,40.578],'河北': [115.8838,37.7161],'衢州': [118.6853,28.8666],'西宁': [101.4038,36.8207],'西安': [109.1162,34.2004],'贵阳': [106.6992,26.7682],'连云港': [119.1248,34.552],'邢台': [114.8071,37.2821],'邯郸': [114.4775,36.535],'郑州': [113.4668,34.6234],'鄂尔多斯': [108.9734,39.2487],'重庆': [107.7539,30.1904],'金华': [120.0037,29.1028],'铜川': [109.0393,35.1947],'银川': [106.3586,38.1775],'镇江': [119.4763,31.9702],'长春': [125.8154,44.2584],'长沙': [113.0823,28.2568],'长治': [112.8625,36.4746],'阳泉': [113.4778,38.0951],'青岛': [120.4651,36.3373],'韶关':[113.7964,24.7028],'新疆': [86.61 , 40.79], '西藏':[89.13 , 30.66], '黑龙江':[128.34 , 47.05], '吉林':[126.32 , 43.38], '辽宁':[123.42 , 41.29], '内蒙古':[112.17 , 42.81], '宁夏':[106.27 , 36.76], '山西':[111.95,37.65],'青海':[97.07 , 35.62],'甘肃':[103.82 , 36.05], '山东':[118.01 , 36.37], '陕西':[108.94 , 34.46], '河南':[113.46 , 34.25], '安徽':[117.28 , 31.86], '江苏':[120.26 , 32.54], '上海':[121.46 , 31.28], '四川':[103.36 , 30.65], '湖北':[112.29 , 30.98], '浙江':[120.15 , 29.28], '湖南':[112.08 , 27.79], '江西':[115.89 , 27.97], '贵州':[106.91 , 26.67], '福建':[118.31 , 26.07], '云南':[101.71 , 24.84], '台湾':[121.01 , 23.54], '广西':[108.67 , 23.68], '广东':[113.98 , 22.82],'海南':[110.03 , 19.33],'澳门':[113.54 , 22.19], '香港':[114.17 , 22.32],
}

var convertData = function (data) {
 var res = [];
 for (var i = 0; i < data.length; i++) {
     var geoCoord = geoCoordMap[data[i].name];
     if (geoCoord) {
         res.push({
             name: data[i].name,
             value: geoCoord.concat(data[i].value)   //新值= 坐标+旧值；
         });
     }
 }
 return res;                                         // [113.57, 37.85, 31]
};

option = {

 title: {
     text: '',
     left: 'center',
     textStyle: {
         color: '#fff',
         fontSize:25
     }
 },
 tooltip: {           //提示框组件
     trigger: 'item',
     formatter:'{b} <br/> ',  //{c@[2]}
     show:false
 },

 legend: {            //图例
     orient: 'vertical',
     y: 'bottom',
     x: 'right',
     data: ['危害性'],
     textStyle: {
         color: '#fff'
     }
 },
 geo: {
     map: "china",
     label: {
         emphasis: {
             show: true
         }
     },
     roam: true,
     center:[112.38,37.67],
     zoom:1,
     itemStyle: {
         normal: {
             areaColor: "#727a9c",
             borderColor: "#000000"
         },
         emphasis: {
             areaColor: "#2a333d"
         }
     }
 },
 series: [{
     name: '危险指数：',
     type: 'effectScatter',
     draggable: true,//拖移
     coordinateSystem: 'geo',
     data: convertData(data.sort(function (a, b) {
         return b.value - a.value;
     }).slice(0, <%=locRes1.length*2%>)),    //选取从 start 到数组结尾的所有元素，该方法并不会修改数组，而是返回一个子数组
     symbolSize: function (val) {
         return val[2] / 2;        //res数组中的第三个元素
     },
     showEffectOn: 'render',
     rippleEffect: {
         brushType: 'stroke'
     },
     hoverAnimation: true,
     label: {
         normal: {
             formatter: '{b}:{@2}',
             position: 'right',
             show: false
         },
         emphasis: {
             show: true
         }
     },
     itemStyle: {
         normal: {
             color: '#f4e925',
             shadowBlur: 10,
             shadowColor: '#333'
         }
     },
     zlevel: 1
 }
 ]
};

myChart.setOption(option);
 </script>
 <!-- 循环展示数据 -->
<script type="text/javascript">
var speed = 50;
demo2.innerHTML = demo1.innerHTML;
function Marquee() {
	if (demo2.offsetTop - demo.scrollTop <= 0) {
		demo.scrollTop -= demo1.offsetHeight;
	} else {
		demo.scrollTop++;
	}
}
var MyMar = setInterval(Marquee, speed);

demo.onmouseover = function() {
	clearInterval(MyMar);
}

demo.onmouseout = function() {
	MyMar = setInterval(Marquee, speed);
}
</script>

 <!-- 时间日期控件 -->
<script>
lay('#version').html('-v'+ laydate.v);
//执行一个laydate实例
laydate.render({
  elem: '#test1' //指定元素
});
</script>
<script>
lay('#version').html('-v'+ laydate.v);
//执行一个laydate实例
laydate.render({
  elem: '#test2' //指定元素
});
</script>
<!-- 词云 -->
<script src='js/echarts-wordcloud.js'></script>
<script>
    var chart = echarts.init(document.getElementById('csrcChart'));
    var option = {
    		//backgroundColor:'#000059',
        tooltip: {show:false},
        series: [ 
        	{
            type: 'wordCloud',
            gridSize: 2,
            sizeRange: [12, 50],
            rotationRange: [-90, 90],
            shape: 'pentagon',
            width: 600,
            height: 400,
            drawOutOfBound: false,
            textStyle: {
                normal: {
                    color: function () {
                        return 'rgb(' + [
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160)
                        ].join(',') + ')';
                    }
                },
                	 emphasis: {
                         color: 'red'
                     }
            },
            <%
            String kws="";
            for(WYNews wy:wysGen)
            {
            	kws+=wy.getKeywords();
            	kws+=",";
            }
            String []kwRes=Nums.ciNum(kws, ",");
            int lenkw=0;
            if(kwRes.length>100)
            	lenkw=100;
            else
            	lenkw=kwRes.length;
            %>
            data: [
            	<%for(int i=0;i<lenkw;i++){%>
                {
                    name: '<%=kwRes[i].substring(0,kwRes[i].indexOf("="))%>',
                    value: <%=kwRes[i].substring(kwRes[i].indexOf("=")+1,kwRes[i].length())%>
                },
            <%}%>
            ]
        } ]
    };

    chart.setOption(option);
    chart.on('click', function (params) {
        var data=params.value
        //点没有source属性
        if(data.source==undefined){
            nodeName=params.name
            window.open("BigData.jsp?kw="+nodeName)
        }

});
    window.onresize = chart.resize;
        </script>