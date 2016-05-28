<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/common/taglibs.jsp"%>

<div class="panelBar">
	<div class="pages">
		<span>每页 </span>
		<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
			<c:forEach begin="10" end="40" step="10" varStatus="s">
				<option value="${s.index}" ${result.pager.pageSize eq s.index ? 'selected="selected"' : ''}>${s.index}</option>
			</c:forEach>
		</select>
		<span>条，总共: ${result.pager.recordCount} 条</span>
	</div>
	
	<div class="pagination" targetType="navTab" totalCount="${result.pager.recordCount}" numPerPage="${result.pager.pageSize}" pageNumShown="10" currentPage="${result.pager.pageNumber}"></div>
</div>