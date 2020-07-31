<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="assets/css/table.css">
	<link rel="stylesheet" href="assets/css/button.css">
<title>vendor</title>
<script>
function fn_formSubmit(){
	var form1 = document.form1;
	
	if (form1.name.value=="") {
		alert("업체명을 입력해주세요.");
		form1.name.focus();
		return;
	}
	
	document.form1.submit();	
} 
</script>
</head>
<body>
	<form name="form1" action="vendorSave" method="post" enctype="multipart/form-data">
		<table>
			<caption>업체생성</caption>
			<colgroup>
				<col width='20%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>업체명</td> 
					<td><input type="text" name="name" value="<c:out value="${vendorInfo.name}"/>"></td> 
				</tr>
				<tr>
					<td>주소</td> 
					<td><input type="text" name="address" value="<c:out value="${vendorInfo.address}"/>"></td> 
				</tr>
				<tr>
					<td>전화번호</td> 
					<td><input type="text" name="tel" value="<c:out value="${vendorInfo.tel}"/>"></td> 
				</tr>
				<tr>
					<td>수익자명</td> 
					<td><input type="text" name="bName" value="<c:out value="${vendorInfo.bName}"/>"></td> 
				</tr>
				<tr>
					<td>계좌번호</td> 
					<td><input type="text" name="accountNo" value="<c:out value="${vendorInfo.accountNo}"/>"></td> 
				</tr>
				<tr>
					<td>수익자주소</td> 
					<td><input type="text" name="bAddress" value="<c:out value="${vendorInfo.bAddress}"/>"></td> 
				</tr>
				<tr>
					<td>은행명</td> 
					<td><input type="text" name="bank" value="<c:out value="${vendorInfo.bank}"/>"></td> 
				</tr>
				<tr>
					<td>은행코드</td> 
					<td><input type="text" name="swiftCode" value="<c:out value="${vendorInfo.swiftCode}"/>"></td> 
				</tr>
				<tr>
					<td>통화단위</td> 
					<td><input type="text" name="currencyCode" value="<c:out value="${vendorInfo.currencyCode}"/>"></td> 
				</tr>
				<tr>
					<td>첨부</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">
							<input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					
						<input type="file" name="uploadfile" multiple="" />
					</td> 
				</tr>
			
			</tbody>
		</table>    
		<input type="hidden" name="id" value="<c:out value="${vendorInfo.id}"/>"> 
		<button type="button" onClick="fn_formSubmit()">저장</button><br>
		<button type="button" onClick="history.back(-1)">뒤로</button>
	<button type="button" onClick="location.href='index.jsp'"/>메인으로</button>
	</form>	
</body>
</html>
