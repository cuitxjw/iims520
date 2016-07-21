<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<h2 class="contentTitle">添加菜单</h2>
<form method="post" action="${ctx}/menu/add?navTabId=userLiNav&callbackType=closeCurrent" class="required-validate pageForm" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="97">
	
		<p>
			<label>姓名</label>
			<input type="text" name="name" class="required" size="30" />
		</p>
		<p>
			<label>密码</label>
			<input type="text" name="password" class="required" size="30" maxlength="20" value=""/>
		</p> 
		<p>
			<label>性别</label>
			<select name="sex" class="combox">
				<option value="M">男</option>
				<option value="W">女</option>
			</select>
		</p>
		<p>
			<label>E-Mail</label>
			<input type="text" name="email" class="required email" size="30" value=""/>
		</p>
		<p>
			<label>登录名</label>
			<input type="text" name="loginName" class="required" size="30" value=""/>
		</p>

		<p>
			<label>手机</label>
			<input type="text" name="phone" class="required" size="30" value=""/>
		</p>
		<p>
			<label>出生日期</label>
			<input type="text" name="birthDate" class="date required" size="30" yearstart="-80" yearend="0" format="yyyy-MM-dd" />
			<a class="inputDateButton" href="#">Choose</a>
		</p>
		<p>
			<label>身份证号</label>
			<input type="text" name="idCard" class="required" size="30" value=""/>
		</p>
		<p>
			<label>用户状态</label>
			<select name="state" class="combox">
				<option value="ACTIVE">启用</option>
				<option value="INACTIVE">禁用</option>
			</select>
		</p>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保 存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>