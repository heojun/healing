<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>vendor</title>
</head>
<body>
	<table border="1" style="width: 600px">
		<caption>업체정보</caption>
		<colgroup>
			<col width='15%' />
			<col width='*%' />
		</colgroup>
		<tbody>
			<tr>
				<td>name</td>
				<td><c:out value="${vendorInfo.name}" /></td>
			</tr>
			<tr>
				<td>address</td>
				<td><c:out value="${vendorInfo.address}" /></td>
			</tr>
			<tr>
				<td>tel</td>
				<td><c:out value="${vendorInfo.tel}" /></td>
			</tr>
			<tr>
				<td>bName</td>
				<td><c:out value="${vendorInfo.bName}" /></td>
			</tr>
			<tr>
				<td>accountNo</td>
				<td><c:out value="${vendorInfo.accountNo}" /></td>
			</tr>
			<tr>
				<td>bAddress</td>
				<td><c:out value="${vendorInfo.bAddress}" /></td>
			</tr>
			<tr>
				<td>bank</td>
				<td><c:out value="${vendorInfo.bank}" /></td>
			</tr>
			<tr>
				<td>swiftCode</td>
				<td><c:out value="${vendorInfo.swiftCode}" /></td>
			</tr>
			<tr>
				<td>createDateTime</td>
				<td><c:out value="${vendorInfo.createDateTime}" /></td>
			</tr>
			<tr>
				<td>updateDateTime</td>
				<td><c:out value="${vendorInfo.updateDateTime}" /></td>
			</tr>
		</tbody>
	</table>
	<a href="#" onclick="history.back(-1)">돌아가기</a>
	<a href="vendorDelete?id=<c:out value="${vendorInfo.id}"/>">삭제</a>
	<a href="vendorForm?id=<c:out value="${vendorInfo.id}"/>">수정</a>
</body>
</html>
