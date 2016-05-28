<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<h2 class="contentTitle">编辑用户</h2>
<form method="post" action="${ctx}/user/update?navTabId=userLiNav&callbackType=closeCurrent" class="required-validate pageForm" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageFormContent" layoutH="97">
		<input type="hidden" name="id" value="${user.id}"/>
		<p>
			<label>姓名</label><span class="unit">${user.name}</span>
		</p>
		<p>
			<label>Password</label>
			<input type="text" name="password" class="required" size="30" maxlength="20" value="${user.password}"/>
		</p>
		<p>
			<label>Title</label>
			<select name="sex">
				<option value="M" ${'M' eq user.sex ? 'selected="selected"' : ''}>男</option>
				<option value="W" ${'W' eq user.sex ? 'selected="selected"' : ''}>女</option>
			</select>
		</p>
		<p>
			<label>E-Mail</label>
			<input type="text" name="email" class="required email" size="30" value="${user.email}"/>
		</p>
		<p>
			<label>登录名</label>
			<input type="text" name="loginName" class="required" size="30" value="${user.loginName}"/>
		</p>
		<p>
			<label>身份证号</label>
			<input type="text" name="idCard" class="required" size="30" value="${user.idCard}"/>
		</p>
		<p>
			<label>手机</label>
			<input type="text" name="phone" class="required" size="30" value="${user.phone}"/>
		</p>
		<p>
			<label>出生日期</label>
			<input type="text" name="birthDate" format="yyyy-MM-dd" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birthDate}"/>' class="date required" yearstart="-80" yearend="0" />
			<a class="inputDateButton" href="#">Choose</a>
		</p>
		<p>
			<label>Status</label>
			<select name="state">
				<option value="ACTIVE" ${'ACTIVE' eq user.state ? 'selected="selected"' : ''}>ACTIVE</option>
				<option value="INACTIVE" ${'INACTIVE' eq user.state ? 'selected="selected"' : ''}>INACTIVE</option>
			</select>
		</p>
		

		<%-- <div class="divider"></div>
		
		<table class="userRole">
		<tr><th colspan="2">Roles</th></tr>
		<c:forEach var="item" items="${allRoles}" varStatus="s">
		<tr>
			<td width="10">
				<input type="checkbox" value="${item.id}" name="roleIds" id="userRole_${item.id}" ${elutil:contains(item, user.roles) ? "checked" : ""} />
			</td>
			<td><label for="userRole_${item.id}">${item.description}</label></td>
		</tr>
		</c:forEach>
		</table> --%>
		

	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">Save</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">Close</button></div></div></li>
		</ul>
	</div>
</form>