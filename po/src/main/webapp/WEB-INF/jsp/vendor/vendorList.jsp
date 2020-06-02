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
	function fn_deleteVendorFormSubmit() {
		document.deleteVendorForm.submit();
	}
</script>
</head>
<body>
	<a href="vendorForm">업체생성</a>
	<form id="deleteVendorForm" name="deleteVendorForm" action="deleteVendors" method="post">
		<table border="1" style="width: 1200px">
			<caption>업체목록</caption>
			<colgroup>
				<col width='3%' />
				<col width='15%' />
				<col width='12%' />
				<col width='5%' />
				<col width='10%' />
				<col width='10%' />
				<col width='5%' />
				<col width='5%' />
				<col width='5%' />
				<col width='10%' />
				<col width='10%' />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>번호</th>
					<th>업체명</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>수익자명</th>
					<th>계좌번호</th>
					<th>수익자주소</th>
					<th>은행명</th>
					<th>은행코드</th>
					<th>생성일시</th>
					<th>수정일시</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listview" items="${listview}" varStatus="status">
					<c:url var="link" value="vendorRead">
						<c:param name="id" value="${listview.id}" />
					</c:url>

					<tr>
						<td><input type="checkbox" name="delete_vendor_ids"
							value="${listview.id}" /></td>
						<td><c:out
								value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
						</td>
						<td><a href="${link}"><c:out
									value="${listview.getShortTitle(35)}" /></a></td>
						<td><c:out value="${listview.address}" /></td>
						<td><c:out value="${listview.tel}" /></td>
						<td><c:out value="${listview.bName}" /></td>
						<td><c:out value="${listview.accountNo}" /></td>
						<td><c:out value="${listview.bAddress}" /></td>
						<td><c:out value="${listview.bank}" /></td>
						<td><c:out value="${listview.swiftCode}" /></td>
						<td><c:out value="${listview.createDateTime}" /></td>
						<td><c:out value="${listview.updateDateTime}" /></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<input name="btn_delete" value="삭제" class="btn_del" type="button"
			onclick="fn_deleteVendorFormSubmit()" />
	</form>
	<form id="searchForm" name="searchForm" method="post">
		<jsp:include page="/WEB-INF/jsp/common/pagingforSubmit.jsp" />

		<div>
			<input type="hidden" name="searchType" value="name" checked="checked"/>
			<label class="chkselect" for="searchType1">업체명</label> 
			<input
				type="text" name="searchKeyword" style="width: 150px;"
				maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) { fn_searchFormSubmit();}"> 
			<input
				name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_searchFormSubmit()" />
		</div>
	</form>
</body>
</html>
