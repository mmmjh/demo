<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta charset="utf-8">
<title>热点话题追踪</title>
</head>
<%
String s1="2019-11-06 11:39:31+36&&&2019-11-06 12:31:02+59&&&2019-11-06 12:31:02+59&&&2019-11-06 12:32:18+35&&&2019-11-06 12:32:18+35&&&2019-11-06 14:02:31+0&&&2019-11-06 14:02:31+0&&&2019-11-06 14:12:49+1252&&&2019-11-06 14:12:49+1252&&&2019-11-06 14:38:22+28&&&2019-11-06 14:38:22+28&&&2019-11-06 14:45:46+344&&&2019-11-06 14:45:46+344&&&2019-11-06 16:06:29+667&&&2019-11-06 16:06:29+667&&&2019-11-06 16:42:37+2483&&&2019-11-06 20:07:45+3&&&2019-11-06 20:07:45+3&&&2019-11-06 20:18:28+140&&&2019-11-06 20:26:29+199&&&2019-11-06 20:26:29+199&&&2019-11-07 07:14:40+79&&&2019-11-07 07:14:40+79&&&2019-11-07 07:17:44+861&&&2019-11-07 07:17:44+861&&&2019-11-07 07:34:08+62&&&2019-11-07 07:34:08+62&&&2019-11-07 07:53:35+1780&&&2019-11-07 08:12:43+471&&&2019-11-07 08:12:43+471&&&2019-11-07 08:24:26+9&&&2019-11-07 08:24:26+9&&&2019-11-07 09:43:13+532&&&2019-11-07 09:43:13+532&&&2019-11-07 09:45:14+37&&&2019-11-07 09:45:14+37&&&2019-11-07 11:24:27+25&&&2019-11-07 12:33:41+1&&&2019-11-07 12:33:41+1&&&2019-11-07 14:03:07+0&&&2019-11-07 14:03:07+0&&&2019-11-07 16:11:44+0&&&2019-11-07 16:18:49+22&&&2019-11-07 16:18:49+22&&&2019-11-07 20:00:51+0&&&2019-11-07 20:00:51+0&&&2019-11-07 20:30:11+597&&&2019-11-07 20:30:11+597&&&2019-11-07 22:00:07+8&&&2019-11-07 22:00:07+8&&&2019-11-08 07:42:26+593&&&2019-11-08 07:42:26+593&&&2019-11-08 08:12:00+288&&&2019-11-08 08:12:00+288&&&2019-11-08 10:39:59+10&&&2019-11-08 10:39:59+10&&&2019-11-08 11:00:17+411&&&2019-11-08 11:01:41+2385&&&2019-11-08 11:25:47+1&&&2019-11-08 11:25:47+1&&&2019-11-08 13:38:51+3238&&&2019-11-08 13:38:51+3238&&&2019-11-08 14:05:35+0&&&2019-11-08 20:05:22+1179&&&2019-11-08 20:05:22+1179&&&2019-11-09 10:26:25+43&&&2019-11-09 10:51:39+2&&&2019-11-09 13:24:08+1200&&&2019-11-09 14:56:17+0&&&2019-11-09 14:57:00+7&&&2019-11-09 16:47:52+77&&&2019-11-10 11:14:16+118&&&2019-11-10 11:53:43+0&&&2019-11-10 13:18:09+0&&&2019-11-10 14:36:44+569&&&2019-11-10 18:47:13+169&&&2019-11-10 18:52:52+3&&&2019-11-10 19:14:22+85&&&2019-11-11 00:12:58+1775&&&2019-11-11 01:27:43+6&&&2019-11-11 09:44:40+12&&&2019-11-11 10:39:55+184&&&2019-11-11 13:20:29+5&&&2019-11-11 16:31:13+0&&&2019-11-11 16:40:31+0";
String[]TimeHot =s1.split("&&&");//分割出多条相关新闻
String []times=new String[TimeHot.length];
String []hotnum=new String[TimeHot.length];
for(int timei=0;timei<TimeHot.length;timei++)
{
	 times[timei]=TimeHot[timei].substring(0, TimeHot[timei].indexOf(" "));//切割时间到日以便于统计
	hotnum[timei]=TimeHot[timei].substring(TimeHot[timei].indexOf("+")+1,TimeHot[timei].length());//切割热度
	//System.out.println(TimeHot[timei].substring(0, TimeHot[timei].indexOf(" "))+"\t"+TimeHot[timei].substring(TimeHot[timei].indexOf("+")+1,TimeHot[timei].length()));
}
String []timeend=new String[TimeHot.length];
int []numend=new int[TimeHot.length];
boolean ishave=false;
for(int i=0;i<times.length;i++)
{
	if(i==0)
	{
		timeend[i]=times[i];
		numend[i]= Integer.parseInt(hotnum[i]);
	}//第一个直接插入
	else
	{
		 ishave=false;
		for(int j=i-1;j>=0;j--)
		{
			if(times[i].equals(timeend[j]))
			{
				ishave=true;
				numend[j]+= Integer.parseInt(hotnum[i]);
			}
		}
		if(ishave==false)
		{
			timeend[i]=times[i];
			numend[i]= Integer.parseInt(hotnum[i]);
		}
	}	
}
String []timeend1=new String[TimeHot.length];
int []numend1=new int[TimeHot.length];
int ii=0;
for(int i=0;i<timeend.length;i++)
{
	if(timeend[i]!="null"&&numend[i]!=0){
		timeend1[ii]=timeend[i];
		numend1[ii]=numend[i];
		ii++;
	}
}

