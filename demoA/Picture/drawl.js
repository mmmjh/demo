function getOption(graphInfo){
//给节点设置样式
graphInfo.nodes.forEach(function (node) {
    node.x = node.y = null;
    node.draggable = true;
});


title=graphInfo['title']
nodes=graphInfo['nodes']
links=graphInfo['links']
categories=graphInfo['categories']

//设置option样式
option = {
    title : {
        text:title,
        x:'right',
        y:'bottom'
    },
    tooltip : {
        trigger: 'item',
        formatter: '{a} : {b}'
    },
    color:['#4F94CD','#19c7b9','#c7b919','#c71969','#f0f894','#8a1570'],
    toolbox: {
        show : true,
        feature : {
            restore : {show: true},
            magicType: {show: true, type: ['force', 'chord']},
            saveAsImage : {show: true}
        }
    },
    legend: {
        x: 'left',
        data: categories.map(function (a) {//显示策略
            return a.name;
        })
    },
    series : [
        {
            type:'force',
            name : title,
            ribbonType: false,
            categories : categories,
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#333'
                        }
                    },
                    nodeStyle : {
                        brushType : 'both',
                        borderColor : '#fff',
                        borderWidth : 1
                    },
                    linkStyle: {
                        type: 'curve'
                    }
                },

                emphasis: {
                    label: {
                        show: false
                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                    },
                    nodeStyle : {
                        //r: 30
                    },
                    linkStyle : {}
                }
            },
            useWorker: false,
            minRadius : 15,
            maxRadius : 35,
            gravity: 1.1,
            scaling: 1.1,
            roam: true,
            nodes:nodes,
            links :links
        }
    ]
};
return option   
}
function createGraph(myChart,mygraph){
//设置option样式
option=getOption(mygraph)
//使用Option填充图形
myChart.setOption(option);
//点可以跳转页面
myChart.on('click', function (params) {
            var data=params.value
            //点没有source属性
            if(data.source==undefined){
                nodeName=params.name
                window.open("http://www.baidu.com")
            }

});
//myChart.hideLoading();
}
