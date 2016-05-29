<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${ctx}/user/query">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${result.pager.pageSize}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
	
	<input type="hidden" name="keywords" value="${param.keywords}"/>
	<input type="hidden" name="name" value="${param.userName}"/>
</form>

<form method="post" action="${ctx}/user/query" onsubmit="return navTabSearch(this)">
	
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>姓名：</label>
					<input type="text" name="name" value="${param.keywords}"/>
				</li>
				<li>
					<label>状态：</label>
					<select name="status">
						<option value="">All</option>
						<option value="ACTIVE" ${'ACTIVE' eq param.status ? 'selected="selected"' : ''}>ACTIVE</option>
						<option value="INACTIVE" ${'INACTIVE' eq param.status ? 'selected="selected"' : ''}>INACTIVE</option>
					</select>
				</li>
			</ul>
			<div class="subBar">
				<ul>						
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
					<li><a class="button" href="/management/user!advancedSearch.do?userType=TRAINING" target="dialog" title="Advanced Search"><span>高级查询</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" target="dialog" rel="userNav" href="${ctx}/user/doAdd" title="添加用户"><span>添加</span></a></li>
			<li><a class="edit" target="dialog" rel="userNav" href="${ctx}/user/doUpdate?id={slt_uid}" ><span>修改</span></a></li>
			<li><a class="delete" target="ajaxTodo" href="${ctx}/user/delete?id={slt_uid}" title="Are you sure remove?"><span>删除</span></a></li>
			<li><a class="delete" target="selectedTodo" rel="ids" href="" ><span>批量删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="/management/user!export.do" target="dwzExport" targetType="navTab" title="Are you sure export?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	
	<table class="table" layoutH="138" width="100%">
		<thead>
			<tr>
			    <th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="50">序号</th>
				<th width="100" orderField="name" class="${param.orderField eq 'name' ? param.orderDirection : ''}">姓名</th>
				<th width="100" >性别</th>
				<th width="100" orderField="loginName" class="${param.orderField eq 'loginName' ? param.orderDirection : ''}">登录名</th>
				<th>出生日期</th>
				<th orderField="email" class="${param.orderField eq 'email' ? param.orderDirection : ''}">Email</th>
				<th width="100">手机</th>
				<th width="150" orderField="createTime" class="${param.orderField eq 'createTime' ? param.orderDirection : ''}">Create Date</th>
				<th    >Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${result.list}" varStatus="st">
			<tr target="slt_uid" rel="${item.id}">
				<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${st.count}</td>
				<td>${item.name}</td>
				<td>${item.sex eq 'M'?'男':'女'}</td>
				<td>${item.loginName}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.birthDate}"/></td>
				<td>${item.email}</td>
				<td>${item.phone}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createTime}"/></td>
				<td>${item.state}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 分页 -->
	<c:import url="../pager/panelBar.jsp"></c:import>
	
</div>


