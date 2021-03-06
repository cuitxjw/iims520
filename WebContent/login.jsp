<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>智能报警管理平台</title>
<link href="${ctx}/themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript">

function login()
{
	$.ajax({
		url : "${ctx}/user/login",
		dataType : "json",
		type : "POST",
		data : $("#loginForm").serialize(),
		success : function(result){
			 if(result.ok){
				 window.location = "${ctx}/index";
			 }else{
				 alert(result.msg);
			 }
		},
		error : function(request){
			alert(request);
		}
		});
}

$(function(){
	$("#login_bar").click(login);
})
</script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<a href="http://demo.dwzjs.com"><img src="themes/default/images/login_logo.png" /></a>
			</h1>
			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="#">设为首页</a></li>
						<li><a href="#">反馈</a></li>
						<li><a href="#" target="_blank">帮助</a></li>
					</ul>
				</div>
				<h2 class="login_title"><img src="themes/default/images/login_title.png" /></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginDiv">
				<form action="#" id="loginForm">
					<p>
						<label>用户名：</label>
						<input type="text" name="username" id="username" size="20" class="login_input" value="admin" />
					</p>
					<p>
						<label>密码：</label>
						<input type="password" name="password" id="password" size="20" class="login_input" value="123456"/>
					</p>
					<p>
						<label>验证码：</label>
						<input class="code" type="text" size="5" />
						<span><img src="themes/default/images/header_bg.png" alt="" width="75" height="24" /></span>
					</p>
					<div class="login_bar">
						<input class="sub" type="button" value=" " id="loginBtn" onclick="login()" />
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="themes/default/images/login_banner.png" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="#">忘记密码怎么办？</a></li>
					<li><a href="#">为什么登录失败？</a></li>
				</ul>
				<div class="login_inner">
					<p>XXXXXXXXXXXX</p>
					<p>XXXXXXXXXXXXXXXXXXXXXXXX。</p>
					<p>CCCCCCCCCCCCCCCCCCCCC…</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2016 www.yuham.com Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>