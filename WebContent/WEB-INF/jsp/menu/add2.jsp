<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<form method="post" action="${ctx}/menu/add?navTabId=userLiNav&callbackType=closeCurrent" class="required-validate pageForm" onsubmit="return validateCallback(this, navTabAjaxDone);">
<div class="pageContent" layoutH="26" style="float:right; display:block; overflow:auto;  border:solid 1px #CCC; line-height:21px; background:#fff" >
	<div class="pageFormContent" layoutH="82">
	
		<p>
			<label>菜单名称</label>
			<input type="text" name="name" class="required" size="30" />
		</p>
		<p>
			<label>链接(href)</label>
			<input type="text" name="href" class="required" size="30" />
		</p> 
		<p>
			<label>目标(target)</label>
			<input type="text" name="target" class="required" size="30" />
		</p>
		<p>
			<label>引用(rel)</label>
			<input type="text" name="rel" class="required" size="30" />
		</p>
		<p>
			<label>图标(icon)</label>
			<input type="text" name="icon" class="required" size="30" value=""/>
		</p>

		<p>
			<label>样式(classz)</label>
			<input type="text" name="classz" class="required" size="30" value=""/>
		</p>
		<p>
			<label>上级菜单</label>
			<input type="text" name="parent.id"  size="30" value=""/>
		</p>
		<p>
			<label>状态</label>
			<select name="state" class="combox">
				<option value="ACTIVE">启用</option>
				<option value="INACTIVE">禁用</option>
			</select>
		</p>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保 存</button></div></div></li>
		</ul>
	</div>
	</div>
</form>
