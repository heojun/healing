<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="assets/css/table.css">
	<link rel="stylesheet" href="assets/css/button.css">
<title>업체관리</title>
<script>
	function fn_searchFormSubmit() {
		document.searchForm.submit();
	}
	function fn_deleteVendorFormSubmit() {
		document.deleteVendorForm.submit();
	}
	function fn_createVendorFormSubmit() {
		document.createVendorForm.submit();
	}
</script>
</head>
<body>
	<form id="searchForm" name="searchForm" method="post">
		<jsp:include page="/WEB-INF/jsp/common/pagingforSubmit.jsp" />

		<div>
			<input type="hidden" name="searchType" value="name" checked="checked" />
			<label class="chkselect" for="searchType1">업체명</label> <input
				type="text" name="searchKeyword" style="width: 150px;"
				maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) { fn_searchFormSubmit();}">
			<input name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_searchFormSubmit()" />
		</div>
	</form>
	<br>
	
	<form id="createVendorForm" name="createVendorForm" action="vendorForm"
		method="post">
		<input name="btn_create"
			value="업체생성" class="btn_create" type="button"
			onclick="fn_createVendorFormSubmit()" />
	</form>
	<br>
	<form id="deleteVendorForm" name="deleteVendorForm"
		action="deleteVendors" method="post">
		<table class="TABLE" style="text-align:center">
			<thead>
				<tr>
					<th width="3%"></th>
					<th width="5%">번호</th>
					<th width="20%">업체명</th>
					<th width="20%">주소</th>
					<th width="8%">전화번호</th>
					<th width="8%">수익자명</th>
					<th width="8%">계좌번호</th>
					<th width="8%">수익자주소</th>
					<th width="8%">은행명</th>
					<th width="8%">은행코드</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listview" items="${listview}" varStatus="status">
					<c:url var="link" value="vendorRead">
						<c:param name="id" value="${listview.id}" />
					</c:url>

					<tr>
						<td width="3%"><input type="checkbox" name="delete_vendor_ids"
							value="${listview.id}" /></td>
						<td width="5%"><c:out
								value="${status.index+1}" />
						</td>
						<td width="20%"><a href="${link}"><c:out
									value="${listview.getShortTitle(35)}" /></a></td>
						<td width="20%"><c:out value="${listview.address}" /></td>
						<td width="8%"><c:out value="${listview.tel}" /></td>
						<td width="8%"><c:out value="${listview.bName}" /></td>
						<td width="8%"><c:out value="${listview.accountNo}" /></td>
						<td width="8%"><c:out value="${listview.bAddress}" /></td>
						<td width="8%"><c:out value="${listview.bank}" /></td>
						<td width="8%"><c:out value="${listview.swiftCode}" /></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<input name="btn_delete" value="삭제" type="button"
			onclick="fn_deleteVendorFormSubmit()" />
	</form>
	<button type="button" onClick="history.back(-1)">뒤로</button>
	<button type="button" onClick="location.href='index.jsp'"/>메인으로</button>
</body>
</html>
