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
<html style="height: 100%">
<head>
       <meta charset="utf-8">
   </head>
   <body style="height: 100%; margin: 0">
       <div id="container" style="width:1358px;height:500px"></div>
      	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    	 <script src="echarts.min.js"></script>
		<script src="dataTool.js"></script>
		
		<%
		SimpleDateFormat sdFormat2=new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar2=Calendar.getInstance();
        String now=sdFormat2.format(calendar2.getTime());
        calendar2.add(Calendar.DATE,-29);
        String st2=sdFormat2.format(calendar2.getTime());//开始时间
    	String et2=sdFormat2.format(calendar2.getTime());//结束时间   	 
        String [] news1=new String[30];
        String [] news2=new String[30];
        String [] news3=new String[30];
        String [] news4=new String[30];
        String [] news5=new String[30];
        String max="select * from wynews where time between '"+st2+"' and '"+now+"' order by CONVERT(hotnum,SIGNED) desc limit 1";
        List<WYNews> maxNum=WYNewsDaoImpl.load(max);
        int day=0;
        for(int i=0;i<30;i++){
        	 st2=et2;
       	  	 calendar2.add(Calendar.DATE,+1);
       	 	 et2=sdFormat2.format(calendar2.getTime());//上一次的结束时间是下一次的开始时间
        	List<WYNews> wysTime=WYNewsDaoImpl.loadTimeEveryDay(st2, et2);
        	for(int j=0;j<wysTime.size();j++)
        	{
        		if(j%5==0)
        			news1[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"\'";
        		else if(j%5==1)
        			news2[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'";
        		else if(j%5==2)
        			news3[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'";
        		else if(j%5==3)
        			news4[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'";
        		else if(j%5==4)
        			news5[i]="'"+wysTime.get(j).getTime()+"',"+wysTime.get(j).getHotnum()+","+wysTime.get(j).getHotnum()+",'"+wysTime.get(j).getTitle()+"'"; 
        	}
        }
		%>
		
<script type="text/javascript">
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			var dataBJ = [
			 	<%for(int i=0;i<30;i++){%>
			    [<%=news1[i]%>],
			    <%}%> 
			];
			
			var dataGZ = [
		<%for(int i=0;i<30;i++){%>
			    [<%=news2[i]%>],
			    <%}%>  
			];
			
			var dataSH = [
				<%for(int i=0;i<30;i++){%>
			    [<%=news3[i]%>],
			    <%}%> 
			];
			var dataS4 = [
				<%for(int i=0;i<30;i++){%>
					    [<%=news4[i]%>],
					    <%}%>  
					];
					
					var dataG5 = [
						<%for(int i=0;i<30;i++){%>
					    [<%=news5[i]%>],
					    <%}%> 
					];
			var schema = [
			    {name: 'date', index: 0, text: '日'},
			    {name: 'AQIindex', index: 1, text: '热度'},
			];
			
			
			var itemStyle = {
			    normal: {
			        opacity: 0.8,
			        shadowBlur: 10,
			        shadowOffsetX: 0,
			        shadowOffsetY: 0,
			        shadowColor: 'rgba(0, 0, 0, 0.5)'
			    }
			};
			
			option = {
			    backgroundColor: '#404a59',
			    color: [
			        '#dd4444', '#fec42c', '#0e62c7','#7a1b78','#407739'
			    ],
			    legend: {
			        y: 'top',
			        data: ['今日话题Top1', '今日话题Top2', '今日话题Top3', '今日话题Top4', '今日话题Top5'],
			        textStyle: {
			            color: '#fff',
			            fontSize: 16
			        }
			    },
			    grid: {
			        x: '10%',
			        x2: 150,
			        y: '18%',
			        y2: '10%'
			    },
			    tooltip: {
			        padding: 10,
			        backgroundColor: '#222',
			        borderColor: '#777',
			        borderWidth: 1,
			        formatter: function (obj) {
			            var value = obj.value;
			            return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
			                + obj.seriesName + '   ' + value[0] + '日    '
			                + schema[1].text + '：' + value[1]
			                + '</div>'
			                + value[3] + '<br>';
			        }
			    },
			    xAxis: {
			        type: 'category',
			        name: '日期',
			        nameGap: 16,
			        nameTextStyle: {
			            color: '#fff',
			            fontSize: 14
			        },
			        max:30,//设置日期最大
			        splitLine: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#eee'
			            }
			        },
			    },
			    yAxis: {
			    	max:<%=maxNum.get(0).getHotnum()%>,
			    	min:100,
			    	 splitNumber :10,
			        type: 'value',
			        name: '事件热度',
			        nameLocation: 'end',
			        nameGap: 30,
			        nameTextStyle: {
			            color: '#fff',
			            fontSize: 16
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#eee'
			            }
			        },
			        splitLine: {
			            show: false
			        }
			    },
			    visualMap: [
			        {
			            left: 'right',
			            top: '10%',
			            dimension: 2,
			            min: 0,
			            max: 5000,//圆形大小
			            itemWidth: 30,
			            itemHeight: 120,
			            calculable: true,
			            precision: 0.1,
			            text: ['圆形大小：热度'],
			            textGap: 30,
			            textStyle: {
			                color: '#fff'
			            },
			            inRange: {
			                symbolSize: [10, 70]
			            },
			            outOfRange: {
			                symbolSize: [10, 70],
			                color: ['rgba(255,255,255,.2)']
			            },
			            controller: {
			                inRange: {
			                    color: ['#c23531']
			                },
			                outOfRange: {
			                    color: ['#444']
			                }
			            }
			        },
			        {
			            left: 'right',
			            bottom: '5%',
			            dimension: 2,
			            min: 0,
			            max: 4000,//颜色深浅
			            itemHeight: 120,
			            calculable: true,
			            precision: 0.1,
			            text: ['明暗：热度'],
			            textGap: 30,
			            textStyle: {
			                color: '#fff'
			            },
			            inRange: {
			                colorLightness: [1, 0.5]
			            },
			            outOfRange: {
			                color: ['rgba(255,255,255,.2)']
			            },
			            controller: {
			                inRange: {
			                    color: ['#c23531']
			                },
			                outOfRange: {
			                    color: ['#444']
			                }
			            }
			        }
			    ],
			    series: [

			        {
			            name: '今日话题Top1',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataBJ,
			        }, 
			        {
			            name: '今日话题Top2',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataSH
			        },
			        {
			            name: '今日话题Top3',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataGZ
			        }, 
			        {
			            name: '今日话题Top4',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataS4
			        },
			        {
			            name: '今日话题Top5',
			            type: 'scatter',
			            itemStyle: itemStyle,
			            data: dataG5
			        }
			
			    ]
			};;
			myChart.on("click", function (param){  
		      	  var name=param.value;
		      	window.location.href="./NewFile.jsp?name="+name;
		      });
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
</script>
   </body>
</html>