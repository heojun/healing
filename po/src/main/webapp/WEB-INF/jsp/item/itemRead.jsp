<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>품목정보</title>
</head>
<body>
	<table border="1" style="width: 600px">
		<caption>품목정보</caption>
		<colgroup>
			<col width='15%' />
			<col width='*%' />
		</colgroup>
		<tbody>
			<tr>
				<td>name</td>
				<td><c:out value="${itemInfo.name}" /></td>
			</tr>
			<tr>
				<td>vendor</td>
				<td><c:out value="${itemInfo.vendorName}" /></td>
			</tr>
			<tr>
				<td>unitPrice</td>
				<td><c:out value="${itemInfo.unitPrice}" /></td>
			</tr>
			<tr>
				<td>createDateTime</td>
				<td><c:out value="${itemInfo.createDateTime}" /></td>
			</tr>
			<tr>
				<td>updateDateTime</td>
				<td><c:out value="${itemInfo.updateDateTime}" /></td>
			</tr>
		</tbody>
	</table>
	<a href="#" onclick="history.back(-1)">돌아가기</a>
	<a href="itemDelete?id=<c:out value="${itemInfo.id}"/>">삭제</a>
	<a href="itemForm?id=<c:out value="${itemInfo.id}"/>">수정</a>
</body>
</html>
