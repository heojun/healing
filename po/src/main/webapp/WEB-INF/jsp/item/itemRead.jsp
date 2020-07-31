<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="assets/css/table.css">
	<link rel="stylesheet" href="assets/css/button.css">
<title>품목정보</title>
</head>
<body>
	<table>
		<caption>품목정보</caption>
		<colgroup>
			<col width='15%' />
			<col width='*%' />
		</colgroup>
		<tbody>
			<tr>
				<td>품목명</td>
				<td><c:out value="${itemInfo.name}" /></td>
			</tr>
			<tr>
				<td>업채명</td>
				<td><c:out value="${itemInfo.vendorName}" /></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><c:out value="${itemInfo.unitPrice}" /></td>
			</tr>
			<tr>
				<td>생성일시</td>
				<td><c:out value="${itemInfo.createDateTime}" /></td>
			</tr>
			<tr>
				<td>수정일시</td>
				<td><c:out value="${itemInfo.updateDateTime}" /></td>
			</tr>
		</tbody>
	</table>

	<button type="button""
		onClick="location.href='itemDelete?id=<c:out value="${itemInfo.id}"/>'">삭제</button>
	<button type="button"
		onClick="location.href='itemForm?id=<c:out value="${itemInfo.id}"/>&vendor=<c:out value="${itemInfo.vendor}"/>'">수정</button><br>
	<button type="button" onClick="history.back(-1)">뒤로</button>
	<button type="button" onClick="location.href='index.jsp'"/>메인으로</button>
</body>
</html>
