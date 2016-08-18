<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div style="padding: 5px;">
	<div layoutH="26"
		style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #CCC; line-height: 21px; background: #fff">
		<form method="post" action="demo/common/ajaxDone.html"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this)">
			<ul class="tree treeFolder treeCheck expand" layoutH="62" id="customTree" 
				oncheck="doClick">
				<li><a tname="name" tvalue="0">功能菜单树</a>
					<ul>
						<li><a tname="name" tvalue="value1" checked="true"
							href="menu/doAdd" target="ajax" rel="jbsxBox">用户管理</a>
							<ul>
								<li><a tname="name" tvalue="test1.1">Test 1.1</a></li>
								<li><a tname="name" tvalue="test1.2" checked="true">Test
										1.2</a></li>
							</ul></li>
						<li><a tname="name" tvalue="value2">报警管理</a>
							<ul>
								<li><a tname="name" tvalue="test1.1">Test 1.1</a></li>
								<li><a tname="name" tvalue="test1.2" checked="true">Test
										1.2</a></li>
							</ul></li>
						<li><a tname="name" tvalue="value3">视频监控</a>
							<ul>
								<li><a tname="name" tvalue="test1.1">Test 1.1</a></li>
								<li><a tname="name" tvalue="test1.2" checked="true">Test
										1.2</a></li>
							</ul></li>
						<li><a tname="name" tvalue="value4">电子地图</a>
							<ul>
								<li><a tname="name" tvalue="test1.1">Test 1.1</a></li>
								<li><a tname="name" tvalue="test1.2" checked="true">Test
										1.2</a></li>
							</ul></li>
						<li><a tname="name" tvalue="value5">设备管理</a>
							<ul>
								<li><a tname="name" tvalue="test1.1">Test 1.1</a></li>
								<li><a tname="name" tvalue="test1.2" checked="true">Test
										1.2</a></li>
							</ul></li>
					</ul></li>
			</ul>

		</form>
		<div class="formBar">
			<ul>
				<li><label><input type="radio" name="r1" />添加子菜单</label></li>
				<li><label><input type="radio" name="r1" />修改菜单</label></li>
			</ul>
		</div>
	</div>

	<div id="jbsxBox" class="unitBox" style="margin-left: 246px;">
		<!--#include virtual="list1.html" -->
	</div>
</div>
<script type="text/javascript">
function doClick(){
	var json = arguments[0], result="";
 	alert(json.items[0]);

	$(json.items).each(function(i){
		result += "<p>name:"+this.name + " value:"+this.value+" text: "+this.text+"</p>";
	});
	//$("#resultBox").html(result);
	
}
</script>