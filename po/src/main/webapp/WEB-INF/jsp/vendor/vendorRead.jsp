<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="assets/css/table.css">
	<link rel="stylesheet" href="assets/css/button.css">
<title>vendor</title>
</head>
<body>
	<table>
		<caption>업체정보</caption>
		<colgroup>
			<col width='20%' />
			<col width='*%' />
		</colgroup>
		<tbody>
			<tr>
				<td>업체명</td>
				<td><c:out value="${vendorInfo.name}" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:out value="${vendorInfo.address}" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><c:out value="${vendorInfo.tel}" /></td>
			</tr>
			<tr>
				<td>수익자명</td>
				<td><c:out value="${vendorInfo.bName}" /></td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td><c:out value="${vendorInfo.accountNo}" /></td>
			</tr>
			<tr>
				<td>수익자주소</td>
				<td><c:out value="${vendorInfo.bAddress}" /></td>
			</tr>
			<tr>
				<td>은행명</td>
				<td><c:out value="${vendorInfo.bank}" /></td>
			</tr>
			<tr>
				<td>은행코드</td>
				<td><c:out value="${vendorInfo.swiftCode}" /></td>
			</tr>
			<tr>
				<td>통화단위</td>
				<td><c:out value="${vendorInfo.currencyCode}" /></td>
			</tr>
			<tr>
				<td>생성일시</td>
				<td><c:out value="${vendorInfo.createDateTime}" /></td>
			</tr>
			<tr>
				<td>수정일시</td>
				<td><c:out value="${vendorInfo.updateDateTime}" /></td>
			</tr>
			<tr>
					<td>첨부</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					</td> 
				</tr>
		</tbody>
	</table>

	<button type="button"
		onClick="location.href='vendorDelete?id=<c:out value="${vendorInfo.id}"/>'">삭제</button>
	<button type="button"
		onClick="location.href='vendorForm?id=<c:out value="${vendorInfo.id}"/>'">수정</button><br>
	<button type="button" onClick="history.back(-1)">뒤로</button>
	<button type="button" onClick="location.href='index.jsp'"/>메인으로</button>
</body>
</html>
