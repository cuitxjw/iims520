<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<form method="post" action="${ctx}/menu/doList" id="treeForm" onsubmit="return navTabSearch(this)">
<div style="padding: 5px;" class="pageContent">
	<div layoutH="26"
		style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #CCC; line-height: 21px; background: #fff">
		
			<ul class="tree treeFolder " layoutH="62" id="customTree" >
				<li><a tname="顶级菜单" tvalue="0" >功能菜单树</a>
					<ul>
					<c:forEach items="${rq}" var="v" >
						<c:if test="${v.parentId == 0 }">
						 	<li><a tname="${v.name}" tvalue="${v.id}" href="menu/doEdit?id=${v.id }" target="ajax" rel="jbsxBox" checked="true" ><c:out value="${v.name }" /></a>
								<ul>	
									<c:forEach items="${rq}" var="sub" >
															 
											<c:if test="${sub.parentId==v.id}" >
							 				<li><a tname="${sub.name}" tvalue="${sub.id }" checked="true"
												href="menu/doEdit?id=${sub.id }" target="ajax" rel="jbsxBox"><c:out value="${sub.name }" /></a>
											</li>
									</c:if>
									</c:forEach>
								</ul>
							</li>
						</c:if>
					</c:forEach>
			</ul>

	</div>
		<a target="dialog" height="350" width="450" href="" rel="pageNav" mask="true" id="newMenu" style="display:none;">新建菜单</a>
	<div id="jbsxBox" class="unitBox" style="margin-left: 246px;">
		<!--#include virtual="list1.html" -->
	</div>
</div>

</form>
<script type="text/javascript">

var tree = $("#customTree a");

tree.contextMenu("customTreeCM",{
	bindings:{
		createCM :function(tree){
			var oldUrl = "menu/doAdd?parentId=";
			var id = tree.attr("tvalue");
			var href = oldUrl;
			var url = href+id;
			//alert(url);
			$("#newMenu").attr("href",url); 
			$("#newMenu").click();
			
		}
	}
});

function doClick(){
	var json = arguments[0], result="";
 	//alert(json.items[0]);

	$(json.items).each(function(i){
		result += "<p>name:"+this.name + " value:"+this.value+" text: "+this.text+"</p>";
	});
	//alert(result);
	//$("#resultBox").html(result);
	
}
</script>