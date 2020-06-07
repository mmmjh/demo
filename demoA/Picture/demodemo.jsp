<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>左划出现删除按钮，右滑隐藏</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
// 设定每一行的宽度=屏幕宽度+按钮宽度
$(".line-scroll-wrapper").width($(".line-wrapper").width() + $(".line-btn-delete").width());
// 设定常规信息区域宽度=屏幕宽度
$(".line-normal-wrapper").width($(".line-wrapper").width());
// 设定文字部分宽度（为了实现文字过长时在末尾显示...）
$(".line-normal-msg").width($(".line-normal-wrapper").width() - 280);

// 获取所有行，对每一行设置监听
var lines = $(".line-normal-wrapper");
var len = lines.length; 
var lastX, lastXForMobile;

// 用于记录被按下的对象
var pressedObj; // 当前左滑的对象
var lastLeftObj; // 上一个左滑的对象

// 用于记录按下的点
var start;

// 网页在移动端运行时的监听
for (var i = 0; i < len; ++i) {
lines[i].addEventListener('touchstart', function(e){
lastXForMobile = e.changedTouches[0].pageX;
pressedObj = this; // 记录被按下的对象

// 记录开始按下时的点
var touches = event.touches[0];
start = { 
x: touches.pageX, // 横坐标
y: touches.pageY // 纵坐标
};
});

lines[i].addEventListener('touchmove',function(e){
// 计算划动过程中x和y的变化量
var touches = event.touches[0];
delta = {
x: touches.pageX - start.x,
y: touches.pageY - start.y
};

// 横向位移大于纵向位移，阻止纵向滚动
if (Math.abs(delta.x) > Math.abs(delta.y)) {
event.preventDefault();
}
});

lines[i].addEventListener('touchend', function(e){
if (lastLeftObj && pressedObj != lastLeftObj) { // 点击除当前左滑对象之外的任意其他位置
$(lastLeftObj).animate({marginLeft:"0"}, 500); // 右滑
lastLeftObj = null; // 清空上一个左滑的对象
}
var diffX = e.changedTouches[0].pageX - lastXForMobile;
if (diffX < -150) {
$(pressedObj).animate({marginLeft:"-132px"}, 500); // 左滑
lastLeftObj && lastLeftObj != pressedObj && 
$(lastLeftObj).animate({marginLeft:"0"}, 500); // 已经左滑状态的按钮右滑
lastLeftObj = pressedObj; // 记录上一个左滑的对象
} else if (diffX > 150) {
if (pressedObj == lastLeftObj) {
$(pressedObj).animate({marginLeft:"0"}, 500); // 右滑
lastLeftObj = null; // 清空上一个左滑的对象
}
}
});
}

