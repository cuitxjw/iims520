<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>${title}</title>

<link href="themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="uploadify/css/uploadify.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" />
<![endif]-->

<script src="js/speedup.js" type="text/javascript"></script>
<script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="xheditor/xheditor-1.2.2.min.js" type="text/javascript"></script>
<script src="uploadify/scripts/swfobject.js" type="text/javascript"></script>
<script src="uploadify/scripts/jquery.uploadify.min.js" type="text/javascript"></script>

<script src="js/dwz.min.js" type="text/javascript"></script>
<script src="js/dwz.regional.zh.js" type="text/javascript"></script> 

<script type="text/javascript">
$(function(){	
	DWZ.init("dwz.frag.xml", {
		//loginUrl:"/management/index!login.do", loginTitle:"Login",	// 弹出登录对话框
		loginUrl:"login.html",	// 跳到登录页面
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"});
		}
	});
});
//清理浏览器内存,只对IE起效,FF不需要
if ($.browser.msie) {
	window.setInterval("CollectGarbage();", 10000);
}
function logout(){
	window.location = "${ctx}/";
}
</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="javascript:void(0)">Logo</a>
				<ul class="nav">
					<li><a href="/">首页</a></li>
					<li><a href="${ctx}/user/info" target="dialog" mask="true">用户信息</a></li>
					<li><a href="${ctx}/user/updatePwd" target="dialog" mask="true">修改密码</a></li>
					<li><a href="${ctx}/user/logout" target="ajaxTodo" title="确定要退出么?" callback="logout">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">blue</div></li>
					<li theme="green"><div>green</div></li>
					<li theme="purple"><div>purple</div></li>
					<li theme="silver"><div>silver</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
		</div>
		
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>功能菜单</h2><div>collapse</div></div>
			
				<div class="accordion" fillSpace="sideBar">
					<div class="accordionHeader">
						<h2><span>Folder</span>用户管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${ctx}/user/doAdd" target="navTab" rel="userNav">添加用户</a></li>
							<li><a href="${ctx}/user/doQuery" target="navTab" rel="userLiNav">查询用户</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>权限管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/news!add.do" target="navTab" rel="newsNav">角色管理</a></li>
							<li><a href="/management/news!list.do" target="navTab" rel="newsLiNav">授权管理</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>系统管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/website!edit.do" target="navTab" rel="website">系统参数配置</a></li>
							<li><a href="${ctx}/menu/doList" target="navTab" rel="pageLiNav">菜单配置</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>报警管理</h2>					
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/category!list.do" target="navTab" rel="categoryLiNav">历史报警</a></li>
						</ul>
					</div>
			
				</div>
				
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:void(0)"><span><span class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:void(0)">My Home</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div>
						<div class="accountInfo">
							<div class="right">
								<p><fmt:formatDate value="${model.now}" pattern="dd MMMM yyyy, EEEE"/></p>
							</div>
							<p><span>Welcome, ${ctx} ${contextUser.firstName} ${contextUser.lastName}</span></p>
							<p>${contextUser.email}</p>
						</div>						
						<div class="pageFormContent" layoutH="80">
							<p>
								<label>Username:</label><span class="unit">${contextUser.userName}</span>
							</p>
							<p>
								<label>First Name:</label><span class="unit">${contextUser.firstName}</span>
							</p>
							<p>
								<label>Last Name:</label><span class="unit">${contextUser.lastName}</span>
							</p>
							<p>
								<label>Phone:</label><span class="unit">${contextUser.phone}</span>
							</p>
							<p>
								<label>Post Code:</label><span class="unit">${contextUser.postcode}</span>
							</p>
							<p>
								<label>Email:</label><span class="unit">${contextUser.email}</span>
							</p>
							
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	
	<div id="footer"><s:text name="ui.copyrights" /></div>


</body>
</html>