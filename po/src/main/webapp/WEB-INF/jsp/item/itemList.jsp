<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>업체관리</title>
<script>
	function fn_searchFormSubmit() {
		document.searchForm.submit();
	}
	function fn_deleteItemFormSubmit() {
		document.deleteItemForm.submit();
	}
	function selectBoxChanged() {
		var selectedValue = document.getElementById("selectBox").value;
		document.getElementById("hiddenKeyword").value = selectedValue;
		fn_searchFormSubmit();
	}
	function fn_createItemFormSubmit() {
		document.createItemForm.submit();
	}
</script>
</head>
<body>
	<form id="searchForm" name="searchForm" method="post">
		<select id="selectBox" onchange="selectBoxChanged();"
			name="selectBoxTag">
			<c:forEach var="i" items="${vendorList}">
				<option value="${i.id}"
					${i.id == searchVO.hiddenKeyword ? 'selected="selected"' : '' }>${i.name}</options>
			</c:forEach>
		</select> <br>
		<jsp:include page="/WEB-INF/jsp/common/pagingforSubmit.jsp" />

		<div>
			<input type="hidden" id="hiddenKeyword" name="hiddenKeyword"
				value="${searchVO.hiddenKeyword}" /> <input type="hidden"
				name="searchType" value="name" checked="checked" /> <label
				class="chkselect" for="searchType1">품목명</label> <input type="text"
				name="searchKeyword" style="width: 150px;" maxlength="50"
				value='<c:out value="${searchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) { fn_searchFormSubmit();}">
			<input name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_searchFormSubmit()" />
		</div>
	</form>

	<form id="createItemForm" name="createItemForm" action="itemForm"
		method="post">
		<input type="hidden" id="vendor" name="vendor"
			value="${searchVO.hiddenKeyword}" /> <input name="btn_create"
			value="품목생성" class="btn_create" type="button"
			onclick="fn_createItemFormSubmit()" />
	</form>

	<form id="deleteItemForm" name="deleteItemForm" action="deleteItems"
		method="post">
		<table border="1" style="width: 1200px">
			<caption>품목목록</caption>
			<colgroup>
				<col width='3%' />
				<col width='15%' />
				<col width='15%' />
				<col width='15%' />
				<col width='15%' />
				<col width='10%' />
				<col width='10%' />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>번호</th>
					<th>업체명</th>
					<th>품목명</th>
					<th>단가</th>
					<th>생성일시</th>
					<th>수정일시</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listview" items="${listview}" varStatus="status">
					<c:url var="link" value="itemRead">
						<c:param name="id" value="${listview.id}" />
					</c:url>

					<tr>
						<td><input type="checkbox" name="delete_item_ids"
							value="${listview.id}" /></td>
						<td><c:out
								value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
						</td>
						<td><c:out value="${listview.vendorName}" /></td>
						<td><a href="${link}"><c:out
									value="${listview.getShortTitle(35)}" /></a></td>
						<td><c:out value="${listview.unitPrice}" /></td>
						<td><c:out value="${listview.createDateTime}" /></td>
						<td><c:out value="${listview.updateDateTime}" /></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<input name="btn_delete" value="삭제" class="btn_del" type="button"
			onclick="fn_deleteItemFormSubmit()" />
	</form>
</body>
</html>