// 网页在PC浏览器中运行时的监听
for (var i = 0; i < len; ++i) {
$(lines[i]).bind('mousedown', function(e){
lastX = e.clientX;
pressedObj = this; // 记录被按下的对象
});

$(lines[i]).bind('mouseup', function(e){
if (lastLeftObj && pressedObj != lastLeftObj) { // 点击除当前左滑对象之外的任意其他位置
$(lastLeftObj).animate({marginLeft:"0"}, 500); // 右滑
lastLeftObj = null; // 清空上一个左滑的对象
}
var diffX = e.clientX - lastX;
if (diffX < -150) {
$(pressedObj).animate({marginLeft:"-132px"}, 500); // 左滑
lastLeftObj && lastLeftObj != pressedObj && 
$(lastLeftObj).animate({marginLeft:"0"}, 500); // 已经左滑状态的按钮右滑
lastLeftObj = pressedObj; // 记录上一个左滑的对象
} else if (diffX > 150) {
if (pressedObj == lastLeftObj) {
$(pressedObj).animate({marginLeft:"0"}, 500); // 右滑
lastLeftObj = null; // 清空上一个左滑的对象
}
}
});
}
});
</script>
<style type="text/css">
* { margin: 0; padding: 0; }
.line-wrapper { width: 100%; height: 144px; overflow: hidden; font-size: 28px; border-bottom: 1px solid #aaa; }
.line-scroll-wrapper { white-space: nowrap; height: 144px; clear: both; }
.line-btn-delete { float: left; width: 132px; height: 144px; }
.line-btn-delete button { width: 100%; height: 100%; background: red; border: none; font-size: 24px; font-family: 'Microsoft Yahei'; color: #fff; }
.line-normal-wrapper { display: inline-block; line-height: 100px; float: left; padding-top: 10px; padding-bottom: 10px; }
.line-normal-icon-wrapper { float: right; width: 120px; height: 120px; margin-right: 12px; }
.line-normal-icon-wrapper img { width: 120px; height: 120px; }
.line-normal-avatar-wrapper { width: 100px; height: 124px; float: left; margin-left: 12px; }
.line-normal-avatar-wrapper img { width: 92px; height: 92px; border-radius: 60px; }
.line-normal-left-wrapper { float: left; overflow: hidden; }
.line-normal-info-wrapper { float: left; margin-left: 10px; }
.line-normal-user-name { height: 28px; line-height: 28px; color: #4e4e4e; margin-top: 7px; }
.line-normal-msg { height: 28px; line-height: 28px; overflow:hidden; text-overflow:ellipsis; color: #4e4e4e; margin-top: 11px; }
.line-normal-time { height: 28px; line-height: 28px; color: #999; margin-top: 11px; }
</style>
</head>
<body>
<div class="line-wrapper">
<div class="line-scroll-wrapper">
<div class="line-normal-wrapper">
<div class="line-normal-left-wrapper">
<div class="line-normal-avatar-wrapper"><img src="1.jpg" /></div>
<div class="line-normal-info-wrapper">
<div class="line-normal-user-name">蜡笔小新</div>
<div class="line-normal-msg">在同行的小伙伴中提到了你</div>
<div class="line-normal-time">1分钟前</div>
</div>
</div>
<div class="line-normal-icon-wrapper"><img src="5.jpg"/></div>
</div>
<div class="line-btn-delete"><button>删除</button></div>
</div>
</div>
<div class="line-wrapper">
<div class="line-scroll-wrapper">
<div class="line-normal-wrapper">
<div class="line-normal-left-wrapper">
<div class="line-normal-avatar-wrapper"><img src="2.jpg" /></div>
<div class="line-normal-info-wrapper">
<div class="line-normal-user-name">乔巴</div>
<div class="line-normal-msg">你看不到我哦</div>
<div class="line-normal-time">1分钟前</div>
</div>
</div>
<div class="line-normal-icon-wrapper"><img src="6.jpg"/></div>
</div>
<div class="line-btn-delete"><button>删除</button></div>
</div>
</div>
<div class="line-wrapper">
<div class="line-scroll-wrapper">
<div class="line-normal-wrapper">
<div class="line-normal-left-wrapper">
<div class="line-normal-avatar-wrapper"><img src="3.jpg" /></div>
<div class="line-normal-info-wrapper">
<div class="line-normal-user-name">贱行贱远</div>
<div class="line-normal-msg">回忆里想起模糊的小时候，云朵漂浮在蓝蓝的天空，那时的你说，要和我手牵手，一起走到时间的尽头</div>
<div class="line-normal-time">1分钟前</div>
</div>
</div>
<div class="line-normal-icon-wrapper"><img src="7.jpg"/></div>
</div>
<div class="line-btn-delete"><button>删除</button></div>
</div>
</div>
<div class="line-wrapper">
<div class="line-scroll-wrapper">
<div class="line-normal-wrapper">
<div class="line-normal-left-wrapper">
<div class="line-normal-avatar-wrapper"><img src="4.png" /></div>
<div class="line-normal-info-wrapper">
<div class="line-normal-user-name">小黄人</div>
<div class="line-normal-msg">哈哈哈哈哈……暑假来看小黄人电影哦~哈哈哈……</div>
<div class="line-normal-time">1分钟前</div>
</div>
</div>
<div class="line-normal-icon-wrapper"><img src="8.jpg"/></div>
</div>
<div class="line-btn-delete"><button>删除</button></div>
</div>
</div>
</body>
</html>