for(int i=0;i<timeend1.length;i++)
	System.out.println("第qq"+i+"次："+timeend1[i]+"\t"+numend1[i]);
%>
<body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
       <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '多 X 轴示例';
var colors = ['#5793f3', '#d14a61', '#675bba'];
option = {
    color: colors,
    tooltip: {
    	trigger: 'axis'
    },
    legend: {
        data:['热点话题1', '热点话题2','热点话题3']
    },
    grid: {
        top: 70,
        bottom: 50
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['周一','周二','周三','周四','周五','周六','周日'],
        axisLine: {
            onZero: true,
            }
    },
    xAxis: [
    	 {
             type: 'category',
             axisTick: {
                 alignWithLabel: true
             },
             axisLine: {
                 onZero: true,
                 lineStyle: {
                     color: colors[1]
                 }
             },
             axisPointer: {
                 label: {
                     formatter: function (params) {
                         return '话题1热度  ' + params.value
                             + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
                     }
                 }
             },
             data: ['1','2','3','4','5','6']
         },
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                onZero: true,
                lineStyle: {
                    color: colors[0]
                }
            },
            axisPointer: {
                label: {
                    formatter: function (params) {
                        return '话题2热度：  ' + params.value
                            + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
                    }
                }
            },
            data: ['1','2','3','4','5','6']
        },
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true,
                center: ['50%', '25%'],
            },
            axisLine: {
                onZero: true,
                lineStyle: {
                    color: colors[2]
                }
            },
            axisPointer: {
                label: {
                    formatter: function (params) {
                        return '话题3热度：  ' + params.value
                            + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
                    }
                }
            },
            data: ["0",
                <%for(int i=0;i<ii;i++)
                {
               	 %>
               	 "<%=timeend1[i]%>",
               	 <%
                }
                %>
             ]
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series: [
        {
            name:'热点话题1',
            type:'line',
            xAxisIndex: 1,
            smooth: true,
            data: [6328,4771,2233,1778,1200,800]
        },
        {
            name:'热点话题2',
            type:'line',
            smooth: true,
            data: [
                <%for(int i=0;i<ii;i++)
                {
               	 %>
               	 <%=numend1[i]%>,
               	 <%
                }
                %>
             ]
        },
        {
            name:'热点话题3',
            type:'line',
            smooth: true,
            data: [0,3456,3333,4319,2190,1900],
            
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
   </body>
</html>